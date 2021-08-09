

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.47.0"
    }
  }

}

module "NETWORK" {
  source = "./modules/networking-vpc"
}

provider "aws" {
  profile = "default"
  region = "us-east-2"
}




