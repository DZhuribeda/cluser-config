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
      "istio-injection" = "enabled"
    }

    name = "counter"
  }
}


resource "kubernetes_namespace" "istio_system" {
  metadata {
    labels = {
      monitoring        = "enabled"
    }

    name = "istio-system"
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
resource "kubernetes_namespace" "istio_ingress" {
  metadata {
    labels = {
      "istio-injection" = "enabled"
      monitoring        = "enabled"
    }

    name = "istio-ingress"
  }
}
