

resource "helm_release" "oathkeeper" {
  depends_on = [
    kubernetes_namespace.oathkeeper
  ]
  name       = "oathkeeper"
  repository = "https://k8s.ory.sh/helm/charts"
  chart      = "oathkeeper"

  namespace  = "oathkeeper"
  values = [
    "${file("oathkeeper-values.yaml")}"
  ]

  # set {
  #   name="oathkeeper.mutatorIdTokenJWKs"
  #   value="${file("./id_token.jwks.json")}"
  # }
}

resource "kubernetes_manifest" "oathkeeper-rule" {
  manifest = yamldecode(file("oathkeeper-rule.yaml"))
}
