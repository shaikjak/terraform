variable "expense_security_group" {
    default = {
    name = "expense_security_group"
  description = "security group for expense"
    }
}

variable "ports" {
    default = 22
}
variable "protocols" {
    default = "tcp"
}
variable "cidr_blocks" {
    type = list(string)
}

variable "tags" {
    default = {
    Description = "expense instance"
    CreatedBy   = "jakeer"
    }
}

variable "Instance_AMI" {
    default = {
        ami = "ami-0c1fe732b5494dc14"
        instance_type = "t2.micro"
    }
}