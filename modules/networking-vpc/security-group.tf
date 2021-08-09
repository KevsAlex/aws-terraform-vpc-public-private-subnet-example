resource "aws_security_group" "public-sg" {
  name        = "kevs-sg"
  description = "vpc security group"
  vpc_id      = aws_vpc.network-vpc.id

  tags = {
    Name = "vpc security group"
  }
}

resource "aws_security_group_rule" "service-port" {

  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  security_group_id = aws_security_group.public-sg.id
  cidr_blocks = ["0.0.0.0/0"]
  description = "ssh to all"
}

resource "aws_security_group_rule" "allow_all-sg" {
  type              = "egress"
  to_port           = 0
  protocol          = "all"
  from_port         = 0
  security_group_id = aws_security_group.public-sg.id
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group" private-sg {
  name        = "kevs-private-sg"
  description = "sg creado en terraform"
  vpc_id      = aws_vpc.network-vpc.id

  tags = {
    Name = "kevs-private-sg"
  }
}

resource "aws_security_group_rule" "private-icmp" {

  type              = "ingress"
  to_port           = "-1"
  protocol          = "icmp"
  from_port         = "-1"
  security_group_id = aws_security_group.private-sg.id
  cidr_blocks = [aws_subnet.public.cidr_block]
  description = "ICMP"
}

resource "aws_security_group_rule" "private-ssh" {

  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  security_group_id = aws_security_group.private-sg.id
  cidr_blocks = ["0.0.0.0/0"]
  description = "SSH"
}

resource "aws_security_group_rule" "allow_all-sg-private" {
  type              = "egress"
  to_port           = 0
  protocol          = "all"
  from_port         = 0
  security_group_id = aws_security_group.private-sg.id
  cidr_blocks = ["0.0.0.0/0"]
}
