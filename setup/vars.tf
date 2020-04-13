variable "region" {
  description = "AWS Region"
  type        = string
}

variable "backend_name" {
  description = "The name used to create both the bucket & the DynamoDB table. (Note: This must be globally unique)"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of an ssh key to deploy to the servers."
  type        = string
}

