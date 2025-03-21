module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "mon-vpc"
}

module "subnets" {
  source                  = "./modules/subnets"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_cidr      = "10.0.1.0/24"
  private_subnet_cidr     = "10.0.2.0/23"
  availability_zone_public = "us-east-1"  # Choisissez la zone de disponibilité souhaitée
  availability_zone_private = "us-east-1"  # Vous pouvez la modifier si nécessaire
  public_subnet_name      = "mon-subnet-public"
  private_subnet_name     = "mon-subnet-prive"
}

module "internet" {
  source           = "./modules/network"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_id
  igw_name         = "mon-igw"
  route_table_name = "mon-route-table"
}

module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = "ami-084568db4383264d4"      # Remplacez par l'AMI de votre choix
  instance_type          = "t2.micro"
  public_subnet_id       = module.subnets.public_subnet_id
  instance_name          = "mon-instance-web"
  user_data              = file("scripts/install.sh")  # Vous pourrez y insérer le script de configuration de votre serveur web ultérieurement
  vpc_security_group_ids = [module.security_group.sg_id]
  key_name               = "sarah"

}

module "security_group" {
  source = "./modules/security-group"

  # Variables requises
  vpc_id               = module.vpc.vpc_id  
  sg_name              = "mon-web-sg"
  allowed_http_cidrs   = ["0.0.0.0/0"]      # Ajustez selon vos besoins
  allowed_ssh_cidrs    = ["0.0.0.0/0"]      # Ajustez selon vos besoins
}
