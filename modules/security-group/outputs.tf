output "sg_id" {
  description = "ID du groupe de sécurité créé"
  value       = aws_security_group.web_sg.id
}
