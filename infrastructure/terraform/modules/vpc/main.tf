resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 1)
}

resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.main.id
}

resource "aws_route_table" "rt" {
  vpc_id     = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt-association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id 
}
