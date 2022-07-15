terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = var.region
    profile=var.profile
}

resource "aws_instance" "site" {
    ami = "ami-0fb391cce7a602d1f"
    instance_type = "t2.micro"
    key_name = "nana-boot-key"
    vpc_security_group_ids = ["sg-013bd0e289bb35281"]
    tags = {
            Name = var.name
            group = var.group
        }
}