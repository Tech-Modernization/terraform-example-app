provider "aws" {
  version = "~> 2"
}

provider "template" {
  version = "~> 2"
}


data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.tpl")}"
  vars = {
    app_port = "${var.server_port}"
  }
}


resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.server_port.id, aws_security_group.ssh.id]
  key_name               = var.ssh_key_name

  user_data = data.template_file.user_data.rendered

  tags = {
    Name = "${var.instance_name}${var.suffix}"
  }
}

resource "aws_security_group" "server_port" {
  name = "${var.security_group_name}-http${var.suffix}"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.security_group_name}${var.suffix}"
  }
}

resource "aws_security_group" "ssh" {
  name = "${var.security_group_name}-ssh${var.suffix}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.security_group_name}${var.suffix}"
  }
}

output "user_data" {
  value = data.template_file.user_data.rendered
}
