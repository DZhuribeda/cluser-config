resource "helm_release" "istio_base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"

  namespace = "istio-system"
  create_namespace = true
}

resource "helm_release" "istiod" {
  depends_on = [
    helm_release.istio_base
  ]
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"

  wait = true
  namespace = "istio-system"
}


resource "helm_release" "istio_ingress" {
  depends_on = [
    kubernetes_namespace.istio_ingress,
    helm_release.istiod,
  ]
  name       = "istio-ingress"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"

  wait = true
  namespace = "istio-ingress"
}
