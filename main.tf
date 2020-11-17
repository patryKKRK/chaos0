terraform {
  backend "s3" {
    bucket  = "patrykorlikowski1"
    key     = "chaos1.tfstate"
    region  = "eu-central-1"
    profile = "chaos-playground"
  }
}
provider "aws" {
  profile = "chaos"
  region  = "eu-central-1"
}

module "networking" {
  source = "git@github.com:patryKKRK/chaos1.git?ref=1.0.0"
}
