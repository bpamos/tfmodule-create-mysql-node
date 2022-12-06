#### Provider variables
variable "region" {
    description = "AWS region"
}

variable "aws_creds" {
    description = "Access key and Secret key for AWS [Access Keys, Secret Key]"
}

#### Important variables
variable "ssh_key_name" {
    description = "name of ssh key to be added to instance"
}

variable "ssh_key_path" {
    description = "name of ssh key to be added to instance"
}

variable "owner" {
    description = "owner tag name"
}

#### VPC
variable "base_name" {
    description = "base name for resources"
    default = "redisuser1-tf"
}

#### VPC
variable "vpc_name" {
    description = "vpc_name"
    default = ""
}

variable "subnet_azs" {
    type = list(any)
    description = "subnet availability zone"
    default = [""]
}

variable "vpc_subnets_ids" {
    type = list(any)
    description = "subnet ids zone"
    default = [""]
}

variable "vpc_security_group_ids" {
    type = list(any)
    description = "security group ids"
    default = [""]
}

variable "ena-support" {
  description = "choose AMIs that have ENA support enabled"
  default     = true
}

#### Test Instance Variables
variable "test-node-count" {
  description = "number of data nodes"
  default     = 1
}

variable "test_instance_type" {
    description = "instance type to use. Default: t3.micro"
    default = "t3.micro"
}

variable "dns_fqdn" {
  description = "dns_fqdn"
  default     = ""
}

variable "test-node-eips" {
  description = "test-node-eips"
  default     = ""
}

variable "redis-db-endpoint" {
  description = "redis-db-endpoint"
  default     = "localhost"
}

variable "redis-db-port" {
  description = "redis-db-endpoint"
  default     = 6379
}