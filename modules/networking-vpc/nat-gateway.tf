

resource "aws_eip" "nat-ip-terraform" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat-ip-terraform.id
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "nat-gateway"
  }
}



