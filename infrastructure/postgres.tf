resource "digitalocean_database_cluster" "primary" {
  name       = "primary-cluster"
  engine     = "pg"
  version    = "11"
  size       = var.db_size
  region     = var.region
  node_count = var.db_nodes
}

resource "digitalocean_database_firewall" "primary" {
  cluster_id = digitalocean_database_cluster.primary.id

  rule {
    type  = "k8s"
    value = data.digitalocean_kubernetes_cluster.primary.id
  }
}

resource "digitalocean_database_db" "kratos" {
  cluster_id = digitalocean_database_cluster.primary.id
  name       = "kratos"
}

resource "digitalocean_database_user" "kratos" {
  cluster_id = digitalocean_database_cluster.primary.id
  name       = "kratos"
}