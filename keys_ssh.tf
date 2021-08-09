//Importing a public key
resource "aws_key_pair" "ec2-kevs-terraform" {

  key_name   = "your-public-ssh-key-here"
  public_key = ""
}

