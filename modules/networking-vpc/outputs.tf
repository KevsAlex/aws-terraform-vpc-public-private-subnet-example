//La subnet publica
output "public-subnet" {
  value = aws_subnet.public
}

//La subnet privada
output "private-subnet" {
  value = aws_subnet.private
}

output "public-sg" {
  value = aws_security_group.public-sg
}

output "private-sg" {
  value = aws_security_group.private-sg
}
output "vpc" {
  value = aws_vpc.network-vpc.id
}