resource "aws_vpc" "test-vpc" {
  cidr_block       = "103.0.0.0/21"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpcTest"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "103.0.0.0/24"

  tags = {
    Name = "subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "VPC_TEST"
  }
}