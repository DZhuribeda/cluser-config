variable "do_token" {
  sensitive = true
}

variable "cluster_name" {
  default = "primary"
}

variable "region" {
  default = "ams3"
}

variable "cluster_version" {
  default = "1.22.8-do.1"
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