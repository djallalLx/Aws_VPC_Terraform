output "public_subnet_id" {
  description = "ID du sous-réseau public créé"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID du sous-réseau privé créé"
  value       = aws_subnet.private.id
}
