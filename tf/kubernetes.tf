resource "digitalocean_kubernetes_cluster" "primary" {
  region  = var.region
  name    = var.cluster_name
  version = var.cluster_version

  node_pool {
    name       = "default-worker-pool"
    size       = var.worker_size
    auto_scale = true
    min_nodes  = var.min_worker_count
    max_nodes  = var.max_worker_count
  }
}