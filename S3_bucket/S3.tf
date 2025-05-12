provider "aws"{
	region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket"{
	bucket = "terraform-bucket-s3-syed"
}
