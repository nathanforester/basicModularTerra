variable "Greatest_key_ever" {
    type    = string
    default = "New-Key"
}

variable "My_EC2_type" {
    type    = string
    default = "t2.micro"
}

variable "My_ami" {
    type    = string
    default = "ami-0194c3e07668a7e36"
}

variable "public_subnet_id_my_app" {
    type    = string
}

variable "vpc_security_group_id_my_app" {
    type    = string
}

