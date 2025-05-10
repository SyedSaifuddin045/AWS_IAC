variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "12.0.0.0/24"
}

variable "project_name" {
  description = "Tag to identify the project"
  type        = string
  default     = "Terraform Devops"
}

