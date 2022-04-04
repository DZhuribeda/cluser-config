resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  version    = "2.6.1"

  namespace        = "observability"

  values = [
    "${file("loki-values.yaml")}"
  ]
}

resource "kubernetes_config_map" "loki_datasource" {
  metadata {
    name = "loki-datasource-config"
    labels = {
      "grafana_datasource" = "1"
    }
    namespace = "observability"
  }

  data = {
    "loki-datasource.yaml" = "${file("${path.module}/loki-datasource.yaml")}"
  }
}
