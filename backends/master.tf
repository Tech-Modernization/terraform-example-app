
backend "s3" {
  bucket         = "terraform-example-app-master"
  key            = "master/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "terraform-example-app-master"
  encrypt        = true
}

