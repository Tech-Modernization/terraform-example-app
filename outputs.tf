output "http_endpoint" {
  description = "The http endpoint of the web server"
  value       = "http://${aws_instance.example.public_ip}:${var.server_port}/"
}


