# awss-terraform-vpc-public-private-subnet-example

This project creates 

- VPC
- Public subnet
- Private subnet
- Internet gateway
- Nat Gateway
- Public route table
- Private route table
- Bastion in public subnet
- An EC2 instance in private subnet

Still need a couple improvements but i think it would be usefull for someone  

### Mudules


```hcl
module "NETWORK" {
  source = "./modules/networking-vpc"
}
```
