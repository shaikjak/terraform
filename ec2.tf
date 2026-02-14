terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "expense" {
  name        = "expense"
  description = "security group for expense"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Description = "expense instance"
    CreatedBy   = "jakeer"
  }
}

resource "aws_instance" "expense" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c1fe732b5494dc14" # Replace with valid AMI for your region
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = {
    Name = "expense"
  }
}
