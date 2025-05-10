provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name    = "Terra-VPC"
    Project = var.project_name
  }
}
