resource "helm_release" "prometheus" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "34.6.0"

  namespace        = "observability"
  create_namespace = true

  values = [
    "${file("prometheus-values.yaml")}"
  ]

  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin
  }
}
