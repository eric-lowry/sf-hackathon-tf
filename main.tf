terraform {
  required_version = ">= 1.0.0"

  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.5.0"
    }
  }
}

provider "ec" {
}

resource "ec_deployment" "custom-deployment-id" {
  name                   = "tf-test-deployments-${count.index}"

  region                 = "gcp-us-west1"
  version                = "8.5.1"
  deployment_template_id = "gcp-memory-optimized-v2"

  elasticsearch {
    autoscale = "true"
  }

  kibana {}
  integrations_server {}

  count = 2
}

output "elasticsearch_endpoints" {
  value = [ec_deployment.custom-deployment-id[*].elasticsearch[0].https_endpoint]
}

output "elasticsearch_cloud_ids" {
  value = [ec_deployment.custom-deployment-id[*].elasticsearch[0].cloud_id]
}

output "elasticsearch_usernames" {
  value = [ec_deployment.custom-deployment-id[*].elasticsearch_username]
}

output "elasticsearch_passwords" {
  value = [ec_deployment.custom-deployment-id[*].elasticsearch_password]
  sensitive = true
}

output "kibana_endpoints" {
  value = [ec_deployment.custom-deployment-id[*].kibana[0].https_endpoint]
}
