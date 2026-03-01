terraform workspace new staging
terraform workspace list
terraform workspace select prod
terraform apply --var-file=prod.tfvars