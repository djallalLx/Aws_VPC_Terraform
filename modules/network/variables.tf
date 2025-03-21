variable "vpc_id" {
  description = "ID du VPC associé"
  type        = string
}

variable "public_subnet_id" {
  description = "ID du sous-réseau public pour l'association de la table de routage"
  type        = string
}

variable "igw_name" {
  description = "Nom de l'Internet Gateway"
  type        = string
  default     = "my-igw"
}

variable "route_table_name" {
  description = "Nom de la table de routage publique"
  type        = string
  default     = "public-route-table"
}
