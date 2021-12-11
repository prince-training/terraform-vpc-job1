resource "aws_vpc" "dev-project1" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "dev-project1"
  }
}

resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.dev-project1.id
  cidr_block = var.sub1-private_cidr

  tags = {
    Name = "private-sub1"
  }
}

resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.dev-project1.id
  cidr_block = var.sub1-public_cidr

  tags = {
    Name = var.tag_pub-sub1
  }
}


resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.dev-project1.id

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.dev-project1.id

  tags = {
    Name = "private-route-table"
  }
}


resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}


resource "aws_internet_gateway" "igw-gateway" {
  vpc_id = aws_vpc.dev-project1.id

  tags = {
    Name = "igw-gateway"
  }
}

resource "aws_route" "igw-route" {
  route_table_id            = aws_route_table.public-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw-gateway.id
}