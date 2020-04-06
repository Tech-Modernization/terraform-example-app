terraform {
  backend "s3" {
    bucket         = "terraform-example-app-release"
    key            = "release/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-example-app-release"
    encrypt        = true
  }
}

module "terraform-example-app" {
  source        = "../../"
  server_port   = 80
  response_text = "Hello, World - release"
  suffix        = "-release"
}

output "http_endpoint" {
  description = "The http endpoint of the web server"
  value       = "${module.terraform-example-app.http_endpoint}"
}