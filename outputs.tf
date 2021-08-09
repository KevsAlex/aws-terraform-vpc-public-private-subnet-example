output "template" {
  value = templatefile("test.tpl",
  {
    "public-ec2-name" = aws_instance.bastion-public-terraform.tags.Name,
    "public-ec2-ip" = aws_instance.bastion-public-terraform.public_ip
    "aws_key_pair-name" = aws_key_pair.ec2-kevs-terraform.key_name
    "private-ec2-ip" = aws_instance.private-instance.private_ip
    "vpc-id" = module.NETWORK.vpc
  })
}

