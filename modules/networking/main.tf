resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = var.vpc_tags
}

resource "aws_flow_log" "main" {
  vpc_id      = aws_vpc.main.id
  traffic_type = "ALL"

  log_destination_type = "cloud-watch-logs"
  log_destination = "arn:aws:logs:us-east-1:123456789012:log-group:my-flow-logs-group:*"
}

## Create public subnets
resource "aws_subnet" "public" {
    count = length(var.pub_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.pub_cidrs[count.index]
    availability_zone = data.aws_availability_zones.az.names[count.index]
    tags = {
      Name = "Public-${count.index + 1}"  
    }
}

## Create Internet Gateway
resource "aws_internet_gateway" "main" { 
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "InternetGateway"
  }
}

## Create Route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public router"
  }
}

## Associate route table with public subnets
resource "aws_route_table_association" "public" {
  count = length(var.pub_cidrs)
  subnet_id      = local.pub_sub_ids[count.index]
  route_table_id = aws_route_table.public.id
}

## Create private subnets
resource "aws_subnet" "private" {
    count = length(var.pri_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.pri_cidrs[count.index]
    availability_zone = local.azs[count.index]
    tags = {
      Name = "Private-${count.index + 1}"
    }
}
