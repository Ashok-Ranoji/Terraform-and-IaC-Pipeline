variable "ami_id" {
}

variable "subnet_id" {
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_id" {
  default = ""  
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default = ""
}

variable "ec2_count" {
  type = number
  default = "2"  
}
