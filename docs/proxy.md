# Running behind an HTTP egress proxy

Kubescape needs a few hosts on the internet, and its components also call each other inside the cluster.
Behind a proxy the first kind of traffic must use the proxy and the second must not.

## What each component needs

| Component | Hosts it needs | Calls it makes inside the cluster |
|-----------|----------------|-----------------------------------|
| `kubevuln` | `grype.anchore.io` for the vulnerability database. Registries of scanned images, when no SBOM exists for an image. | Kubernetes API |
| `kubescape` (scanner) | `github.com` and `release-assets.githubusercontent.com` for the policy library, `*.sigstore.dev` to verify it. | Kubernetes API |
| `operator` | None. | `kubevuln:8080` and `kubescape:8080` over plain HTTP, Kubernetes API |
| schedulers, `node-agent`, `storage`, `prometheus-exporter` | None. | Kubernetes API |

All external hosts are HTTPS.
The proxy must allow the hosts in the table; a proxy that works from an allowlist needs them added.

`kubevuln` exits and restarts when it cannot download the vulnerability database.
Its log then says `database does not exist`, which hides the real download error.

The operator and the scanner do not contact the Kubescape version check service (`version-check.ks-services.co`): this chart sets `KS_SKIP_UPDATE_CHECK` on the operator and `kubescape-operator.kubescape.skipUpdateCheck`.

## Clusters where proxy settings are injected into every pod

Giant Swarm management clusters behind a proxy run the `inject-proxy-env` Kyverno policy from [kyverno-policies-connectivity](https://github.com/giantswarm/kyverno-policies-connectivity).
It adds `HTTP_PROXY`, `HTTPS_PROXY` and `NO_PROXY` to every container when a pod is created.

The injected `NO_PROXY` covers `*.svc` names, the cluster domain and the pod and service networks.
It does not cover a bare Service name such as `kubevuln`, so the operator's calls would go to the proxy and never arrive.
The operator would then wait forever with `Waiting for vuln scan to be ready` as its last log line, and no vulnerability scan would start.

This chart therefore opts the operator out of the injection with the pod annotation `policies.kyverno.io/inject-proxy-env: exclude`.
`kubevuln` and the scanner keep the injected settings, because they are the components that need the proxy.

The annotation does nothing on clusters without the policy.

Proxy settings that the chart sets itself have no effect on these clusters: the policy replaces any `NO_PROXY` a pod already has.

## Clusters without injection

Set the proxy through the upstream chart's own values:

```yaml
global:
  httpsProxy: http://proxy.example.com:3128
  noProxy: .svc,.cluster.local
```

This sets `HTTPS_PROXY` and `no_proxy` on the operator, `kubevuln`, the scanner and the `node-agent`.
The chart puts the bare Service names and the Kubernetes API address in front of your `noProxy` list.
It does not set `HTTP_PROXY`, so the plain HTTP calls between components stay direct.

If the proxy re-signs TLS traffic, pass its CA certificate with `global.proxySecretFile`.
