variable "ami" {
  description = "The ami used to create the ec2 instance."
  type        = string
  default     = "ami-07d0cf3af28718ef8"
}

variable "ssh_key_name" {
  description = "The name of an ssh key to deploy to the servers."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The type of ec2 instance to use."
  type        = string
  default     = "t2.micro"
}

variable "suffix" {
  description = "A suffix added to the names of resources"
  type        = string
  default     = ""
}


variable "instance_name" {
  description = "The name of ec2 instance."
  type        = string
  default     = "terraform-example-app"
}

variable "security_group_name" {
  description = "The name of security group."
  type        = string
  default     = "terraform-example-app-security-group"
}

variable "response_text" {
  description = "The text the server will respond with for HTTP requests"
  type        = string
  default     = "Hello, World"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

