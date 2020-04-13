terraform {
  backend "s3" {
    bucket         = "terraform-example-app"
    key            = "default/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-example-app"
    encrypt        = true
  }
}
