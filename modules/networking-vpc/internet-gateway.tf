resource "aws_internet_gateway" "igw" { #1
  vpc_id = aws_vpc.network-vpc.id

  tags = {
    Environment = terraform.workspace
    Name = "internet-gateway"
  }
}

