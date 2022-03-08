provider "aws" {
    region     = "eu-west-2"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module vpc {
    source = "./modules/vpc/"
}

module EC2 {
    source = "./modules/EC2"
    
    subnet_id = module.vpc.subnet_id

    vpc_security_group_id = module.vpc.security_group_id
}