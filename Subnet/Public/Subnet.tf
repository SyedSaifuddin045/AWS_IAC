provider "aws"{
	region = "ap-south-1"
}

module "vpc"{
	source = "../../VPC"
}

resource "aws_subnet" "public_subnet"{
	vpc_id = module.vpc.vpc_id
	cidr_block = "12.0.0.0/28"
	map_public_ip_on_launch = true

	tags = {
		Name = "Public Subnet"
	}
}
