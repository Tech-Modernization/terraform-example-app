terraform {
  backend "s3" {
    bucket         = "terraform-example-app-master"
    key            = "master/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-example-app-master"
    encrypt        = true
  }
}

module "terraform-example-app" {
  source        = "../../"
  response_text = "Hello, World - master"
  suffix        = "-master"
}

output "http_endpoint" {
  description = "The http endpoint of the web server"
  value       = "${module.terraform-example-app.http_endpoint}"
}