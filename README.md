

```
terraform init
```

```
terraform plan -var-file="../secrets.tfvars"
```

or 
```
export TF_VAR_do_token=<token here>
terraform plan
```


```
terraform apply -var-file="../secrets.tfvars"
```


```
terraform destroy -var-file="../secrets.tfvars"
```


```
doctl kubernetes cluster kubeconfig save $(jq -r .outputs.cluster_id.value terraform.tfstate)
```


```
kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 -n observability   
```

```
kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n observability
```

Password for argocd
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

```
kubectl argo rollouts dashboard
```

```
kubectl port-forward svc/kiali 20001:20001 -n istio-system
```