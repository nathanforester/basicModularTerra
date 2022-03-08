resource "aws_vpc" "mainvpc" {
  cidr_block = var.Monday_vpccidr
  tags = {
    Name = "${var.name}.tf.vpc"
  }
}

# Create an igw
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "${var.name}.igw"
  }
}

# Create public sub
resource "aws_subnet" "Nathan_subpublic" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = var.Monday_cidrsubpub1
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}.subpublic"
  }
}



# Creating a public route table
resource "aws_route_table" "Nathan_routepublic" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = var.Monday_opencidr
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.name}.route.public"
  }
}


# Route table associations
resource "aws_route_table_association" "Nathan_routeapp" {
  subnet_id = aws_subnet.subpublic.id
  route_table_id = aws_route_table.routepublic.id
}


# Creating security group for webapp
resource "aws_security_group" "Nathan_sgapp" {
  name        = "sgapp"
  description = "access ssh and httpx"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
   description = "http"
   from_port = 80 
   to_port = 80 
   protocol = "tcp"
   cidr_blocks = [var.Monday_opencidr]
  }

  ingress {
   description = "ssh"
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = [var.Monday_opencidr]
    
  }

  egress {
   to_port = 0 
   from_port = 0
   protocol = -1 
   cidr_blocks = [var.Monday_opencidr]
  }

  tags = {
    Name = "${var.name}sg.app"
  }
}


