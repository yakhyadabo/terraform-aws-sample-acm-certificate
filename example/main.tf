locals {
  domains = {
    "dev.example.org" = {
      domain_names = ["vault", "kafka", "lambda"]
    },
    "stage.example.org" = {
      domain_names = ["vault", "kafka", "lambda"]
    }
  }
}

module "acm" {
  for_each = local.domains
  source               = "../module"
  region               = var.region
  project_name         = var.project.name
  environment          = var.project.environment
  root_domain          = each.key
  sub_domains           = each.value.domain_names
}