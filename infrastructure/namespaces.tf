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
      monitoring = "enabled"
      "istio-injection" = "enabled"
    }

    name = "counter"
  }
}


resource "kubernetes_namespace" "istio_ingress" {
  metadata {
    labels = {
      "istio-injection" = "enabled"
    }

    name = "istio-ingress"
  }
}
