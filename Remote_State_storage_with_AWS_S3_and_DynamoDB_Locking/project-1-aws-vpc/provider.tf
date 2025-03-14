terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
  backend "s3" {
    bucket = "terraform-bucket-name"
    key    = "dev/project-1-vpc/terraform.tfstate"
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "dev-project1-vpc-dynamodbtable"  
  }  
}

provider "aws" {
  region = var.aws_region
}