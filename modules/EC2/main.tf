

resource "aws_instance" "webserver" {
	ami           = var.My_ami
	instance_type = var.My_EC2_type
	key_name      = var.Greatest_key_ever
    subnet_id     = var.public_subnet_id_my_app
    
    
    vpc_security_group_ids = [var.vpc_security_group_id_my_app]

	
    associate_public_ip_address = true
    
    tags = {
        Name = "NathanF"
    }
}