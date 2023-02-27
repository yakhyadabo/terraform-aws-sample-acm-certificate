variable "region" {
  default = "us-east-1"
}

variable "project" {
  type = object({
    name = string
    team      = string
    contact_email  = string
    environment = string
  })

  description = "Project details"
}

variable "root_domain" {
  type = string
  nullable = false

  description = <<EOT
  Name of the domain

  Example : example.com
  EOT
}

variable "sub_domains" {
  type = list(string)
  nullable = false

  description = <<EOT
  Name of the sub domain

  Example : dev
  EOT
}