
resource "aws_vpc" "network-vpc" {
  cidr_block = "172.10.0.0/16"

  tags = {
    Environment = terraform.workspace
    Name = "vpc"
  }
}