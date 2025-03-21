output "igw_id" {
  description = "ID de l'Internet Gateway créé"
  value       = aws_internet_gateway.Igw
}

output "route_table_id" {
  description = "ID de la table de routage publique"
  value       = aws_route_table.public.id
}
