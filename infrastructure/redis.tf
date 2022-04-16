resource "digitalocean_database_cluster" "counter_app_redis" {
  name       = "counter-app-redis-cluster"
  engine     = "redis"
  version    = "6"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
}

resource "kubernetes_secret" "counter_app_redis_creds" {
  depends_on = [
    digitalocean_database_cluster.counter_app_redis,
    kubernetes_namespace.counter,
  ]
  metadata {
    name      = "counter-app-dev-redis-creds"
    namespace = "counter"
  }

  data = {
    private_uri = digitalocean_database_cluster.counter_app_redis.private_uri
  }
}