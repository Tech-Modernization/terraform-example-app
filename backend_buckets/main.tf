provider "aws" {
  version = "~> 2"
}

module "release_backend" {
  source = "git@github.com:AaronNBrock/s3-backend-resources.git?ref=v0.1.0"

  backend_name = "terraform-example-app-release"
}

module "master_backend" {
  source = "git@github.com:AaronNBrock/s3-backend-resources.git?ref=v0.1.0"

  backend_name = "terraform-example-app-master"
}


