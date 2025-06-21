# Terraform Block with Backend and Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terra-bucket221"
    key    = "terraform/vpc.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# VPC Resource
resource "aws_vpc" "my-vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-us-vpc"
  }
}
