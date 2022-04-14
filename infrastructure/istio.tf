resource "helm_release" "istio_base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = "1.13.2"

  namespace        = "istio-system"
  create_namespace = true
}

resource "helm_release" "istiod" {
  depends_on = [
    helm_release.istio_base
  ]
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  version    = "1.13.2"

  wait      = true
  namespace = "istio-system"

  values = [
    "${file("istio-values.yaml")}"
  ]
}


resource "helm_release" "istio_ingress" {
  depends_on = [
    kubernetes_namespace.istio_ingress,
    helm_release.istiod,
  ]
  name       = "istio-ingressgateway"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"
  version    = "1.13.2"

  wait      = true
  namespace = "istio-ingress"

  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io\\/do-loadbalancer-name"
    value = "kube-balancer"
  }
}
