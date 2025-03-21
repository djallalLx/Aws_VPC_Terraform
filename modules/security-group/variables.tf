variable "vpc_id" {
  description = "ID du VPC dans lequel le groupe de sécurité sera créé"
  type        = string
}

variable "sg_name" {
  description = "Nom du groupe de sécurité"
  type        = string
  default     = "web-sg"
}

variable "allowed_http_cidrs" {
  description = "Liste des CIDR autorisés pour HTTP/HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_ssh_cidrs" {
  description = "Liste des CIDR autorisés pour SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
