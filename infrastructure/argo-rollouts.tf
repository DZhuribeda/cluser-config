resource "helm_release" "argo_rollouts" {
  depends_on = [
    kubernetes_namespace.argo_rollouts
  ]
  name       = "argo-rollouts"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-rollouts"
  version    = "2.14.0"

  namespace        = "argo-rollouts"

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.additionalLabels.prometheus"
    value = "primary"
  }


  set {
    name  = "dashboard.enabled"
    value = "true"
  }
}
