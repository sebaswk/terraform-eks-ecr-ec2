data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Network"
    values = ["Public"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:aws:cloudformation:logical-id"
    values = ["PrivateSubnet1A", "PrivateSubnet2A", "PrivateSubnet3A"]
  }
}

data "aws_subnets" "isolated" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:tag:aws:cloudformation:logical-id"
    values = ["PrivateSubnet1B", "PrivateSubnet2B", "PrivateSubnet3B"]
  } 
}

data "aws_subnets" "public_private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:aws:cloudformation:logical-id"
    values = ["PublicSubnet1", "PublicSubnet2", "PublicSubnet3", "PrivateSubnet1A", "PrivateSubnet2A", "PrivateSubnet3A"]
  }
}

data "aws_ami" "amazon_2023" {
  most_recent = true
  owners = [ "137112412989" ]

  filter {
    name = "name"
    values = [ "al2023-ami-2023.0.20230614.0-kernel-6.1-x86_64" ]
  }
}