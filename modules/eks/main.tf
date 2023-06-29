#Cluster
resource "aws_eks_cluster" "cluster" {
  name     = "EksCluster${var.project_name}"
  version  = var.cluster_version
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = var.subnets_id
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

#Worker nodes
resource "aws_eks_node_group" "private_nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "Ec2Workers${var.project_name}"
  node_role_arn   = aws_iam_role.nodes.arn
  subnet_ids = var.subnet_private_id
  disk_size = 30
  capacity_type  = "ON_DEMAND"
  instance_types = var.instance_type_eks

  scaling_config {
    desired_size = var.amount_workers
    max_size     = var.amount_workers
    min_size     = var.amount_workers
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes_amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.nodes_amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.nodes_amazon_ec2_container_registry_read_only,
  ]
}