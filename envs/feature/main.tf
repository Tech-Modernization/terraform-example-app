provider "random" {
  version = "~> 2.2"
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

module "terraform-example-app" {
  source        = "../../"
  response_text = "Hello, World - ${random_string.random.result}"
  suffix        = "-${random_string.random.result}"
}

output "http_endpoint" {
  description = "The http endpoint of the web server"
  value       = "${module.terraform-example-app.http_endpoint}"
}