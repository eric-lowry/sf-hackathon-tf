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

This will generate a report that looks like this:

```
Deployment: sf-hackathon-test-01
  kibanaEndpoint  = "https://<id-01>.us-west1.gcp.cloud.es.io:9243"
  adminUsername   = "elastic"
  adminPassword   = "<password-01>"
  elasticEndpoint = "https://<id-01>.us-west1.gcp.cloud.es.io:443"
  cloudId         = "sf-hackathon-test-01:<data-01>"

Deployment: sf-hackathon-test-02
  kibanaEndpoint  = "https://<id-02>.us-west1.gcp.cloud.es.io:9243"
  adminUsername   = "elastic"
  adminPassword   = "<password-02>"
  elasticEndpoint = "https://<id-02>.us-west1.gcp.cloud.es.io:443"
  cloudId         = "sf-hackathon-test-02:<data-02>"

  ...
```

6. After the hackathon/event, destroy the instances

```bash
terraform destroy
```

## References:

* [Generating an API Key](https://registry.terraform.io/providers/elastic/ec/latest/docs#api-key-authentication-recommended)
