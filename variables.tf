variable "aws_access_key_id" {
  description = "Clé d'accès AWS"
  type        = string
}

variable "aws_secret_access_key" {
  description = "Clé secrète AWS"
  type        = string
}


variable "region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "server_web_user_data" {
  description = "Script de configuration pour le serveur web"
  type        = string
  default     = ""
}

