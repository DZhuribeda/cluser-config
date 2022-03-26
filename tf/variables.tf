variable "do_token" {}

variable "cluster_name" {
  default = "primary"
}

variable "region" {
  default = "fra1"
}

variable "cluster_version" {
  default = "1.22.7-do.0"
}

variable "min_worker_count" {
  default = 1
}

variable "max_worker_count" {
  default = 5
}

variable "worker_size" {
  default = "g-2vcpu-8gb"
}