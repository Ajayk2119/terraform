terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "remote-s3-backend-tf"
    region = "ap-south-1"
    key = "terraform.tfstate"
    dynamodb_table = "tf-table"
    
  }
}
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}


