

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