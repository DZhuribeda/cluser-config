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
  set {
    name  = "grafana.ingress.tls[0].hosts[0]"
    value = var.grafana_domain
  }
}


resource "kubernetes_config_map" "additional_dashboards" {
  depends_on = [
    helm_release.prometheus,
  ]

  for_each = fileset("${path.module}/dashboards", "*.json")
  metadata {
    name = "${element(split(".", each.key), 0)}-dashboard"
    labels = {
      "grafana_dashboard" = "1"
    }
    namespace = "observability"
  }

  data = {
    "${each.key}" = "${file("${path.module}/dashboards/${each.key}")}"
  }
}
