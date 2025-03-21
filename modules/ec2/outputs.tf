output "instance_id" {
  description = "ID de l'instance EC2 créée"
  value       = aws_instance.web.id
}
