########## Create a Tester node for your Redis Enterprise Cluster #####
#### Modules to create the following:
#### Test node with Redis and Memtier installed
#### Test node with RIOT installed
#### Test node with Prometheus and Grafana for advanced monitoring on cluster
#### (Prometheus and Grafana require the cluster FQDN as an input)


########### Test Node Module
#### Create Test nodes
#### Ansible playbooks configure Test node with Redis and Memtier
module "tester-nodes" {
    source             = "./modules/tester-nodes"
    owner              = var.owner
    region             = var.region
    subnet_azs         = var.subnet_azs
    ssh_key_name       = var.ssh_key_name
    ssh_key_path       = var.ssh_key_path
    test_instance_type = var.test_instance_type
    test-node-count    = var.test-node-count
    ### vars updated from user RE Cluster VPC
    vpc_name           = var.vpc_name
    vpc_subnets_ids    = var.vpc_subnets_ids
    vpc_security_group_ids = var.vpc_security_group_ids

}

output "test-node-eips" {
  value = module.tester-nodes.test-node-eips
}

########## MYSQL Install
##### install MySQL on Node
module "tester-nodes-mysql" {
    source             = "./modules/tester-nodes-mysql"
    ssh_key_path       = var.ssh_key_path
    test-node-count    = var.test-node-count
    test-node-eips     = module.tester-nodes.test-node-eips
    vpc_name           = var.vpc_name
    redis-db-endpoint  = var.redis-db-endpoint
    redis-db-port      = var.redis-db-port


    depends_on = [
      module.tester-nodes
    ]
}