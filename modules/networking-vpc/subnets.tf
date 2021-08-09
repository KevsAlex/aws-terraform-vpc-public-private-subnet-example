
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.network-vpc.id
  cidr_block = "172.10.0.0/24"

  tags = {
    Environment = terraform.workspace
    Access = "private"
    Name = "kevs-private-terraform"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.network-vpc.id
  cidr_block = "172.10.1.0/25"


  tags = {
    Environment = terraform.workspace
    Access = "public"
    Name = "kevs-public-terraform"
  }
}