Atlas spin up configurator
#
# Configure the MongoDB Atlas Provider
#
provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}


#
# Create a Shared Tier Cluster
#
resource "mongodbatlas_cluster" "pov-terraform" {
  project_id              = var.atlasprojectid
  name                    = "pov-terraform" 
  num_shards                   = 1
  replication_factor           = 3
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.mongo_db_major_version

  //Provider settings
  provider_name               = var.atlas_provider_name
  provider_instance_size_name = var.atlas_provider_instance_size_name
  provider_region_name        = var.cluster_region
  }



# Use terraform output to display connection strings.
output "connection_strings" {
value = ["${mongodbatlas_cluster.pov-terraform.connection_strings}"]
}
jeffs-mbp-2:Terraform jeffery.schmitz$ ls
main.tf					terraform.tfstate			terraform.tfvars			variables.tf
terraform				terraform.tfstate.backup		terraform_0.12.24_darwin_amd64.zip
jeffs-mbp-2:Terraform jeffery.schmitz$ cat variables.tf
# The  public API key for MongoDB Atlas
variable "public_key" {
  description = "The public API key for MongoDB Atlas"
}
# The  public API key for MongoDB Atlas
variable "private_key" {
  description = "The private API key for MongoDB Atlas"
}

#The Atlas Project ID used to create the cluster 
variable "atlasprojectid" {
    description = "The Atlas Project ID used to create the cluster "
}

#The Atlas Project cluster region 
variable "cluster_region" {
    description = "The Atlas Project cluster region"
}


#The Atlas cloud provider_name
variable "atlas_provider_name" {
    description = "The Atlas cloud provider name"
}

# The Atlas provider instance sizz name

variable "atlas_provider_instance_size_name"{
    description = "The Atlas provider instance size name"
}

#The auto scaling option

variable "auto_scaling_disk_gb_enabled"{
    description = "auto scaling option"
}

# the version of Mongodb 
variable "mongo_db_major_version"{
    description = "the MongoDB Version"
}

variable "mongodb_atlas_database_username"{
    description = "MongoDB Atlas DB username" 
}

variable "mongodb_atlas_database_user_password"{
    description = "MongoDB Atlas DB password" 
}
