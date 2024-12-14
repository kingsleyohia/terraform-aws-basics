terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}


resource "aws_instance" "terraformbuiltec2instance" {
  ami           = "ami-0c76bd4bd302b30ec"  # The ID of the AMI to use for the instance.
  instance_type = "t2.micro"              # The type of instance to start.
  tags = {
    Name = "From Terraform"
  }
}

resource "aws_s3_bucket" "terraformbuilts3bucket" {
  bucket = "terraform-example-bucket-${random_pet.name.id}"
}

resource "random_pet" "name" {
  length    = 1
}

