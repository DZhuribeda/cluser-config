resource "helm_release" "loki" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  version    = "2.6.1"

  namespace        = "observability"

  values = [
    "${file("loki-values.yaml")}"
  ]
}
