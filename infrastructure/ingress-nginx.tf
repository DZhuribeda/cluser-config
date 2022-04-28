resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx" {
  depends_on = [
    kubernetes_namespace.ingress_nginx,
  ]

  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace = "ingress-nginx"
  set {
    name = "controller.podAnnotations.linkerd\\.io\\/inject"
    value = "enabled"
  }
  set {
    name = "controller.config.enable-opentracing"
    value = "true"
  }
  set {
    name = "controller.config.zipkin-collector-host"
    value = "tempo.observability.svc.cluster.local"
  }
  set {
    name = "controller.config.zipkin-service-name"
    value = "nginx-internal"
  }
}
