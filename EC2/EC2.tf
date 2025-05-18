provider "aws"{
	region = var.region
}

module "vpc"{
	source = "../VPC"
} 

module "aws_internet_gateway"{
	source = "../InternetGateway"
	vpc_id = module.vpc.vpc_id
}

module "public_subnet"{
	source = "../Subnet/Public"
	vpc_id = module.vpc.vpc_id
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-11-amd64-*"] # Match Debian 11 images
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["136693071363"] # Official Debian owner ID
}

resource "aws_instance" "EC2"{
	ami = data.aws_ami.debian.id
	instance_type = "t2.micro"
	subnet_id = module.public_subnet.subnet_id
	
	tags = {
		Name = "Terra_EC2"
	}
}
