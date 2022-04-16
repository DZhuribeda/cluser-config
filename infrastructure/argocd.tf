resource "helm_release" "argocd" {
  depends_on = [
    kubernetes_namespace.argocd
  ]
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "4.5.1"

  namespace        = "argocd"

  values = [
    "${file("argocd-values.yaml")}"
  ]
  set {
    name  = "server.ingress.hosts[0]"
    value = var.argocd_domain
  }
  set {
    name  = "server.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password
  }
}