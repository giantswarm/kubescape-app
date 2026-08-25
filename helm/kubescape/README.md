# kubescape

This chart contains the kubescape operator chart and custom Giant Swarm resources.

**Homepage:** <https://github.com/giantswarm/kubescape>

## Source Code

* <https://github.com/kubescape/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | dependency_chart | 0.0.0 |
|  | exceptions | 0.0.0 |
|  | kubescape-operator | 1.40.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| exceptions.enabled | bool | `true` |  |
| exceptions.namespace | string | `"policy-exceptions"` |  |
| image.name | string | `""` |  |
| image.tag | string | `""` |  |
| kubescape-operator.additionalLabels."application.giantswarm.io/team" | string | `"shield"` |  |
| kubescape-operator.capabilities.operator | string | `"enable"` |  |
| kubescape-operator.capabilities.configurationScan | string | `"enable"` |  |
| kubescape-operator.capabilities.continuousScan | string | `"enable"` |  |
| kubescape-operator.capabilities.nodeScan | string | `"enable"` |  |
| kubescape-operator.capabilities.vulnerabilityScan | string | `"enable"` |  |
| kubescape-operator.capabilities.scanEmbeddedSBOMs | string | `"disable"` |  |
| kubescape-operator.capabilities.relevancy | string | `"disable"` |  |
| kubescape-operator.capabilities.malwareDetection | string | `"enable"` |  |
| kubescape-operator.capabilities.runtimeObservability | string | `"enable"` |  |
| kubescape-operator.capabilities.networkPolicyService | string | `"enable"` |  |
| kubescape-operator.capabilities.runtimeDetection | string | `"enable"` |  |
| kubescape-operator.capabilities.nodeProfileService | string | `"enable"` |  |
| kubescape-operator.capabilities.seccompProfileService | string | `"enable"` |  |
| kubescape-operator.capabilities.nodeSbomGeneration | string | `"enable"` |  |
| kubescape-operator.capabilities.prometheusExporter | string | `"enable"` |  |
| kubescape-operator.kubescape.serviceMonitor.enabled | bool | `true` |  |
| kubescape-operator.kubescape.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape"` |  |
| kubescape-operator.certificates.certgen.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubectl"` |  |
| kubescape-operator.operator.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-operator"` |  |
| kubescape-operator.kubevuln.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-kubevuln"` |  |
| kubescape-operator.kubevuln.sbomScanner.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-node-agent"` |  |
| kubescape-operator.storage.forceVirtualCrds | bool | `true` |  |
| kubescape-operator.storage.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-storage"` |  |
| kubescape-operator.clamav.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-klamav"` |  |
| kubescape-operator.synchronizer.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-synchronizer"` |  |
| kubescape-operator.otelCollector.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-otel-collector"` |  |
| kubescape-operator.kubescapeScheduler.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-http-request"` |  |
| kubescape-operator.kubevulnScheduler.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-http-request"` |  |
| kubescape-operator.registryScanScheduler.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-http-request"` |  |
| kubescape-operator.nodeAgent.config.stdoutExporter | bool | `true` |  |
| kubescape-operator.nodeAgent.config.maxLearningPeriod | string | `"12h"` |  |
| kubescape-operator.nodeAgent.config.learningPeriod | string | `"2m"` |  |
| kubescape-operator.nodeAgent.config.updatePeriod | string | `"10m"` |  |
| kubescape-operator.nodeAgent.config.prometheusExporter | string | `"enable"` |  |
| kubescape-operator.nodeAgent.serviceMonitor.enabled | bool | `true` |  |
| kubescape-operator.nodeAgent.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-node-agent"` |  |
| kubescape-operator.prometheusExporter.enableWorkloadMetrics | bool | `true` |  |
| kubescape-operator.prometheusExporter.image.repository | string | `"gsoci.azurecr.io/giantswarm/kubescape-prometheus-exporter"` |  |
| podLogs.enabled | bool | `true` |  |
| podLogs.tenant | string | `"giantswarm"` |  |
| podLogs.commonLabels | object | `{}` |  |
| podLogs.commonAnnotations | object | `{}` |  |
| podLogs.components[0].name | string | `"grype-offline-db"` |  |
| podLogs.components[0].enabled | bool | `true` |  |
| podLogs.components[1].name | string | `"host-scanner"` |  |
| podLogs.components[1].enabled | bool | `false` |  |
| podLogs.components[2].name | string | `"kubescape"` |  |
| podLogs.components[2].enabled | bool | `false` |  |
| podLogs.components[3].name | string | `"kubescape-scheduler"` |  |
| podLogs.components[3].enabled | bool | `true` |  |
| podLogs.components[4].name | string | `"kubevuln"` |  |
| podLogs.components[4].enabled | bool | `true` |  |
| podLogs.components[5].name | string | `"kubevuln-scheduler"` |  |
| podLogs.components[5].enabled | bool | `true` |  |
| podLogs.components[6].name | string | `"node-agent"` |  |
| podLogs.components[6].enabled | bool | `true` |  |
| podLogs.components[7].name | string | `"operator"` |  |
| podLogs.components[7].enabled | bool | `true` |  |
| podLogs.components[8].name | string | `"otel-collector"` |  |
| podLogs.components[8].enabled | bool | `true` |  |
| podLogs.components[9].name | string | `"prometheus-exporter"` |  |
| podLogs.components[9].enabled | bool | `true` |  |
| podLogs.components[10].name | string | `"storage"` |  |
| podLogs.components[10].enabled | bool | `true` |  |
| podLogs.components[11].name | string | `"synchronizer"` |  |
| podLogs.components[11].enabled | bool | `true` |  |
