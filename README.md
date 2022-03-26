

```
terraform init
```

```
terraform plan -var-file="secrets.tfvars"
```

or 
```
export TF_VAR_do_token=<token here>
terraform plan
```


```
terraform apply -var-file="secrets.tfvars"
```


```
terraform destroy -var-file="secrets.tfvars"
```
