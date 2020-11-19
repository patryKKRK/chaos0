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

module "ec2" {
  source              = "git@github.com:patryKKRK/chaos2.git?ref=1.0.0"
  public_subnet_range = [module.networking.public_output_1, module.networking.public_output_2]
  vpc_id              = module.networking.vpc_id
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj6ffQj/DzNKjf4yQ0jbHYns6/bk+DfmgkOLxeWo+neNZZdM6F8AaPO3iK+i1bnG1bryHcZiZ/hD9n+qKtcPVFiltC1xew5b1rWLuuMIutQqhVe99+RAUIy994YuTi7TUdzL4I0J1nqX/PYesVMoibTY0ozBX4MdENo+IXCUWF5accL+dlJTf9sIepXLTl8uKojNQ7nDAk5wZoyOzVJalybSnckyRipi4hkschRtf9B4TZbVDT4ZDhCSFEFWEzoVDXnwEn+TMWA3Y4jSbwsqt8TKA9DmMCKZav5L0aP32odseur16kKIaD5IYlxHurC9gmft4JlKpncCwFe0SCxcMdIH46GnhYhKomIO9gFZNjPmDQlv+LsLAZdAToS2Lt82C1b0ApSKvXeI5+LNjyYxhXeYwEJrLIFZPS3ui2r8L2qkGybTeUFlbRnWzDuzxMTO7aivgc1vRQwljA2KhKo+ITUJkrQnslVPjlKPZB3diaPfc5NuOVbWZocPQ6C3PL0Fs= adminp@Lin"
}
