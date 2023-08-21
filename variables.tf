variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_id" {
}

variable "size" {
  type    = number
  default = "10"
}