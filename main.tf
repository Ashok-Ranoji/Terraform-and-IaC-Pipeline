module "terraformlabvpc" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "myec2" {
  source    = "./modules/ec2"
  ami_id    = "ami-01bb8868a249be5ca"
  subnet_id = module.terraformlabvpc.pri_sub_ids[0]
}

module "aws_key_pair" {
  source = "./modules/keypair"
}

module "s3" {
  source = "./modules/s3"
}

module "aws_security_group" {
  source = "./modules/security group"
}
