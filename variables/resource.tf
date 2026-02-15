resource "aws_security_group" "expense" {
  name        = var.expense_security_group.name
  description = var.expense_security_group.description

  ingress {
    from_port   = var.ports
    to_port     = var.ports
    protocol    = var.protocols
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Description = var.tags.name
    CreatedBy   = var.tags.CreatedBy
  }
}

resource "aws_instance" "expense" {
  instance_type          = var.instance_type == "us-east-1" ? "m4.xlarge" : "t2.medium"
  ami                    = var.Instance_AMI.ami # Replace with valid AvarMI for your region#
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = {
    Name = "expense"
  }
}
