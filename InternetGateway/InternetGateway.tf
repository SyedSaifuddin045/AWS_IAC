provider "aws"{
	region = "ap-south-1"
}

module "vpc"{
	source = "../VPC"
}

resource "aws_internet_gateway" "gw"{
	vpc_id = module.vpc.vpc_id

	tags = {
		Name = "Terra-Internet-Gateway"
	}	
}
