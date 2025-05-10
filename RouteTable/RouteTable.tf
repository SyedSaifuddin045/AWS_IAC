provider "aws"{
	region = "ap-south-1"
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

resource "aws_route_table" "public_rt"{
	vpc_id = module.vpc.vpc_id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = module.aws_internet_gateway.id
	}
	
	tags = {
		Name = "TerraForm RouteTable"
	}
}

resource "aws_route_table_association" "Public_Association"{
	route_table_id = aws_route_table.public_rt.id
	subnet_id = module.public_subnet.id
}
