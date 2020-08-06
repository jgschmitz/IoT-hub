# Once variables.tf, main.tf and terraform.tfvars are in place and you have inserted your correct credentials
# you can run

terraform init

the output should look like this:

jeffs-mbp-2:Terraform jeffery.schmitz$ terraform init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.mongodbatlas: version = "~> 0.6"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

#then run 

Terraform plan

the output should be like below

jeffs-mbp-2:Terraform jeffery.schmitz$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # mongodbatlas_cluster.pov-terraform will be created
  + resource "mongodbatlas_cluster" "pov-terraform" {
      + auto_scaling_compute_enabled                    = (known after apply)
      + auto_scaling_compute_scale_down_enabled         = (known after apply)
      + auto_scaling_disk_gb_enabled                    = true
      + backing_provider_name                           = (known after apply)
      + backup_enabled                                  = false
      + bi_connector                                    = (known after apply)
      + cluster_id                                      = (known after apply)
      + cluster_type                                    = (known after apply)
      + connection_strings                              = (known after apply)
      + container_id                                    = (known after apply)
      + disk_size_gb                                    = (known after apply)
      + encryption_at_rest_provider                     = (known after apply)
      + id                                              = (known after apply)
      + mongo_db_major_version                          = "4.2"
      + mongo_db_version                                = (known after apply)
      + mongo_uri                                       = (known after apply)
      + mongo_uri_updated                               = (known after apply)
      + mongo_uri_with_options                          = (known after apply)
      + name                                            = "pov-terraform"
      + num_shards                                      = 1
      + paused                                          = (known after apply)
      + pit_enabled                                     = (known after apply)
      + project_id                                      = "5f2ac7909ecb1a03261304ca"
      + provider_auto_scaling_compute_max_instance_size = (known after apply)
      + provider_auto_scaling_compute_min_instance_size = (known after apply)
      + provider_backup_enabled                         = true
      + provider_disk_iops                              = (known after apply)
      + provider_disk_type_name                         = (known after apply)
      + provider_encrypt_ebs_volume                     = (known after apply)
      + provider_instance_size_name                     = "M10"
      + provider_name                                   = "AWS"
      + provider_region_name                            = "US_EAST_1"
      + provider_volume_type                            = (known after apply)
      + replication_factor                              = 3
      + snapshot_backup_policy                          = (known after apply)
      + srv_address                                     = (known after apply)
      + state_name                                      = (known after apply)

      + advanced_configuration {
          + fail_index_key_too_long              = (known after apply)
          + javascript_enabled                   = (known after apply)
          + minimum_enabled_tls_protocol         = (known after apply)
          + no_table_scan                        = (known after apply)
          + oplog_size_mb                        = (known after apply)
          + sample_refresh_interval_bi_connector = (known after apply)
          + sample_size_bi_connector             = (known after apply)
        }

      + labels {
          + key   = (known after apply)
          + value = (known after apply)
        }

      + replication_specs {
          + id         = (known after apply)
          + num_shards = (known after apply)
          + zone_name  = (known after apply)

          + regions_config {
              + analytics_nodes = (known after apply)
              + electable_nodes = (known after apply)
              + priority        = (known after apply)
              + read_only_nodes = (known after apply)
              + region_name     = (known after apply)
            }
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.


Then run 

terraform apply  at the prompt type "yes"

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
 
mongodbatlas_cluster.pov-terraform: Creating...
 
