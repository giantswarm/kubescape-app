# Operator-managed node-agent DaemonSets

By default Helm creates one `node-agent` DaemonSet for the whole cluster.
With `kubescape-operator.nodeAgent.autoscaler.enabled: true` the kubescape operator creates the DaemonSets instead.
This mode is off by default.

## Why use it

A DaemonSet updates one node at a time, so on a large cluster a node-agent update takes longer than a Helm upgrade is allowed to.
The upgrade then times out and is rolled back, although nothing is wrong.
In this mode Helm does not own the DaemonSets, so an upgrade finishes as soon as the Deployments are ready and the node-agent pods are replaced afterwards.

## What changes

- Helm installs a ConfigMap, `node-agent-daemonset-template`, in place of the `node-agent` DaemonSet.
- The operator creates one DaemonSet per value of the node label `node.kubernetes.io/instance-type`, named `node-agent-<instance type>`.
  Nodes without that label share `node-agent-default`.
- The operator re-applies the DaemonSets when nodes change, when the template changes and every five minutes.
- Each DaemonSet still updates one node at a time, but the DaemonSets update in parallel.
- Pods keep the labels that the `node-agent` Service, the ServiceMonitor, the PodLogs and the NetworkPolicy select on.

List the DaemonSets the operator manages:

```bash
kubectl -n kubescape get daemonsets -l kubescape.io/managed-by=operator-autoscaler
```

## What you give up

Helm and Flux no longer see node-agent.
A node-agent that fails to roll out, or a DaemonSet the operator could not create, does not fail the HelmRelease.
Watch the DaemonSets yourself, for example through `kube_daemonset_status_number_unavailable` for `node-agent.*` in the `kubescape` namespace.
The operator logs `reconciliation failed` when it cannot create or update a DaemonSet.

## Sizing

Despite the name, the operator does not measure usage.
For each DaemonSet it takes a percentage of the allocatable CPU and memory of the smallest node in the group and keeps the result between a minimum and a maximum.
All pods of one DaemonSet get the same requests and limits.
`nodeAgent.resources` is not used in this mode.

| | Requests | Limits |
|---|---|---|
| CPU | 2% of the node, at least 100m | 15% of the node, at most 2 |
| Memory | 2% of the node, at least 600Mi (see below) | 25% of the node, at most 4Gi |

These are the upstream defaults, except for the two limit percentages, which upstream sets to 5.
We raised them because measured node-agent peaks do not shrink with node size: on a 4 vCPU, 8 GiB node the upstream limits come out at 170m and 600Mi, less than the agent uses there.
The memory minimum is the upstream default of 180Mi, which the upstream chart raises to 600Mi while node SBOM generation is enabled and the separate `sbomScanner` sidecar is not, as in this chart's defaults.
Setting `minResources.memory` to anything other than `180Mi` turns that raise off.

A 4 vCPU, 16 GiB node gets requests of 100m and 600Mi and limits of about 510m and 3.4Gi.
Change the numbers under `kubescape-operator.nodeAgent.autoscaler` (`resourcePercentages`, `minResources`, `maxResources`); the percentages must be whole numbers.

## Policy exception

The DaemonSet template takes only CPU and memory for the node-agent container, and no size limit for its `data` and `profiles` emptyDir volumes.
The pods therefore cannot satisfy the Kyverno policy `require-emptydir-requests-and-limits`.
While this mode is enabled the chart adds the `PolicyException` `node-agent-daemonset-emptydir` for DaemonSets named `node-agent-*`.
It is removed again when the mode is turned off, and it is not created when `exceptions.enabled` is `false`.

The exception is created in the same upgrade that enables the mode and deleted in the upgrade that disables it.
Giant Swarm clusters run this policy in `Audit` mode, so the worst case is a policy report entry for pods created before the exception took effect, or for the operator's DaemonSets that are still there after disabling.
Where the policy is set to `Enforce`, node-agent pods can be rejected in those two windows: create the exception before enabling, and delete the operator's DaemonSets straight after disabling.

## Enabling

```yaml
kubescape-operator:
  nodeAgent:
    autoscaler:
      enabled: true
```

The upgrade deletes the `node-agent` DaemonSet and the operator creates its own shortly after, so every node-agent pod in the cluster is replaced at once.
Runtime detection has a short gap on every node while that happens.

## Disabling

Turning the mode off takes two steps, because the operator does not delete the DaemonSets it created.

1. Set `kubescape-operator.nodeAgent.autoscaler.enabled: false` and let the upgrade finish. Helm creates the `node-agent` DaemonSet again.
2. Delete the operator's DaemonSets:

   ```bash
   kubectl -n kubescape delete daemonsets -l kubescape.io/managed-by=operator-autoscaler
   ```

Until step 2 every node runs two node-agent pods.
The same happens when a Helm upgrade that enabled the mode is rolled back.
