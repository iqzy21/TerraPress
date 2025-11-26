module "ec2" {
    source = "./modules/ec2"
    WP_subnet_id = module.vpc.aws_subnet_id
    WP_security_id = module.vpc.aws_security_id
}

module "vpc" {
    source = "./modules/vpc"
}