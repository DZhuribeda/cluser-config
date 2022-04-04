resource "helm_release" "tempo" {
  name       = "tempo"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "tempo"
  version    = "0.14.2"

  namespace        = "observability"

  values = [
    "${file("tempo-values.yaml")}"
  ]
}

resource "kubernetes_config_map" "tempo_datasource" {
  metadata {
    name = "tempo-datasource-config"
    labels = {
      "grafana_datasource" = "1"
    }
    namespace = "observability"
  }

  data = {
    "tempo-datasource.yaml" = "${file("${path.module}/tempo-datasource.yaml")}"
  }
}
