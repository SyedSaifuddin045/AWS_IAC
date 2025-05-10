provider "aws"{
	region = "ap-south-1"
}

resource "aws_internet_gateway" "gw"{
	vpc_id = var.vpc_id

	tags = {
		Name = "Terra-Internet-Gateway"
	}	
}
