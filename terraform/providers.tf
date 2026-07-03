terraform {
  backend "s3" {
    bucket         = "devops-assessment-terraform-state"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devops-terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
}
