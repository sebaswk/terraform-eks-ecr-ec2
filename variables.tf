#General
variable "project_name" {
  default = "XXXXXXXXXX"
}

#VPC
variable "vpc_name" {
  default = "XXXXXXXXXX"
}

#Subnets in security groups
variable "subnet_private_cidr" { #Subnet CIDRs
  type = list(string)
  default = ["XXXXXXXX/XX", "XXXXXXXX/XX", "XXXXXXXX/XX"]
}

variable "subnet_isolated_cidr" { #Subnet CIDRs
  type = list(string)
  default = ["XXXXXXXX/XX", "XXXXXXXX/XX", "XXXXXXXX/XX"]
}

variable "keypair" {
  default = "" #<---- Your need a keypair already create
}

############################################################################

#Bastion
variable "instance_type_bastion" {
  default     = "t3a.micro"
  description = "Instance type bastion"
}

variable "desired_capacity" {
  default     = "0"
  description = "Bastion desired capacity (min - max)"
}

############################################################################

#EKS
variable "cluster_version" {
  default = "1.27"
}

variable "instance_type_eks" {
  type    = list(string)
  default = ["t3a.small"]
}

variable "amount_workers" {
  default     = "2"
  description = "Asg desired capacity (min - max)"
}

############################################################################

#ECR
variable "repository_name1" {
  default = "XXXXXXXXXX"
  description = "Repository name"
}

variable "repository_name2" {
  default = "XXXXXXXXXX"
  description = "Repository name"
}

variable "repository_name3" {
  default = "XXXXXXXXXX"
  description = "Repository name"
}