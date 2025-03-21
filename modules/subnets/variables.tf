variable "vpc_id" {
  description = "ID du VPC associé"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR du sous-réseau public"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR du sous-réseau privé"
  type        = string
}

variable "availability_zone_public" {
  description = "Zone de disponibilité pour le sous-réseau public"
  type        = string
}

variable "availability_zone_private" {
  description = "Zone de disponibilité pour le sous-réseau privé"
  type        = string
}

variable "public_subnet_name" {
  description = "Nom du sous-réseau public"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_name" {
  description = "Nom du sous-réseau privé"
  type        = string
  default     = "private-subnet"
}
