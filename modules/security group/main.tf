resource "aws_security_group" "sg_ec2_1" {
  name        = "sg_ec2_1"
  description = "Allow inbound HTTP traffic"
    tags = {
    Name = "EC2 Security Group1"
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "HTTP from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

resource "aws_security_group" "sg_ec2_2" {
  name        = "sg_ec2_2"
  description = "Allow inbound HTTP traffic"
    tags = {
    Name = "EC2 Security Group2"
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "HTTP from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}