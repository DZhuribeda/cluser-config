
resource "kubernetes_secret" "kratos" {
  depends_on = [
    digitalocean_database_db.kratos,
    digitalocean_database_user.kratos,
    kubernetes_namespace.kratos,
  ]
  metadata {
    name      = "kratos-dev-secret"
    namespace = "kratos"
  }

  data = {
    dsn = "postgresql://kratos:${digitalocean_database_user.kratos.password}@${digitalocean_database_cluster.primary.private_host}:${digitalocean_database_cluster.primary.port}/kratos?sslmode=require&max_conns=20&max_idle_conns=4"
    # TODO
    smtpConnectionURI = "smtps://test:test@mailslurper:1025/?skip_ssl_verify=true"
    secretsDefault = "ipsumipsumipsumi"
    secretsCookie = "ipsumipsumipsumi"
    secretsCipher = "ipsumipsumipsumipsumipsumipsumip"
  }
}

resource "helm_release" "kratos" {
  depends_on = [
    kubernetes_namespace.kratos
  ]
  name       = "kratos"
  repository = "https://k8s.ory.sh/helm/charts"
  chart      = "kratos"

  namespace  = "kratos"
  values = [
    "${file("kratos-values.yaml")}"
  ]

  set {
    name = "secret.nameOverride"
    value = "kratos-dev-secret"
  }
}
