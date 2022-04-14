variable "do_token" {
  sensitive = true
}

variable "cluster_name" {
  default = "primary"
}

variable "region" {
  default = "ams3"
}

variable "registry_username" {}


variable "registry_password" {
  sensitive = true
}

variable "registry_email" {}

variable "grafana_admin_password" {
  sensitive = true
}
variable "cert_issuer" {}
variable "grafana_domain" {}
variable "argocd_domain" {}
variable "argocd_admin_password" {
  sensitive = true
}