module "network" {
  source = "./modules/networking"

  environment         = var.environment
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  tag_map             = var.tag_map
}

module "iam" {
  source = "./modules/iam"

  environment = var.environment
  region      = var.region
  tag_map     = var.tag_map
}

module "eks" {
  source = "./modules/eks"

  environment          = var.environment
  region               = var.region
  cluster_name         = var.cluster_name
  kubernetes_version   = var.kubernetes_version
  node_group_name      = var.node_group_name
  node_instance_type   = var.node_instance_type
  node_count           = var.node_count
  vpc_id               = module.network.vpc_id
  subnet_ids           = module.network.private_subnet_ids
  security_group_ids   = [module.network.eks_cluster_sg_id]
  eks_role_arn         = module.iam.eks_role_arn
  node_role_arn        = module.iam.eks_node_role_arn
  tag_map              = var.tag_map
}

module "ecr" {
  source = "./modules/ecr"

  environment = var.environment
  region      = var.region
  tag_map     = var.tag_map
}

module "monitoring" {
  source = "./modules/monitoring"

  environment = var.environment
  region      = var.region
  vpc_id      = module.network.vpc_id
  tag_map     = var.tag_map
}

module "database" {
  source = "./modules/database"

  environment           = var.environment
  region                = var.region
  db_username           = var.db_username
  db_allocated_storage  = var.db_allocated_storage
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.database_subnet_ids
  security_group_id     = module.network.database_sg_id
  tag_map               = var.tag_map
}
