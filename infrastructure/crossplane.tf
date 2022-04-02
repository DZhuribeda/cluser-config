# resource "helm_release" "crossplane" {
#   name       = "crossplane-stable"
#   repository = "https://charts.crossplane.io/stable"
#   chart      = "crossplane"
#   version    = "1.7.0"

#   namespace        = "crossplane-system"
#   create_namespace = true

#   set {
#     name  = "provider.packages"
#     value = "{crossplane/provider-digitalocean:v0.1.0}"
#   }
# }

# resource "kubernetes_secret" "do_creds" {
#   depends_on = [
#     helm_release.crossplane,
#   ]

#   metadata {
#     name      = "digitalocean-creds"
#     namespace = "crossplane-system"
#   }

#   data = {
#     token = var.do_token
#   }
# }


# resource "kubernetes_manifest" "crossplane-provider-digitalocean-config" {
#   depends_on = [
#     helm_release.crossplane,
#   ]

#   manifest = {
#     "apiVersion" = "do.crossplane.io/v1alpha1"
#     "kind"       = "ProviderConfig"
#     "metadata" = {
#       "name" = "digitalocean"
#     }
#     "spec" = {
#       "credentials" = {
#         "source" = "Secret"
#         "secretRef" = {
#           "namespace" : "crossplane-system"
#           "name" : "digitalocean-creds"
#           "key" : "token"
#         }
#       }
#     }
#   }
# }
