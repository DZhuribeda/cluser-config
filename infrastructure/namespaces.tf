resource "kubernetes_namespace" "observability" {
  metadata {
    labels = {
      monitoring = "enabled"
    }

    name = "observability"
  }
}

resource "kubernetes_namespace" "counter" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }

    name = "counter"
  }
}

resource "kubernetes_namespace" "cert_manager" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }

    name = "cert-manager"
  }
}
resource "kubernetes_namespace" "argocd" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }

    name = "argocd"
  }
}
resource "kubernetes_namespace" "argo_rollouts" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }

    name = "argo-rollouts"
  }
}

resource "kubernetes_namespace" "kratos" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }
    name = "kratos"
  }
}