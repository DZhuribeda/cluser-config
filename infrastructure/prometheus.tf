resource "helm_release" "prometheus" {
  depends_on = [
    kubernetes_namespace.observability,
  ]

  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "34.6.0"

  namespace = "observability"

  values = [
    "${file("prometheus-values.yaml")}"
  ]

  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
  set {
    name  = "grafana.ingress.hosts[0]"
    value = var.grafana_domain
  }
}
