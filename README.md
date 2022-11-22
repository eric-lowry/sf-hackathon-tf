# sf-hackathon-tf

Terraform script for creating hackathon deployments

## Instructions

1. Clone this repo
2. Create an override.tf with your apikey
3. Edit main.tf for your event
4. Run terraform

```bash
terraform init
terraform plan
terraform apply
```

5. List deployments details

```bash
terrform output -json | ./list-deployments
```


## References:

* [Generating an API Key](https://registry.terraform.io/providers/elastic/ec/latest/docs#api-key-authentication-recommended)
