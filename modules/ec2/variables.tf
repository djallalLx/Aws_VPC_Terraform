variable "ami_id" {
  description = "ID de l'AMI pour l'instance EC2"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "ID du sous-réseau public où sera lancée l'instance"
  type        = string
}


variable "instance_name" {
  description = "Nom donné à l'instance (tag)"
  type        = string
  default     = "server-web"
}

variable "user_data" {
  description = "Script user_data pour configurer l'instance (optionnel)"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Nom de la paire de clés SSH pour l'accès à l'instance EC2"
  type        = string
  default     = "sarah"  # ou laissez vide si vous préférez
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Liste des Security Groups à associer à l'instance"
}
