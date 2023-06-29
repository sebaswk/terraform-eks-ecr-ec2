module "security-group" {
  source               = "./modules/security-group"
  vpc_id               = data.aws_vpc.vpc.id
  subnet_private_cidr  = var.subnet_private_cidr
  subnet_isolated_cidr = var.subnet_isolated_cidr
}

module "asg-bastion" {
  source                = "./modules/asg-bastion"
  project_name          = var.project_name
  security_group_asg    = module.security-group.bastion_security_group_id
  subnets_asg           = data.aws_subnets.public.ids
  key_account           = var.keypair
  bastion_ami           = data.aws_ami.amazon_2023.arn
  instance_type_bastion = var.instance_type_bastion
  desired_capacity      = var.desired_capacity
}

module "eks" {
  source            = "./modules/eks"
  project_name      = var.project_name
  cluster_version   = var.cluster_version
  subnets_id        = data.aws_subnets.public_private.ids
  subnet_private_id = data.aws_subnets.private.ids
  amount_workers    = var.amount_workers
  instance_type_eks = var.instance_type_eks
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name1 = var.repository_name1
  repository_name2 = var.repository_name2
  repository_name3 = var.repository_name3
}