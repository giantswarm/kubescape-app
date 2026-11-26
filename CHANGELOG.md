# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-11-26

### Added

- All kubescape components, including the `node-agent` DaemonSet, tolerate the `kubernetes.io/arch=arm64:NoSchedule` taint of Giant Swarm arm64 node pools, set as the chart-wide `kubescape-operator.customScheduling.tolerations` default. Arm64 nodes now get runtime detection and node scans. If you set your own `tolerations` for a component or for `customScheduling`, include this toleration to keep arm64 support.

- Document how Kubescape runs behind an HTTP egress proxy, the hosts it needs and the values to set, in `docs/proxy.md`.

- Add optional operator-managed `node-agent` DaemonSets.

### Changed

- The optional `grype-offline-db` Deployment is pinned to `amd64` nodes, because its image is amd64-only.
- The operator and the scanner no longer contact the Kubescape version check service: the operator gets `KS_SKIP_UPDATE_CHECK=true` through `kubescape-operator.operator.env`, and `kubescape-operator.kubescape.skipUpdateCheck` is `true`.

### Fixed

- Start vulnerability scans on clusters where a Kyverno policy injects proxy settings into every pod. The operator calls `kubevuln` and `kubescape` by their bare Service names, which the injected `NO_PROXY` does not match, so it waited for `kubevuln` forever. The operator pod now carries the `policies.kyverno.io/inject-proxy-env: exclude` annotation.

- Point the optional node-agent `sbom-scanner` sidecar at the Giant Swarm registry through `nodeAgent.sbomScanner.image`; the previous `kubevuln.sbomScanner.image` override was never read, so the sidecar pulled from `quay.io`.

## [0.2.1] - 2026-11-18

### Fixed

- Fix `PodLogs` rendering failing with a nil pointer on `otelCollector` since upstream `v1.42.0` removed the bundled otel-collector; drop the stale `otel-collector` and `host-scanner` `podLogs` entries and treat components missing upstream as disabled.

## [0.2.0] - 2026-11-18

### Changed

- Updated `kubescape-operator` to upstream version `v1.42.0`.
- set size limits for emptyDir volumes
- Raise the kubevuln `ephemeral-storage` limit from 10Gi to 20Gi so the daily grype DB update no longer gets the pod evicted.
- Replaced the scheduler and certgen image overrides, which upstream removed, with a `kubescapeOpsTool.image` override pointing at `gsoci.azurecr.io/giantswarm/kubescape-ops-tool`.

## [0.1.2] - 2026-09-07

### Changed

- Allow additional properties for vendored upstream chart values so upstream keys are not rejected by the generated schema.

### Fixed

- Set `global.overrideRuntimePath` to `/opt/bin/runc` so the node-agent finds runc on Flatcar nodes.

## [0.1.1] - 2026-08-26

### Fixed

- Remove duplicate `application.giantswarm.io/team` label from the kubescape ServiceMonitor.
- Update devctl generated precommit config

## [0.1.0] - 2026-05-28

### Added

- Push to the `default` catalog.
- Add PodLogs resources for collecting kubescape pod logs.

### Changed

- Updated `kubescape-operator` to upstream version `v1.40.2`.

## [0.0.6] - 2026-02-10

### Added

- Add `io.giantswarm.application.audience` and `io.giantswarm.application.managed` chart annotations for Backstage visibility.

### Changed

- Update `kubescape` operator to v1.30.2.
- Migrate chart metadata annotations to OCI-compatible format.

## [0.0.5] - 2025-12-04

### Changed

- Update `kubescape` operator to v1.29.12.
- Enable extra ServiceMonitor.

## [0.0.4] - 2025-11-05

### Changed

- Fix clamav registry.

## [0.0.3] - 2025-11-05

### Changed

- Update kubescape operator to v1.29.8.

## [0.0.2] - 2025-10-21

## [0.0.1] - 2025-09-23

### Added

- First release of the Kubescape app.

[Unreleased]: https://github.com/giantswarm/kubescape-app/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/giantswarm/kubescape-app/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/giantswarm/kubescape-app/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/giantswarm/kubescape-app/compare/v0.1.2...v0.2.0
[0.1.2]: https://github.com/giantswarm/kubescape-app/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/giantswarm/kubescape-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/kubescape-app/compare/v0.0.6...v0.1.0
[0.0.6]: https://github.com/giantswarm/kubescape-app/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/giantswarm/kubescape-app/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/giantswarm/kubescape-app/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/giantswarm/kubescape-app/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/giantswarm/kubescape-app/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/giantswarm/kubescape-app/releases/tag/v0.0.1
