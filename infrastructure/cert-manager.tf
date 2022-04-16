resource "helm_release" "cert_manager" {
  depends_on = [
    kubernetes_namespace.cert_manager
  ]

  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.8.0"

  namespace        = "cert-manager"


  set {
    name  = "installCRDs"
    value = "true"
  }
  set {
    name  = "prometheus.enabled"
    value = "true"
  }
  set {
    name  = "prometheus.servicemonitor.enabled"
    value = "true"
  }
  set {
    name  = "prometheus.servicemonitor.prometheusInstance"
    value = "primary"
  }
}

resource "kubernetes_manifest" "cert_issuer_staging" {
  depends_on = [
    helm_release.cert_manager
  ]
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-staging"
    }
    "spec" = {
      "acme" = {
        "email" = var.cert_issuer
        "privateKeySecretRef" = {
          "name" = "letsencrypt-staging"
        }
        "server" = "https://acme-staging-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "http01" = {
              "ingress" = {
                "class" = "istio"
              }
            }
          },
        ]
      }
    }
  }
}

resource "kubernetes_manifest" "cert_issuer_production" {
  depends_on = [
    helm_release.cert_manager
  ]
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-prod"
    }
    "spec" = {
      "acme" = {
        "email" = var.cert_issuer
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "http01" = {
              "ingress" = {
                "class" = "istio"
              }
            }
          },
        ]
      }
    }
  }
}