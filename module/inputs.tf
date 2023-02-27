variable "region" {
  type = string
}

variable "project_name" {
  type = string
  description = "Name of the project"
}

variable "root_domain" {
  type = string
  nullable = false

  description = <<EOT
  Name of the domain

  Example : example.com
  EOT
}

variable "domains" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = map(any)
  default = {
    "yakhyadabo.org" = {
      sub_domain_names = ["dev", "test", "stage"]
    },
    "yakhyadabo.com" = {
      sub_domain_names = ["vault", "kafka", "lambda"]
    }
  }
}

variable "domain_name" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = map(any)
  default = {
    "jazzfest.link" = {
      domain_alternative_names = ["neo.jazzfest.link", "trinity.jazzfest.link", "morpheus.jazzfest.link"]
    }
  }
}

variable "validation_method" {
  description = <<EOT
  Validation Method

  Example : DNS | EMAIL
  EOT

  default = "DNS"
}

variable "sub_domains" {
  type = list(string)
  nullable = false

  description = <<EOT
  Name of the sub domain

  Example : ["lambda","vault","kafka","redis"]
  EOT
  default = ["lambda"]
}

variable "environment" {
  type        = string
  description = <<EOT
  The environment short name to use for the deployed resources.

  Options:
  - dev
  - uat
  - prd

  Default: dev
  EOT
  default     = "dev"

  validation {
    condition     = can(regex("^dev$|^uat$|^prd$", var.environment))
    error_message = "Err: invalid environment."
  }

  validation {
    condition     = length(var.environment) <= 3
    error_message = "Err: environment is too long."
  }
}
