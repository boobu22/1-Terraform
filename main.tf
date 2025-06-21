# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my-vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "my-us-vpc"
  }
}
terraform {
  backend "s3" {
    bucket         = "terra-bucket221"
    key            = "terraform/vpc.tfstate"
    region         = "us-east-1"
  }
}

