# kubescape-operator

![Version: 1.40.2](https://img.shields.io/badge/Version-1.40.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.40.2](https://img.shields.io/badge/AppVersion-1.40.2-informational?style=flat-square)

Kubescape is an E2E Kubernetes cluster security platform

**Homepage:** <https://kubescape.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Ben Hirschberg | <ben@armosec.io> | <https://www.linkedin.com/in/benyamin-ben-hirschberg-66141890> |
| Bezalel Brandwine | <bez@armosec.io> | <https://www.linkedin.com/in/bezalel-brandwine> |
| Matthias Bertschy | <matthiasb@armosec.io> | <https://www.linkedin.com/in/matthias-bertschy-b427b815/> |
| Amir Malka | <amirm@armosec.io> | <https://www.linkedin.com/in/amirmalka> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../dependency_chart/clustered-crds | kubescape-alert-crd | 0.0.2 |
| file://../dependency_chart/namespaced-crds | kubescape-alert-crd-ns | 0.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| accessKey | string | `nil` |  |
| account | string | `nil` |  |
| additionalAnnotations | object | `{}` |  |
| additionalLabels | object | `{}` |  |
| alertCRD.installDefault | bool | `false` |  |
| alertCRD.scopeClustered | bool | `true` |  |
| alertCRD.scopeNamespaced | bool | `false` |  |
| capabilities | object | `{"admissionController":"enable","autoUpgrading":"disable","configurationScan":"enable","continuousScan":"disable","httpDetection":"enable","kubescapeOffline":"disable","malwareDetection":"disable","manageWorkloads":"disable","networkEventsStreaming":"enable","networkPolicyService":"enable","nodeProfileService":"enable","nodeSbomGeneration":"enable","nodeScan":"enable","operator":"enable","prometheusExporter":"disable","relevancy":"enable","riskAcceptance":"disable","runtimeDetection":"disable","runtimeObservability":"enable","scanEmbeddedSBOMs":"disable","seccompProfileBackend":"crd","seccompProfileService":"enable","syncSBOM":"disable","testing":{"nodeAgentMultiplication":{"enabled":false,"replicas":5}},"vexGeneration":"disable","vulnerabilityScan":"enable"}` | --------------------------------------------------------------------------------------- |
| certificates.certgen.image.pullPolicy | string | `"IfNotPresent"` |  |
| certificates.certgen.image.repository | string | `"quay.io/kubescape/kubectl"` |  |
| certificates.certgen.image.tag | string | `"1.36.1"` |  |
| certificates.strategy | string | `"template"` |  |
| clamav.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"kubernetes.io/os"` |  |
| clamav.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"In"` |  |
| clamav.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"linux"` |  |
| clamav.image.pullPolicy | string | `"IfNotPresent"` |  |
| clamav.image.repository | string | `"quay.io/kubescape/klamav"` | source code: https://github.com/kubescape/node-agent/tree/main/clamav |
| clamav.image.tag | string | `"1.3.1-34_alpha"` |  |
| clamav.name | string | `"clamav"` |  |
| clamav.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| clamav.resources.limits.cpu | string | `"300m"` |  |
| clamav.resources.limits.memory | string | `"512Mi"` |  |
| clamav.resources.requests.cpu | string | `"100m"` |  |
| clamav.resources.requests.memory | string | `"256Mi"` |  |
| clamav.volumeMounts[0].mountPath | string | `"/var/lib/clamav-tmp"` |  |
| clamav.volumeMounts[0].name | string | `"clamdb"` |  |
| clamav.volumeMounts[1].mountPath | string | `"/run/clamav"` |  |
| clamav.volumeMounts[1].name | string | `"clamrun"` |  |
| clamav.volumeMounts[2].mountPath | string | `"/etc/clamav"` |  |
| clamav.volumeMounts[2].name | string | `"etc"` |  |
| clamav.volumeMounts[2].readOnly | bool | `true` |  |
| clamav.volumes[0].emptyDir | object | `{}` |  |
| clamav.volumes[0].name | string | `"clamdb"` |  |
| clamav.volumes[1].emptyDir | object | `{}` |  |
| clamav.volumes[1].name | string | `"clamrun"` |  |
| clamav.volumes[2].configMap.items[0].key | string | `"clamd.conf"` |  |
| clamav.volumes[2].configMap.items[0].path | string | `"clamd.conf"` |  |
| clamav.volumes[2].configMap.items[1].key | string | `"freshclam.conf"` |  |
| clamav.volumes[2].configMap.items[1].path | string | `"freshclam.conf"` |  |
| clamav.volumes[2].configMap.name | string | `"clamav"` |  |
| clamav.volumes[2].name | string | `"etc"` |  |
| cloudProviderMetadata | object | `{"awsIamRoleArn":null,"cloudRegion":null,"gkeProject":null,"gkeServiceAccount":null}` | --------------------------------------------------------------------------------------- It is recommended to setup the cloud info when installing the chart on a managed cluster, this will enable to check the related settings cloud support |
| cloudProviderMetadata.awsIamRoleArn | string | `nil` | AWS IAM arn role |
| cloudProviderMetadata.cloudRegion | string | `nil` | cloud region |
| cloudProviderMetadata.gkeProject | string | `nil` | GKE project |
| cloudProviderMetadata.gkeServiceAccount | string | `nil` | GKE service account |
| clusterName | string | `"cluster"` | set clusterName=`kubectl config current-context` |
| configurations.excludeJsonPaths | string | `nil` |  |
| configurations.otelUrl | string | `nil` |  |
| configurations.persistence | string | `"enable"` |  |
| configurations.priorityClass.daemonset | int | `100000100` |  |
| configurations.priorityClass.enabled | bool | `true` |  |
| configurations.prometheusAnnotations | string | `"disable"` |  |
| continuousScanning | object | `{"configMapName":"cs-matching-rules","matchingRules":{"match":[{"apiGroups":["apps"],"apiVersions":["v1"],"resources":["deployments"]}],"namespaces":["default"]}}` | --------------------------------------------------------------------------------------- Continuous scanning configurations |
| credentials.cloudSecret | string | `nil` |  |
| customScheduling.affinity | string | `nil` |  |
| customScheduling.nodeSelector | string | `nil` |  |
| customScheduling.priorityClassName | string | `""` |  |
| customScheduling.tolerations | string | `nil` |  |
| excludeLabels | string | `nil` |  |
| excludeNamespaces | string | `"kubescape,kube-system,kube-public,kube-node-lease,kubeconfig,gmp-system,gmp-public"` |  |
| fullnameOverride | string | `"kubescape"` | Overrides the full name of the helm chart |
| global.cloudConfig | string | `"ks-cloud-config"` |  |
| global.configMapsDirectory | string | `"configs"` |  |
| global.enableClusterWideSecretAccess | bool | `true` |  |
| global.extraCaCertificates.enabled | bool | `false` |  |
| global.extraCaCertificates.secretName | string | `""` |  |
| global.httpsProxy | string | `""` |  |
| global.kubescapePsp.enabled | bool | `false` |  |
| global.kubescapePsp.name | string | `"ks-allow-privileged"` |  |
| global.namespaceTier | string | `"ks-control-plane"` |  |
| global.networkPolicy.apiServerIP | string | `""` |  |
| global.networkPolicy.apiServerPort | int | `443` |  |
| global.networkPolicy.createEgressRules | bool | `false` |  |
| global.networkPolicy.enabled | bool | `false` |  |
| global.networkPolicy.httpsProxyIP | string | `""` |  |
| global.networkPolicy.httpsProxyPort | string | `""` |  |
| global.noProxy | string | `""` |  |
| global.openshift.scc.enabled | bool | `false` |  |
| global.overrideDefaultCaCertificates.caCertificates | string | `""` |  |
| global.overrideDefaultCaCertificates.enabled | bool | `false` |  |
| global.overrideRuntimePath | string | `""` |  |
| global.proxySecretDirectory | string | `"proxy-support"` |  |
| global.proxySecretFile | string | `""` |  |
| global.proxySecretName | string | `"kubescape-proxy-certificate"` |  |
| grypeOfflineDB.enabled | bool | `false` |  |
| grypeOfflineDB.failedJobsHistoryLimit | int | `1` |  |
| grypeOfflineDB.image.pullPolicy | string | `"Always"` |  |
| grypeOfflineDB.image.repository | string | `"quay.io/kubescape/grype-offline-db"` |  |
| grypeOfflineDB.image.sha | string | `"sha256:56468cbe92622770860f5c2f96b43aca836f6466c1c95116a107d461f8de8592"` |  |
| grypeOfflineDB.image.tag | string | `""` |  |
| grypeOfflineDB.name | string | `"grype-offline-db"` |  |
| grypeOfflineDB.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| grypeOfflineDB.podAnnotations | object | `{}` |  |
| grypeOfflineDB.podLabels | object | `{}` |  |
| grypeOfflineDB.priorityClassName | string | `""` |  |
| grypeOfflineDB.resources.limits.cpu | string | `"150m"` |  |
| grypeOfflineDB.resources.limits.memory | string | `"200Mi"` |  |
| grypeOfflineDB.resources.requests.cpu | string | `"150m"` |  |
| grypeOfflineDB.resources.requests.memory | string | `"200Mi"` |  |
| grypeOfflineDB.rollout.image.pullPolicy | string | `"IfNotPresent"` |  |
| grypeOfflineDB.rollout.image.repository | string | `"quay.io/kubescape/kubectl"` |  |
| grypeOfflineDB.rollout.image.tag | string | `"1.36.1"` |  |
| grypeOfflineDB.rollout.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| grypeOfflineDB.rollout.podAnnotations | object | `{}` |  |
| grypeOfflineDB.rollout.podLabels | object | `{}` |  |
| grypeOfflineDB.rollout.resources.limits.cpu | string | `"100m"` |  |
| grypeOfflineDB.rollout.resources.limits.memory | string | `"50Mi"` |  |
| grypeOfflineDB.rollout.resources.requests.cpu | string | `"10m"` |  |
| grypeOfflineDB.rollout.resources.requests.memory | string | `"10Mi"` |  |
| grypeOfflineDB.schedule | string | `"5 0 * * *"` | Cron schedule for the grype-offline-db rollout CronJob |
| grypeOfflineDB.successfulJobsHistoryLimit | int | `3` |  |
| helmReleaseUpgrader.failedJobsHistoryLimit | int | `1` |  |
| helmReleaseUpgrader.image.pullPolicy | string | `"IfNotPresent"` |  |
| helmReleaseUpgrader.image.repository | string | `"quay.io/kubescape/helm-release-upgrader"` |  |
| helmReleaseUpgrader.image.tag | string | `"v0.1.0"` |  |
| helmReleaseUpgrader.name | string | `"helm-release-upgrader"` |  |
| helmReleaseUpgrader.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| helmReleaseUpgrader.priorityClassName | string | `""` |  |
| helmReleaseUpgrader.resources.limits.cpu | string | `"500m"` |  |
| helmReleaseUpgrader.resources.limits.memory | string | `"256Mi"` |  |
| helmReleaseUpgrader.resources.requests.cpu | string | `"500m"` |  |
| helmReleaseUpgrader.resources.requests.memory | string | `"256Mi"` |  |
| helmReleaseUpgrader.schedule | string | `"0 14 * * *"` |  |
| helmReleaseUpgrader.successfulJobsHistoryLimit | int | `3` |  |
| imagePullSecret | object | `{"email":"","password":"","server":"","username":""}` | must pass in server, username, and password for the secret to be generated |
| imagePullSecrets | string | `""` | can be used in conjunction with `imagePullSecret` below to generate a secret with provided credentials |
| imageScanning.privateRegistries.credentials | string | `nil` |  |
| includeNamespaces | string | `""` |  |
| ksLabel | string | `"kubescape"` |  |
| ksNamespace | string | `"kubescape"` |  |
| kubescape | object | `{"downloadArtifacts":true,"image":{"pullPolicy":"IfNotPresent","repository":"quay.io/kubescape/kubescape","tag":"v4.0.8"},"name":"kubescape","nodeSelector":{"kubernetes.io/os":"linux"},"podAnnotations":{},"podLabels":{},"priorityClassName":"","resources":{"limits":{"cpu":"600m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"400Mi"}},"service":{"annotations":{},"port":8080,"type":"ClusterIP"},"serviceMonitor":{"additionalLabels":{},"enabled":false,"interval":"200s","scrapeTimeout":"150s","skipPersistence":false},"skipUpdateCheck":false,"volumeMounts":[],"volumes":[]}` | --------------------------------------------------------------------------------------- +++++++++++++++++++++++++++++++ Kubescape ++++++++++++++++++++++++++++++++++++++++++++++++ kubescape scanner - https://github.com/kubescape/kubescape |
| kubescape.downloadArtifacts | bool | `true` | download policies every scan, we recommend it should remain true, you should change to 'false' when running in an air-gapped environment or when scanning with high frequency (when running with Prometheus) |
| kubescape.image.repository | string | `"quay.io/kubescape/kubescape"` | source code: https://github.com/kubescape/kubescape/tree/master/httphandler (public repo) |
| kubescape.serviceMonitor.enabled | bool | `false` | enable/disable service monitor for prometheus (operator) integration |
| kubescape.serviceMonitor.interval | string | `"200s"` | Customize prometheus interval and scrapeTimeout |
| kubescape.skipUpdateCheck | bool | `false` | skip check for a newer version |
| kubescapeScheduler | object | `{"failedJobsHistoryLimit":1,"image":{"pullPolicy":"IfNotPresent","repository":"quay.io/kubescape/http-request","tag":"v0.2.19"},"insecureSkipTLSVerify":false,"name":"kubescape-scheduler","nodeSelector":{"kubernetes.io/os":"linux"},"podAnnotations":{},"podLabels":{},"priorityClassName":"","requestBody":{"commands":[{"CommandName":"kubescapeScan","args":{"scanV1":{}}}]},"resources":{"limits":{"cpu":"10m","memory":"20Mi"},"requests":{"cpu":"1m","memory":"10Mi"}},"scanSchedule":"0 8 * * *","successfulJobsHistoryLimit":3,"volumeMounts":[],"volumes":[]}` | --------------------------------------------------------------------------------------- kubescape scheduled scan using a CronJob |
| kubescapeScheduler.image.repository | string | `"quay.io/kubescape/http-request"` | source code: https://github.com/kubescape/http-request (public repo) |
| kubescapeScheduler.scanSchedule | string | `"0 8 * * *"` | scan schedule frequency |
| kubevuln.config.grypeDbListingURL | string | `""` |  |
| kubevuln.config.grypeDbPersistence | bool | `false` |  |
| kubevuln.config.maxImageSize | int | `5368709120` |  |
| kubevuln.config.maxSBOMSize | int | `20971520` |  |
| kubevuln.config.scanTimeout | string | `"5m"` |  |
| kubevuln.config.storeFilteredSboms | bool | `false` |  |
| kubevuln.config.useDefaultMatchers | bool | `false` |  |
| kubevuln.env[0].name | string | `"CA_MAX_VULN_SCAN_ROUTINES"` |  |
| kubevuln.env[0].value | string | `"1"` |  |
| kubevuln.gomemlimitPercentage | float | `0.8` |  |
| kubevuln.image.pullPolicy | string | `"IfNotPresent"` |  |
| kubevuln.image.repository | string | `"quay.io/kubescape/kubevuln"` | source code: https://github.com/kubescape/kubevuln |
| kubevuln.image.tag | string | `"v0.3.142"` |  |
| kubevuln.name | string | `"kubevuln"` |  |
| kubevuln.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| kubevuln.podAnnotations | object | `{}` |  |
| kubevuln.podLabels | object | `{}` |  |
| kubevuln.priorityClassName | string | `""` |  |
| kubevuln.replicaCount | int | `1` |  |
| kubevuln.resources.limits.cpu | string | `"1500m"` |  |
| kubevuln.resources.limits.ephemeral-storage | string | `"10Gi"` |  |
| kubevuln.resources.limits.memory | string | `"5000Mi"` |  |
| kubevuln.resources.requests.cpu | string | `"300m"` |  |
| kubevuln.resources.requests.ephemeral-storage | string | `"5Gi"` |  |
| kubevuln.resources.requests.memory | string | `"1000Mi"` |  |
| kubevuln.sbomScanner.command[0] | string | `"/usr/bin/sbom-scanner"` |  |
| kubevuln.sbomScanner.enabled | bool | `false` |  |
| kubevuln.sbomScanner.resources.limits.cpu | string | `"1000m"` |  |
| kubevuln.sbomScanner.resources.limits.memory | string | `"5Gi"` |  |
| kubevuln.sbomScanner.resources.requests.cpu | string | `"100m"` |  |
| kubevuln.sbomScanner.resources.requests.memory | string | `"512Mi"` |  |
| kubevuln.service.annotations | object | `{}` |  |
| kubevuln.service.port | int | `8080` |  |
| kubevuln.service.protocol | string | `"TCP"` |  |
| kubevuln.service.targetPort | int | `8080` |  |
| kubevuln.service.type | string | `"ClusterIP"` |  |
| kubevuln.tmpDirPersistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| kubevuln.tmpDirPersistence.annotations | object | `{}` |  |
| kubevuln.tmpDirPersistence.enabled | bool | `false` |  |
| kubevuln.tmpDirPersistence.size | string | `"50Gi"` |  |
| kubevuln.tmpDirPersistence.storageClassName | string | `""` |  |
| kubevuln.verbose | string | `""` | for enable:"<any-value>", for disable:"": the print of json posted to the Kubescape cloud from the vuln scanner |
| kubevuln.volumeMounts | list | `[]` |  |
| kubevuln.volumes | list | `[]` |  |
| kubevulnScheduler.failedJobsHistoryLimit | int | `1` |  |
| kubevulnScheduler.image.pullPolicy | string | `"IfNotPresent"` |  |
| kubevulnScheduler.image.repository | string | `"quay.io/kubescape/http-request"` |  |
| kubevulnScheduler.image.tag | string | `"v0.2.19"` |  |
| kubevulnScheduler.insecureSkipTLSVerify | bool | `false` |  |
| kubevulnScheduler.name | string | `"kubevuln-scheduler"` |  |
| kubevulnScheduler.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| kubevulnScheduler.podAnnotations | object | `{}` |  |
| kubevulnScheduler.podLabels | object | `{}` |  |
| kubevulnScheduler.priorityClassName | string | `""` |  |
| kubevulnScheduler.resources.limits.cpu | string | `"10m"` |  |
| kubevulnScheduler.resources.limits.memory | string | `"20Mi"` |  |
| kubevulnScheduler.resources.requests.cpu | string | `"1m"` |  |
| kubevulnScheduler.resources.requests.memory | string | `"10Mi"` |  |
| kubevulnScheduler.scanSchedule | string | `"0 0 * * *"` | Frequency of running the scan     ┌───────────── minute (0 - 59)     │ ┌───────────── hour (0 - 23)     │ │ ┌───────────── day of the month (1 - 31)     │ │ │ ┌───────────── month (1 - 12)     │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;     │ │ │ │ │                         7 is also Sunday on some systems)     │ │ │ │ │     │ │ │ │ │     * * * * * |
| kubevulnScheduler.successfulJobsHistoryLimit | int | `3` |  |
| kubevulnScheduler.volumeMounts | list | `[]` |  |
| kubevulnScheduler.volumes | list | `[]` |  |
| logger.level | string | `"info"` |  |
| logger.name | string | `"zap"` |  |
| nameOverride | string | `""` | Overrides the name of the helm chart |
| nodeAgent.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"kubernetes.io/os"` |  |
| nodeAgent.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"In"` |  |
| nodeAgent.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"linux"` |  |
| nodeAgent.autoscaler.enabled | bool | `false` | enable/disable autoscaler mode |
| nodeAgent.autoscaler.maxResources | object | `{"cpu":"2000m","memory":"4Gi"}` | maximum resources regardless of node size |
| nodeAgent.autoscaler.minResources | object | `{"cpu":"100m","memory":"180Mi"}` | minimum resources regardless of node size |
| nodeAgent.autoscaler.nodeGroupLabel | string | `"node.kubernetes.io/instance-type"` | node label used to group nodes (each unique value creates a separate DaemonSet) |
| nodeAgent.autoscaler.reconcileInterval | string | `"5m"` | interval for reconciliation loop |
| nodeAgent.autoscaler.resourcePercentages | object | `{"limitCPU":5,"limitMemory":5,"requestCPU":2,"requestMemory":2}` | resource percentages relative to node allocatable resources |
| nodeAgent.config.alertManagerExporterUrls | list | `[]` |  |
| nodeAgent.config.hostMalwareSensor | string | `"disable"` |  |
| nodeAgent.config.hostNetworkSensor | string | `"disable"` |  |
| nodeAgent.config.hostSensor.enabled | bool | `true` |  |
| nodeAgent.config.hostSensor.interval | string | `"5m"` |  |
| nodeAgent.config.httpExporterConfig.maxAlertsPerMinute | int | `1000` |  |
| nodeAgent.config.httpExporterConfig.method | string | `"POST"` |  |
| nodeAgent.config.httpExporterConfig.url | string | `"http://synchronizer:8089/apis/v1/kubescape.io"` |  |
| nodeAgent.config.learningPeriod | string | `"2m"` |  |
| nodeAgent.config.malwareScanAllFiles | bool | `false` |  |
| nodeAgent.config.maxLearningPeriod | string | `"24h"` |  |
| nodeAgent.config.networkStreamingInterval | string | `"2m"` |  |
| nodeAgent.config.nodeProfileInterval | string | `"10m"` |  |
| nodeAgent.config.prometheusExporter | string | `"disable"` |  |
| nodeAgent.config.ruleCooldown.ruleCooldownAfterCount | int | `1` |  |
| nodeAgent.config.ruleCooldown.ruleCooldownDuration | string | `"1h"` |  |
| nodeAgent.config.ruleCooldown.ruleCooldownMaxSize | int | `20000` |  |
| nodeAgent.config.ruleCooldown.ruleCooldownOnProfileFailure | bool | `true` |  |
| nodeAgent.config.skipKernelVersionCheck | bool | `false` |  |
| nodeAgent.config.stdoutExporter | bool | `true` |  |
| nodeAgent.config.syslogExporterURL | string | `""` |  |
| nodeAgent.config.updatePeriod | string | `"10m"` |  |
| nodeAgent.env[0].name | string | `"NodeName"` |  |
| nodeAgent.env[0].valueFrom.fieldRef.fieldPath | string | `"spec.nodeName"` |  |
| nodeAgent.gke.allowlist.enabled | bool | `false` |  |
| nodeAgent.gke.allowlist.name | string | `"armo-kubescape-node-agent-1.29"` |  |
| nodeAgent.gomemlimitPercentage | float | `0.8` |  |
| nodeAgent.image.pullPolicy | string | `"IfNotPresent"` |  |
| nodeAgent.image.repository | string | `"quay.io/kubescape/node-agent"` | source code: https://github.com/kubescape/node-agent |
| nodeAgent.image.tag | string | `"v0.3.119"` |  |
| nodeAgent.multipleDaemonSets.configurations | string | `nil` |  |
| nodeAgent.multipleDaemonSets.enabled | bool | `false` |  |
| nodeAgent.name | string | `"node-agent"` |  |
| nodeAgent.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| nodeAgent.podAnnotations | object | `{}` |  |
| nodeAgent.podLabels | object | `{}` |  |
| nodeAgent.priorityClassName | string | `""` |  |
| nodeAgent.privileged | bool | `false` |  |
| nodeAgent.resources.limits.cpu | string | `"500m"` |  |
| nodeAgent.resources.limits.memory | string | `"1400Mi"` |  |
| nodeAgent.resources.requests.cpu | string | `"100m"` |  |
| nodeAgent.resources.requests.memory | string | `"180Mi"` |  |
| nodeAgent.sbomScanner.command[0] | string | `"/usr/bin/sbom-scanner"` |  |
| nodeAgent.sbomScanner.enabled | bool | `false` |  |
| nodeAgent.sbomScanner.image.pullPolicy | string | `"IfNotPresent"` |  |
| nodeAgent.sbomScanner.image.repository | string | `"quay.io/kubescape/node-agent"` |  |
| nodeAgent.sbomScanner.image.tag | string | `""` |  |
| nodeAgent.sbomScanner.name | string | `"sbom-scanner"` |  |
| nodeAgent.sbomScanner.resources.limits.cpu | string | `"1000m"` |  |
| nodeAgent.sbomScanner.resources.limits.memory | string | `"4Gi"` |  |
| nodeAgent.sbomScanner.resources.requests.cpu | string | `"50m"` |  |
| nodeAgent.sbomScanner.resources.requests.memory | string | `"256Mi"` |  |
| nodeAgent.sbomScanner.volumeMounts[0].mountPath | string | `"/sbom-comm"` |  |
| nodeAgent.sbomScanner.volumeMounts[0].name | string | `"sbom-comm"` |  |
| nodeAgent.sbomScanner.volumeMounts[1].mountPath | string | `"/host"` |  |
| nodeAgent.sbomScanner.volumeMounts[1].name | string | `"host"` |  |
| nodeAgent.sbomScanner.volumeMounts[1].readOnly | bool | `true` |  |
| nodeAgent.sbomScanner.volumeMounts[2].mountPath | string | `"/tmp"` |  |
| nodeAgent.sbomScanner.volumeMounts[2].name | string | `"sbom-scanner-tmp"` |  |
| nodeAgent.sbomScanner.volumes[0].emptyDir.medium | string | `"Memory"` |  |
| nodeAgent.sbomScanner.volumes[0].emptyDir.sizeLimit | string | `"10Mi"` |  |
| nodeAgent.sbomScanner.volumes[0].name | string | `"sbom-comm"` |  |
| nodeAgent.sbomScanner.volumes[1].emptyDir | object | `{}` |  |
| nodeAgent.sbomScanner.volumes[1].name | string | `"sbom-scanner-tmp"` |  |
| nodeAgent.seLinuxType | string | `"spc_t"` |  |
| nodeAgent.serviceMonitor.additionalLabels | object | `{}` |  |
| nodeAgent.serviceMonitor.enabled | bool | `false` | enable/disable service monitor for prometheus |
| nodeAgent.serviceMonitor.interval | string | `"30s"` | Customize prometheus interval and scrapeTimeout |
| nodeAgent.serviceMonitor.scrapeTimeout | string | `"15s"` |  |
| nodeAgent.startupJitterContainer.enabled | bool | `false` |  |
| nodeAgent.startupJitterContainer.image.repository | string | `"busybox"` |  |
| nodeAgent.startupJitterContainer.image.tag | string | `"latest"` |  |
| nodeAgent.startupJitterContainer.maxStartupJitter | int | `60` |  |
| nodeAgent.volumeMounts[0].mountPath | string | `"/host"` |  |
| nodeAgent.volumeMounts[0].name | string | `"host"` |  |
| nodeAgent.volumeMounts[0].readOnly | bool | `true` |  |
| nodeAgent.volumeMounts[10].mountPath | string | `"/boot"` |  |
| nodeAgent.volumeMounts[10].name | string | `"boot"` |  |
| nodeAgent.volumeMounts[10].readOnly | bool | `true` |  |
| nodeAgent.volumeMounts[11].mountPath | string | `"/clamav"` |  |
| nodeAgent.volumeMounts[11].name | string | `"clamrun"` |  |
| nodeAgent.volumeMounts[1].mountPath | string | `"/var/lib/kubelet"` |  |
| nodeAgent.volumeMounts[1].name | string | `"kubeletdir"` |  |
| nodeAgent.volumeMounts[2].mountPath | string | `"/run"` |  |
| nodeAgent.volumeMounts[2].name | string | `"run"` |  |
| nodeAgent.volumeMounts[3].mountPath | string | `"/var"` |  |
| nodeAgent.volumeMounts[3].name | string | `"var"` |  |
| nodeAgent.volumeMounts[3].readOnly | bool | `true` |  |
| nodeAgent.volumeMounts[4].mountPath | string | `"/lib/modules"` |  |
| nodeAgent.volumeMounts[4].name | string | `"modules"` |  |
| nodeAgent.volumeMounts[4].readOnly | bool | `true` |  |
| nodeAgent.volumeMounts[5].mountPath | string | `"/sys/kernel/debug"` |  |
| nodeAgent.volumeMounts[5].name | string | `"debugfs"` |  |
| nodeAgent.volumeMounts[6].mountPath | string | `"/sys/fs/cgroup"` |  |
| nodeAgent.volumeMounts[6].name | string | `"cgroup"` |  |
| nodeAgent.volumeMounts[6].readOnly | bool | `true` |  |
| nodeAgent.volumeMounts[7].mountPath | string | `"/sys/fs/bpf"` |  |
| nodeAgent.volumeMounts[7].name | string | `"bpffs"` |  |
| nodeAgent.volumeMounts[8].mountPath | string | `"/data"` |  |
| nodeAgent.volumeMounts[8].name | string | `"data"` |  |
| nodeAgent.volumeMounts[9].mountPath | string | `"/profiles"` |  |
| nodeAgent.volumeMounts[9].name | string | `"profiles"` |  |
| nodeAgent.volumes[0].hostPath.path | string | `"/"` |  |
| nodeAgent.volumes[0].name | string | `"host"` |  |
| nodeAgent.volumes[10].emptyDir | string | `nil` |  |
| nodeAgent.volumes[10].name | string | `"profiles"` |  |
| nodeAgent.volumes[11].hostPath.path | string | `"/"` |  |
| nodeAgent.volumes[11].hostPath.type | string | `"Directory"` |  |
| nodeAgent.volumes[11].name | string | `"host-filesystem"` |  |
| nodeAgent.volumes[1].hostPath.path | string | `"/var/lib/kubelet"` |  |
| nodeAgent.volumes[1].name | string | `"kubeletdir"` |  |
| nodeAgent.volumes[2].hostPath.path | string | `"/run"` |  |
| nodeAgent.volumes[2].name | string | `"run"` |  |
| nodeAgent.volumes[3].hostPath.path | string | `"/var"` |  |
| nodeAgent.volumes[3].name | string | `"var"` |  |
| nodeAgent.volumes[4].hostPath.path | string | `"/sys/fs/cgroup"` |  |
| nodeAgent.volumes[4].name | string | `"cgroup"` |  |
| nodeAgent.volumes[5].hostPath.path | string | `"/lib/modules"` |  |
| nodeAgent.volumes[5].name | string | `"modules"` |  |
| nodeAgent.volumes[6].hostPath.path | string | `"/sys/fs/bpf"` |  |
| nodeAgent.volumes[6].name | string | `"bpffs"` |  |
| nodeAgent.volumes[7].hostPath.path | string | `"/sys/kernel/debug"` |  |
| nodeAgent.volumes[7].name | string | `"debugfs"` |  |
| nodeAgent.volumes[8].hostPath.path | string | `"/boot"` |  |
| nodeAgent.volumes[8].name | string | `"boot"` |  |
| nodeAgent.volumes[9].emptyDir | string | `nil` |  |
| nodeAgent.volumes[9].name | string | `"data"` |  |
| operator.admissionService | object | `{}` |  |
| operator.admissionWebhooks.patch.retries | int | `60` |  |
| operator.admissionWebhooks.patch.retryIntervalSeconds | int | `5` |  |
| operator.admissionWebhooks.service.annotations | object | `{}` |  |
| operator.admissionWebhooks.service.port | int | `443` |  |
| operator.admissionWebhooks.service.targetPort | int | `8443` |  |
| operator.admissionWebhooks.service.type | string | `"ClusterIP"` |  |
| operator.env | object | `{}` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.image.repository | string | `"quay.io/kubescape/operator"` | source code: https://github.com/kubescape/operator |
| operator.image.tag | string | `"v0.2.142"` |  |
| operator.name | string | `"operator"` |  |
| operator.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| operator.podAnnotations | object | `{}` |  |
| operator.podLabels | object | `{}` |  |
| operator.podScanGuardTime | string | `"1h"` |  |
| operator.priorityClassName | string | `""` |  |
| operator.resources.limits.cpu | string | `"300m"` |  |
| operator.resources.limits.memory | string | `"300Mi"` |  |
| operator.resources.requests.cpu | string | `"50m"` |  |
| operator.resources.requests.memory | string | `"100Mi"` |  |
| operator.service.annotations | object | `{}` |  |
| operator.service.port | int | `4002` |  |
| operator.service.protocol | string | `"TCP"` |  |
| operator.service.targetPort | int | `4002` |  |
| operator.service.type | string | `"ClusterIP"` |  |
| operator.triggerSecurityFramework | bool | `true` |  |
| operator.volumeMounts | list | `[]` |  |
| operator.volumes | list | `[]` |  |
| otelCollector | object | `{"disable":true,"endpoint":{"headers":{"uptrace-dsn":""},"insecure":true},"hostmetrics":{"enabled":true,"scrapeInterval":"30s"},"image":{"pullPolicy":"IfNotPresent","repository":"quay.io/kubescape/opentelemetry-collector","tag":"0.108.0"},"name":"otel-collector","podAnnotations":{},"podLabels":{},"resources":{"limits":{"cpu":1,"memory":"1Gi"},"requests":{"cpu":"100m","memory":"500Mi"}}}` | --------------------------------------------------------------------------------------- +++++++++++++++++++++++++++++++ OTEL-collector ++++++++++++++++++++++++++++++++++++++++++++++++ opentelemetry collector |
| otelCollector.hostmetrics | object | `{"enabled":true,"scrapeInterval":"30s"}` | enable/disable hostmetrics collection |
| persistence | object | `{"accessMode":"ReadWriteOnce","size":{"backingStorage":"5Gi","kubevuln":"5Gi"},"storageClass":"-"}` | --------------------------------------------------------------------------------------- Enable persistence using Persistent Volume Claims |
| persistence.accessMode | string | `"ReadWriteOnce"` | persistence access mode    ref: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes |
| persistence.size | object | `{"backingStorage":"5Gi","kubevuln":"5Gi"}` | persistence size |
| persistence.storageClass | string | `"-"` | persistence storage class    ref: https://kubernetes.io/docs/concepts/storage/storage-classes/    note: set to "-" (dash) for default storage class |
| prometheusExporter.enableWorkloadMetrics | bool | `false` |  |
| prometheusExporter.image.pullPolicy | string | `"IfNotPresent"` |  |
| prometheusExporter.image.repository | string | `"quay.io/kubescape/prometheus-exporter"` |  |
| prometheusExporter.image.tag | string | `"v0.2.18"` |  |
| prometheusExporter.name | string | `"prometheus-exporter"` |  |
| prometheusExporter.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| prometheusExporter.podAnnotations | object | `{}` |  |
| prometheusExporter.podLabels | object | `{}` |  |
| prometheusExporter.priorityClassName | string | `""` |  |
| prometheusExporter.resources.limits.cpu | string | `"50m"` |  |
| prometheusExporter.resources.limits.memory | string | `"100Mi"` |  |
| prometheusExporter.resources.requests.cpu | string | `"10m"` |  |
| prometheusExporter.resources.requests.memory | string | `"10Mi"` |  |
| prometheusExporter.service.port | int | `8080` |  |
| prometheusExporter.service.protocol | string | `"TCP"` |  |
| prometheusExporter.service.targetPort | int | `8080` |  |
| prometheusExporter.volumeMounts | list | `[]` |  |
| prometheusExporter.volumes | list | `[]` |  |
| registryScanScheduler.failedJobsHistoryLimit | int | `1` |  |
| registryScanScheduler.image.pullPolicy | string | `"IfNotPresent"` |  |
| registryScanScheduler.image.repository | string | `"quay.io/kubescape/http-request"` | source code: https://github.com/kubescape/http-request (public repo) |
| registryScanScheduler.image.tag | string | `"v0.2.19"` |  |
| registryScanScheduler.insecureSkipTLSVerify | bool | `false` |  |
| registryScanScheduler.name | string | `"registry-scheduler"` |  |
| registryScanScheduler.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| registryScanScheduler.resources.limits.cpu | string | `"10m"` |  |
| registryScanScheduler.resources.limits.memory | string | `"20Mi"` |  |
| registryScanScheduler.resources.requests.cpu | string | `"1m"` |  |
| registryScanScheduler.resources.requests.memory | string | `"10Mi"` |  |
| registryScanScheduler.scanSchedule | string | `"0 0 * * *"` | scan schedule frequency |
| registryScanScheduler.successfulJobsHistoryLimit | int | `3` |  |
| registryScanScheduler.volumeMounts | list | `[]` |  |
| registryScanScheduler.volumes | list | `[]` |  |
| server | string | `nil` | --------------------------------------------------------------------------------------- Host and credentials for third-party providers Here you can find the list of providers -> https://kubescape.io/docs/providers/#compatible-providers |
| serviceScanConfig.enabled | bool | `false` |  |
| serviceScanConfig.interval | string | `"1h"` |  |
| storage.cleanupInterval | string | `"6h"` |  |
| storage.defaultMaxObjectSize | int | `400000` |  |
| storage.defaultQueueLength | int | `100` |  |
| storage.defaultWorkerCount | int | `2` |  |
| storage.disableVirtualCRDs | bool | `false` |  |
| storage.image | object | `{"pullPolicy":"IfNotPresent","repository":"quay.io/kubescape/storage","tag":"v0.0.274"}` | source code: https://github.com/kubescape/storage |
| storage.image.repository | string | `"quay.io/kubescape/storage"` | source code: https://github.com/kubescape/storage |
| storage.kindQueues.applicationprofiles | object | `{"maxObjectSize":20000000,"queueLength":50,"workerCount":2}` | set the queues for the different kinds, the default is to use the default queue length and worker count |
| storage.kindQueues.containerprofiles.maxObjectSize | int | `2500000` |  |
| storage.kindQueues.containerprofiles.queueLength | int | `50` |  |
| storage.kindQueues.containerprofiles.workerCount | int | `2` |  |
| storage.kindQueues.networkneighborhoods.maxObjectSize | int | `10000000` |  |
| storage.kindQueues.networkneighborhoods.queueLength | int | `50` |  |
| storage.kindQueues.networkneighborhoods.workerCount | int | `2` |  |
| storage.kindQueues.openvulnerabilityexchangecontainers.maxObjectSize | int | `500000` |  |
| storage.kindQueues.openvulnerabilityexchangecontainers.queueLength | int | `50` |  |
| storage.kindQueues.openvulnerabilityexchangecontainers.workerCount | int | `1` |  |
| storage.kindQueues.sbomsyftfiltereds.maxObjectSize | int | `50000000` |  |
| storage.kindQueues.sbomsyftfiltereds.queueLength | int | `50` |  |
| storage.kindQueues.sbomsyftfiltereds.workerCount | int | `1` |  |
| storage.kindQueues.sbomsyfts.maxObjectSize | int | `100000000` |  |
| storage.kindQueues.sbomsyfts.queueLength | int | `50` |  |
| storage.kindQueues.sbomsyfts.workerCount | int | `1` |  |
| storage.kindQueues.vulnerabilitymanifests.maxObjectSize | int | `50000000` |  |
| storage.kindQueues.vulnerabilitymanifests.queueLength | int | `50` |  |
| storage.kindQueues.vulnerabilitymanifests.workerCount | int | `1` |  |
| storage.mtls.certgen.retries | int | `60` |  |
| storage.mtls.certgen.retryIntervalSeconds | int | `5` |  |
| storage.mtls.certificateValidityInDays | int | `730` |  |
| storage.mtls.enabled | bool | `true` |  |
| storage.name | string | `"storage"` |  |
| storage.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| storage.podAnnotations | object | `{}` |  |
| storage.podLabels | object | `{}` |  |
| storage.priorityClassName | string | `""` |  |
| storage.queueManagerEnabled | bool | `true` | queue manager configuration |
| storage.resources.limits.cpu | string | `"1500m"` |  |
| storage.resources.limits.memory | string | `"1500Mi"` |  |
| storage.resources.requests.cpu | string | `"100m"` |  |
| storage.resources.requests.memory | string | `"400Mi"` |  |
| storage.serverPort | int | `8443` |  |
| storage.service.annotations | object | `{}` |  |
| storage.service.type | string | `"ClusterIP"` |  |
| synchronizer.image.pullPolicy | string | `"IfNotPresent"` |  |
| synchronizer.image.repository | string | `"quay.io/kubescape/synchronizer"` | source code: https://github.com/kubescape/synchronizer |
| synchronizer.image.tag | string | `"v0.0.147"` |  |
| synchronizer.name | string | `"synchronizer"` |  |
| synchronizer.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| synchronizer.podAnnotations | object | `{}` |  |
| synchronizer.podLabels | object | `{}` |  |
| synchronizer.priorityClassName | string | `""` |  |
| synchronizer.resources.limits.cpu | string | `"200m"` |  |
| synchronizer.resources.limits.memory | string | `"500Mi"` |  |
| synchronizer.resources.requests.cpu | string | `"100m"` |  |
| synchronizer.resources.requests.memory | string | `"250Mi"` |  |
| synchronizer.service.annotations | object | `{}` |  |
| synchronizer.service.port | int | `8089` |  |
| synchronizer.service.protocol | string | `"TCP"` |  |
| synchronizer.service.targetPort | int | `8089` |  |
| synchronizer.service.type | string | `"ClusterIP"` |  |
| unittest | bool | `false` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
