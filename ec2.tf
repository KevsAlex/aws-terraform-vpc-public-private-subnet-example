
//Create some resources based on PUBLIC network and private network created in "networking-vpc" 
resource "aws_instance" "bastion-public-terraform" {
  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.nano"
  monitoring = false
  disable_api_termination = true
  associate_public_ip_address = true
  subnet_id = module.NETWORK.public-subnet.id
  key_name = aws_key_pair.ec2-kevs-terraform.key_name

  vpc_security_group_ids = [
    module.NETWORK.public-sg.id
  ]

  tags = {
    Name = "kevs-terraform-public"
  }
}

resource "aws_instance" "kevs-jenkings-terraform" {
  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.nano"
  monitoring = false
  disable_api_termination = true
  associate_public_ip_address = true
  subnet_id = module.NETWORK.public-subnet.id
  key_name = aws_key_pair.ec2-kevs-terraform.key_name

  vpc_security_group_ids = [
    module.NETWORK.public-sg.id
  ]
  provisioner "remote-exec" {
    inline = ["sudo apt-get -qq install python -y"]
  }

  tags = {
    Name = "kevs-terraform-public"
  }
}

resource "aws_instance" "private-instance" {

  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.nano"
  monitoring = false
  disable_api_termination = true
  subnet_id = module.NETWORK.private-subnet.id
  key_name = aws_key_pair.ec2-kevs-terraform.key_name

  vpc_security_group_ids = [
    module.NETWORK.private-sg.id
  ]

  tags = {
    Name = "kevs-terraform-private"
  }


}