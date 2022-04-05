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
    }

    name = "counter"
  }
}
