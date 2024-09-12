# Azure Naming

This module helps you to keep consistency on your resources names for Terraform The goal of this module it is that for each resource that requires a name in Terraform you would be easily able to compose this name using this module and this will keep the consistency in your repositories.

## Goals

The main objective is to create a more logic data structure, achieved by combining and grouping related resources together in a complex object.

The structure of the module promotes reusability. It's intended to be a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.

A primary goal is to utilize keys and values in the object that correspond to the REST API's structure. This enables us to carry out iterations, increasing its practical value as time goes on.

A last key goal is to separate logic from configuration in the module, thereby enhancing its scalability, ease of customization, and manageability.


## Features

- Adapt consistent naming across all resource modules
- Retrieve a resource slug for naming purposes
- Randomise names for unique global naming like storage accounts

# Usage

For every resource in `terraform_azurerm` just remove the `azurerm` part of the module and use the `name` property of this output.

example for `azurerm_resource_group` you can use :

```tf
module "naming" {
  source  = "cloudnationhq/naming/azure"
  suffix = [ "test" ]
}
resource "azurerm_resource_group" "example" {
  name     = module.naming.resource_group.name
  location = "West Europe"
}
```

if you want this to be unique for this module and not shared with other instances of this module you can use `name_unique`

```tf
module "naming" {
  source  = "cloudnationhq/naming/azure"
  suffix = [ "test" ]
}
resource "azurerm_resource_group" "example" {
  name     = module.naming.resource_group.name_unique
  location = "West Europe"
}
```
Other advanced usages will be explained in the [Advanced usage](#advanced-usage) part of this docs.

# Internals

## Prerequisites and setup

- Install [tflint](https://github.com/terraform-linters/tflint) as suitable for your OS.

- Run `make install` in the root directory of the repo.

## Modifying resources

The resources are automatically generated using `go` to change the generation please change the file on the `templates` folder. To add a new resource, including its definition in the file `resourceDefinition.json`, and it will be automatically generated when `main.go` is run.

# Current implementation

You can find a list bellow of all the resources that are currently implemented. To get a list of the ones that are missing implementation you can check at [Missing resources](docs/missing_resources.md) the resources that have no documentation about their limitation on naming currently on Microsoft docs are on the [Not defined](docs/not_defined.md) list.


# Advanced usage


## Output

Each one of the resources emits the name of the resource and other properties:

| Property    | Type    | Description                                                                   |
| ----------- | ------- | ----------------------------------------------------------------------------- |
| name        | string  | name of the resource including respective suffixes and prefixes applied       |
| name_unique | string  | same as the name but with random chars added for uniqueness                   |
| dashes      | bool    | if these resources support dashes                                             |
| slug        | string  | letters to identify this resource among others                                |
| min_length  | integer | Minimum length required for this resource name                                |
| max_length  | integer | Maximum length allowed for this resource name                                 |
| scope       | string  | scope which this name needs to be unique, such as `resourcegroup` or `global` |
| regex       | string  | Terraform compatible version of the regex                                     |

### Example Output

Every resource will have an output with the following format:

```go
postgresql_server = {
      name        = "pre-fix-psql-su-fix"
      name_unique = "pre-fix-psql-su-fix-asdfg"
      dashes      = true
      slug        = "psql"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name                                                             | Version  |
| ---------------------------------------------------------------- | -------- |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.2 |

## Providers

| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3   |

## Modules

No modules.

## Resources

| Name                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------- | -------- |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Required |
| :-- | :-- | :-- | :-- |
| `prefix`                                             | It is not recommended that you use prefix by azure you should be using a suffix for your resources.             | list(string)  |    no    |
| `suffix`                                                | It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible | list(string) |    no    |
| `unique-include-numbers` | If you want to include numbers in the unique generation                                                         | bool        |    no    |
| `unique-length`                    | Max length of the uniqueness suffix to be added                                                                 | number         |    no    |
| `unique-seed`                                | Custom value for the random characters to be used                                                               | string        |    no    |

## Outputs

| Name                                                                                                                                                                                                     | Description                                        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `analysis_services_server`                                                                                         | Analysis Services Server                           |
| `api_management`                                                                                                                         | Api Management                                     |
| `app_configuration`                                                                                                                | App Configuration                                  |
| `app_service`                                                                                                                                  | App Service                                        |
| `app_service_environment`                                                                                            | App Service Environment                            |
| `app_service_plan`                                                                                                                 | App Service Plan                                   |
| `application_gateway`                                                                                                          | Application Gateway                                |
| `application_insights`                                                                                                       | Application Insights                               |
| `application_security_group`                                                                                   | Application Security Group                         |
| `automation_account`                                                                                                             | Automation Account                                 |
| `automation_certificate`                                                                                                 | Automation Certificate                             |
| `automation_credential`                                                                                                    | Automation Credential                              |
| `automation_runbook`                                                                                                             | Automation Runbook                                 |
| `automation_schedule`                                                                                                          | Automation Schedule                                |
| `automation_variable`                                                                                                          | Automation Variable                                |
| `availability_set`                                                                                                                   | Availability Set                                   |
| `baston_host`                                                                                                                              | Bastion Host                                       |
| `batch_account`                                                                                                                            | Batch Account                                      |
| `batch_application`                                                                                                                | Batch Application                                  |
| `batch_certificate`                                                                                                                | Batch Certificate                                  |
| `batch_pool`                                                                                                                                     | Batch Pool                                         |
| `bot_channel_directline`                                                                                               | Bot Channel Directline                             |
| `bot_channel_email`                                                                                                              | Bot Channel Email                                  |
| `bot_channel_ms_teams`                                                                                                   | Bot Channel Ms Teams                               |
| `bot_channel_slack`                                                                                                              | Bot Channel Slack                                  |
| `bot_channels_registration`                                                                                      | Bot Channels Registration                          |
| `bot_connection`                                                                                                                         | Bot Connection                                     |
| `bot_web_app`                                                                                                                                | Bot Web App                                        |
| `cdn_endpoint`                                                                                                                               | Cdn Endpoint                                       |
| `cdn_profile`                                                                                                                                  | Cdn Profile                                        |
| `cognitive_account`                                                                                                                | Cognitive Account                                  |
| `container_group`                                                                                                                      | Container Group                                    |
| `container_registry`                                                                                                             | Container Registry                                 |
| `container_registry_webhook`                                                                                   | Container Registry Webhook                         |
| `cosmosdb_account`                                                                                                                   | Cosmosdb Account                                   |
| `cosmosdb_cassandra_cluster`                                                                                   | Cosmosdb Cassandra Cluster                         |
| `cosmosdb_cassandra_datacenter`                                                                          | Cosmosdb Cassandra Datacenter                      |
| `cosmosdb_postgres`                                                                                                                | Cosmosdb Postgres                                  |
| `custom_provider`                                                                                                                      | Custom Provider                                    |
| `dashboard`                                                                                                                                          | Dashboard                                          |
| `data_factory`                                                                                                                               | Data Factory                                       |
| `data_factory_dataset_mysql`                                                                                 | Data Factory Dataset Mysql                         |
| `data_factory_dataset_postgresql`                                                                  | Data Factory Dataset Postgresql                    |
| `data_factory_dataset_sql_server_table`                                            | Data Factory Dataset Sql Server Table              |
| `data_factory_integration_runtime_managed`                                     | Data Factory Integration Runtime Managed           |
| `data_factory_linked_service_data_lake_storage_gen2` | Data Factory Linked Service Data Lake Storage Gen2 |
| `data_factory_linked_service_key_vault`                                            | Data Factory Linked Service Key Vault              |
| `data_factory_linked_service_mysql`                                                          | Data Factory Linked Service Mysql                  |
| `data_factory_linked_service_postgresql`                                           | Data Factory Linked Service Postgresql             |
| `data_factory_linked_service_sql_server`                                         | Data Factory Linked Service Sql Server             |
| `data_factory_pipeline`                                                                                                  | Data Factory Pipeline                              |
| `data_factory_trigger_schedule`                                                                        | Data Factory Trigger Schedule                      |
| `data_lake_analytics_account`                                                                              | Data Lake Analytics Account                        |
| `data_lake_analytics_firewall_rule`                                                          | Data Lake Analytics Firewall Rule                  |
| `data_lake_store`                                                                                                                    | Data Lake Store                                    |
| `data_lake_store_firewall_rule`                                                                      | Data Lake Store Firewall Rule                      |
| `database_migration_project`                                                                                   | Database Migration Project                         |
| `database_migration_service`                                                                                   | Database Migration Service                         |
| `databricks_cluster`                                                                                                             | Databricks Cluster                                 |
| `databricks_workspace`                                                                                                       | Databricks Workspace                               |
| `dev_test_lab`                                                                                                                             | Dev Test Lab                                       |
| `dev_test_linux_virtual_machine`                                                                   | Dev Test Linux Virtual Machine                     |
| `dev_test_windows_virtual_machine`                                                             | Dev Test Windows Virtual Machine                   |
| `disk_encryption_set`                                                                                                        | Disk Encryption Set                                |
| `dns_a_record`                                                                                                                             | Dns A Record                                       |
| `dns_aaaa_record`                                                                                                                    | Dns Aaaa Record                                    |
| `dns_caa_record`                                                                                                                       | Dns Caa Record                                     |
| `dns_cname_record`                                                                                                                 | Dns Cname Record                                   |
| `dns_mx_record`                                                                                                                          | Dns Mx Record                                      |
| `dns_ns_record`                                                                                                                          | Dns Ns Record                                      |
| `dns_ptr_record`                                                                                                                       | Dns Ptr Record                                     |
| `dns_txt_record`                                                                                                                       | Dns Txt Record                                     |
| `dns_zone`                                                                                                                                           | Dns Zone                                           |
| `eventgrid_domain`                                                                                                                   | Eventgrid Domain                                   |
| `eventgrid_domain_topic`                                                                                               | Eventgrid Domain Topic                             |
| `eventgrid_event_subscription`                                                                             | Eventgrid Event Subscription                       |
| `eventgrid_topic`                                                                                                                      | Eventgrid Topic                                    |
| `eventhub`                                                                                                                                             | Eventhub                                           |
| `eventhub_authorization_rule`                                                                                | Eventhub Authorization Rule                        |
| `eventhub_consumer_group`                                                                                            | Eventhub Consumer Group                            |
| `eventhub_namespace`                                                                                                             | Eventhub Namespace                                 |
| `eventhub_namespace_authorization_rule`                                                | Eventhub Namespace Authorization Rule              |
| `eventhub_namespace_disaster_recovery_config`                            | Eventhub Namespace Disaster Recovery Config        |
| `express_route_circuit`                                                                                                  | Express Route Circuit                              |
| `express_route_gateway`                                                                                                  | Express Route Gateway                              |
| `firewall`                                                                                                                                             | Firewall                                           |
| `firewall_application_rule_collection`                                                   | Firewall Application Rule Collection               |
| `firewall_ip_configuration`                                                                                      | Firewall Ip Configuration                          |
| `firewall_nat_rule_collection`                                                                           | Firewall Nat Rule Collection                       |
| `firewall_network_rule_collection`                                                               | Firewall Network Rule Collection                   |
| `firewall_policy`                                                                                                                      | Firewall Policy                                    |
| `firewall_policy_rule_collection_group`                                              | Firewall Policy Rule Collection Group              |
| `frontdoor`                                                                                                                                          | Frontdoor                                          |
| `frontdoor_firewall_policy`                                                                                      | Frontdoor Firewall Policy                          |
| `function_app`                                                                                                                               | Function App                                       |
| `hdinsight_hadoop_cluster`                                                                                         | Hdinsight Hadoop Cluster                           |
| `hdinsight_hbase_cluster`                                                                                            | Hdinsight Hbase Cluster                            |
| `hdinsight_interactive_query_cluster`                                                      | Hdinsight Interactive Query Cluster                |
| `hdinsight_kafka_cluster`                                                                                            | Hdinsight Kafka Cluster                            |
| `hdinsight_ml_services_cluster`                                                                        | Hdinsight Ml Services Cluster                      |
| `hdinsight_rserver_cluster`                                                                                      | Hdinsight Rserver Cluster                          |
| `hdinsight_spark_cluster`                                                                                            | Hdinsight Spark Cluster                            |
| `hdinsight_storm_cluster`                                                                                            | Hdinsight Storm Cluster                            |
| `image`                                                                                                                                                      | Image                                              |
| `iotcentral_application`                                                                                                 | Iotcentral Application                             |
| `iothub`                                                                                                                                                   | Iothub                                             |
| `iothub_consumer_group`                                                                                                  | Iothub Consumer Group                              |
| `iothub_dps`                                                                                                                                     | Iothub Dps                                         |
| `iothub_dps_certificate`                                                                                               | Iothub Dps Certificate                             |
| `key_vault`                                                                                                                                        | Key Vault                                          |
| `key_vault_certificate`                                                                                                  | Key Vault Certificate                              |
| `key_vault_key`                                                                                                                          | Key Vault Key                                      |
| `key_vault_secret`                                                                                                                 | Key Vault Secret                                   |
| `kubernetes_cluster`                                                                                                             | Kubernetes Cluster                                 |
| `kusto_cluster`                                                                                                                            | Kusto Cluster                                      |
| `kusto_database`                                                                                                                         | Kusto Database                                     |
| `kusto_eventhub_data_connection`                                                                     | Kusto Eventhub Data Connection                     |
| `lb`                                                                                                                                                               | Lb                                                 |
| `lb_nat_rule`                                                                                                                                | Lb Nat Rule                                        |
| `linux_virtual_machine`                                                                                                  | Linux Virtual Machine                              |
| `linux_virtual_machine_scale_set`                                                                | Linux Virtual Machine Scale Set                    |
| `local_network_gateway`                                                                                                  | Local Network Gateway                              |
| `log_analytics_workspace`                                                                                            | Log Analytics Workspace                            |
| `monitor_action_group`                                                                             | Monitor Action Group     |
| `monitor_scheduled_query_rules_alert`                                                                             | Monitor Scheduled Query Rules Alert     |
| `monitor_autoscale_setting`                                                                             | Monitor Autoscale Settting     |
| `monitor_diagnostic_setting`                                                                             | Monitor Diagnostic Setting     |            
| `logic_app_workflow`                                                                                                           | Logic App Workflow                                 |
| `machine_learning_workspace`                                                                                   | Machine Learning Workspace                         |
| `managed_disk`                                                                                                                               | Managed Disk                                       |
| `maps_account`                                                                                                                               | Maps Account                                       |
| `mariadb_database`                                                                                                                   | Mariadb Database                                   |
| `mariadb_firewall_rule`                                                                                                  | Mariadb Firewall Rule                              |
| `mariadb_server`                                                                                                                         | Mariadb Server                                     |
| `mariadb_virtual_network_rule`                                                                           | Mariadb Virtual Network Rule                       |
| `mssql_database`                                                                                                                         | Mssql Database                                     |
| `mssql_elasticpool`                                                                                                                | Mssql Elasticpool                                  |
| `mssql_server`                                                                                                                               | Mssql Server                                       |
| `mysql_database`                                                                                                                         | Mysql Database                                     |
| `mysql_firewall_rule`                                                                                                        | Mysql Firewall Rule                                |
| `mysql_server`                                                                                                                               | Mysql Server                                       |
| `mysql_virtual_network_rule`                                                                                 | Mysql Virtual Network Rule                         |
| `network_ddos_protection_plan`                                                                           | Network Ddos Protection Plan                       |
| `network_interface`                                                                                                                | Network Interface                                  |
| `network_security_group`                                                                                               | Network Security Group                             |
| `network_security_group_rule`                                                                              | Network Security Group Rule                        |
| `network_security_rule`                                                                                                  | Network Security Rule                              |
| `network_watcher`                                                                                                                      | Network Watcher                                    |
| `notification_hub`                                                                                                                   | Notification Hub                                   |
| `notification_hub_authorization_rule`                                                      | Notification Hub Authorization Rule                |
| `notification_hub_namespace`                                                                                   | Notification Hub Namespace                         |
| `point_to_site_vpn_gateway`                                                                                  | Point To Site Vpn Gateway                          |
| `postgresql_database`                                                                                                          | Postgresql Database                                |
| `postgresql_firewall_rule`                                                                                         | Postgresql Firewall Rule                           |
| `postgresql_server`                                                                                                                | Postgresql Server                                  |
| `postgresql_virtual_network_rule`                                                                  | Postgresql Virtual Network Rule                    |
| `powerbi_embedded`                                                                                                                   | Powerbi Embedded                                   |
| `private_dns_a_record`                                                                                                   | Private Dns A Record                               |
| `private_dns_aaaa_record`                                                                                          | Private Dns Aaaa Record                            |
| `private_dns_cname_record`                                                                                       | Private Dns Cname Record                           |
| `private_dns_mx_record`                                                                                                | Private Dns Mx Record                              |
| `private_dns_ptr_record`                                                                                             | Private Dns Ptr Record                             |
| `private_dns_srv_record`                                                                                             | Private Dns Srv Record                             |
| `private_dns_txt_record`                                                                                             | Private Dns Txt Record                             |
| `private_dns_zone`                                                                                                                 | Private Dns Zone                                   |
| `private_dns_zone_group`                                                                                             | Private Dns Zone Group                             |
| `private_endpoint`                                                                                                                   | Private Endpoint                                   |
| `private_link_service`                                                                                                     | Private Link Service                               |
| `private_service_connection`                                                                                   | Private Service Connection                         |
| `proximity_placement_group`                                                                                      | Proximity Placement Group                          |
| `public_ip`                                                                                                                                        | Public Ip                                          |
| `public_ip_prefix`                                                                                                                 | Public Ip Prefix                                   |
| `recovery_services_vault`                                                                                            | Recovery Services Vault                            |
| `redis_cache`                                                                                                                                  | Redis Cache                                        |
| `redis_firewall_rule`                                                                                                        | Redis Firewall Rule                                |
| `relay_hybrid_connection`                                                                                            | Relay Hybrid Connection                            |
| `relay_namespace`                                                                                                                      | Relay Namespace                                    |
| `resource_group`                                                                                                                         | Resource Group                                     |
| `role_assignment`                                                                                                                      | Role Assignment                                    |
| `role_definition`                                                                                                                      | Role Definition                                    |
| `route`                                                                                                                                                      | Route                                              |
| `route_table`                                                                                                                                  | Route Table                                        |
| `search_service`                                                                                                                         | Search Service                                     |
| `service_fabric_cluster`                                                                                               | Service Fabric Cluster                             |
| `servicebus_namespace`                                                                                                       | Servicebus Namespace                               |
| `servicebus_namespace_authorization_rule`                                          | Servicebus Namespace Authorization Rule            |
| `servicebus_queue`                                                                                                                   | Servicebus Queue                                   |
| `servicebus_queue_authorization_rule`                                                      | Servicebus Queue Authorization Rule                |
| `servicebus_subscription`                                                                                              | Servicebus Subscription                            |
| `servicebus_subscription_rule`                                                                             | Servicebus Subscription Rule                       |
| `servicebus_topic`                                                                                                                   | Servicebus Topic                                   |
| `servicebus_topic_authorization_rule`                                                      | Servicebus Topic Authorization Rule                |
| `shared_image`                                                                                                                               | Shared Image                                       |
| `shared_image_gallery`                                                                                                     | Shared Image Gallery                               |
| `signalr_service`                                                                                                                      | Signalr Service                                    |
| `snapshots`                                                                                                                                          | Snapshots                                          |
| `sql_elasticpool`                                                                                                                      | Sql Elasticpool                                    |
| `sql_failover_group`                                                                                                           | Sql Failover Group                                 |
| `sql_firewall_rule`                                                                                                              | Sql Firewall Rule                                  |
| `sql_server`                                                                                                                                     | Sql Server                                         |
| `storage_account`                                                                                                                      | Storage Account                                    |
| `storage_blob`                                                                                                                               | Storage Blob                                       |
| `storage_container`                                                                                                                | Storage Container                                  |
| `storage_data_lake_gen2_filesystem`                                                          | Storage Data Lake Gen2 Filesystem                  |
| `storage_queue`                                                                                                                            | Storage Queue                                      |
| `storage_share`                                                                                                                            | Storage Share                                      |
| `storage_share_directory`                                                                                            | Storage Share Directory                            |
| `storage_table`                                                                                                                            | Storage Table                                      |
| `stream_analytics_function_javascript_udf`                                     | Stream Analytics Function Javascript Udf           |
| `stream_analytics_job`                                                                                                     | Stream Analytics Job                               |
| `stream_analytics_output_blob`                                                                           | Stream Analytics Output Blob                       |
| `stream_analytics_output_eventhub`                                                               | Stream Analytics Output Eventhub                   |
| `stream_analytics_output_mssql`                                                                        | Stream Analytics Output Mssql                      |
| `stream_analytics_output_servicebus_queue`                                     | Stream Analytics Output Servicebus Queue           |
| `stream_analytics_output_servicebus_topic`                                     | Stream Analytics Output Servicebus Topic           |
| `stream_analytics_reference_input_blob`                                              | Stream Analytics Reference Input Blob              |
| `stream_analytics_stream_input_blob`                                                       | Stream Analytics Stream Input Blob                 |
| `stream_analytics_stream_input_eventhub`                                           | Stream Analytics Stream Input Eventhub             |
| `stream_analytics_stream_input_iothub`                                                 | Stream Analytics Stream Input Iothub               |
| `subnet`                                                                                                                                                   | Subnet                                             |
| `template_deployment`                                                                                                          | Template Deployment                                |
| `traffic_manager_profile`                                                                                            | Traffic Manager Profile                            |
| `unique-seed`                                                                                                                                    | n/a                                                |
| `user_assigned_identity`                                                                                               | User Assigned Identity                             |
| `validation`                                                                                                                                       | n/a                                                |
| `virtual_machine`                                                                                                                      | Virtual Machine                                    |
| `virtual_machine_extension`                                                                                      | Virtual Machine Extension                          |
| `virtual_machine_scale_set`                                                                                    | Virtual Machine Scale Set                          |
| `virtual_machine_scale_set_extension`                                                    | Virtual Machine Scale Set Extension                |
| `virtual_network`                                                                                                                      | Virtual Network                                    |
| `virtual_network_gateway`                                                                                            | Virtual Network Gateway                            |
| `virtual_network_gateway_connection`                                                         | Virtual Network Gateway Connection                 |
| `virtual_network_peering`                                                                                            | Virtual Network Peering                            |
| `virtual_wan`                                                                                                                                  | Virtual Wan                                        |
| `windows_virtual_machine`                                                                                            | Windows Virtual Machine                            |
| `windows_virtual_machine_scale_set`                                                          | Windows Virtual Machine Scale Set                  |
| `aadb2c_directory`                                                                                                 | AADB2C Directory                                   |
| `aks_node_pool_linux`                                                                                               | AKS Node Pool Linux                                |
| `aks_node_pool_windows`                                                                                             | AKS Node Pool Windows                              |
| `automation_job_schedule`                                                                                           | Automation Job Schedule                            |
| `container_app`                                                                                                     | Container App                                      |
| `container_app_environment`                                                                                        | Container App Environment                         |
| `container_app_job`                                                                                                 | Container App Job                                  |
| `data_collection_endpoint`                                                                                          | Data Collection Endpoint                          |
| `data_collection_rule`                                                                                              | Data Collection Rule                              |
| `databricks_cluster_policy`                                                                                         | Databricks Cluster Policy                          |
| `databricks_instance_pool`                                                                                          | Databricks Instance Pool                           |
| `ip_group`                                                                                                          | IP Group                                           |
| `mysql_flexible_server`                                                                                             | MySQL Flexible Server                              |
| `mysql_flexible_server_database`                                                                                    | MySQL Flexible Server Database                    |
| `mysql_flexible_server_firewall_rule`                                                                               | MySQL Flexible Server Firewall Rule               |
| `network_watcher_flow_log`                                                                                          | Network Watcher Flow Log                           |
| `postgresql_flexible_server`                                                                                        | PostgreSQL Flexible Server                        |
| `postgresql_flexible_server_database`                                                                               | PostgreSQL Flexible Server Database               |
| `postgresql_flexible_server_firewall_rule`                                                                          | PostgreSQL Flexible Server Firewall Rule          |
| `private_dns_resolver`                                                                                              | Private DNS Resolver                               |
| `private_dns_resolver_dns_forwarding_ruleset`                                                                       | Private DNS Resolver DNS Forwarding Ruleset       |
| `private_dns_resolver_forwarding_rule`                                                                              | Private DNS Resolver Forwarding Rule              |
| `private_dns_resolver_inbound_endpoint`                                                                             | Private DNS Resolver Inbound Endpoint             |
| `private_dns_resolver_outbound_endpoint`                                                                            | Private DNS Resolver Outbound Endpoint            |
| `private_dns_resolver_virtual_network_link`                                                                         | Private DNS Resolver Virtual Network Link         |
| `recovery_services_vault_backup_policy`                                                                             | Recovery Services Vault Backup Policy             |
| `synapse_firewall_rule`                                                                                             | Synapse Firewall Rule                             |
| `synapse_integration_runtime_azure`                                                                                 | Synapse Integration Runtime (Azure)               |
| `synapse_integration_runtime_self_hosted`                                                                           | Synapse Integration Runtime (Self-Hosted)         |
| `synapse_linked_service`                                                                                            | Synapse Linked Service                            |
| `synapse_managed_private_endpoint`                                                                                  | Synapse Managed Private Endpoint                  |
| `synapse_private_link_hub`                                                                                          | Synapse Private Link Hub                          |
| `synapse_spark_pool`                                                                                                | Synapse Spark Pool                                |
| `synapse_sql_pool`                                                                                                  | Synapse SQL Pool                                  |
| `synapse_workspace`                                                                                                 | Synapse Workspace                                 |
| `virtual_hub`                                                                                                       | Virtual Hub                                       |
| `virtual_hub_connection`                                                                                           | Virtual Hub Connection                            |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing

As a prerequirement, please ensure that both go and terraform are properly installed on your system.

The [Makefile](Makefile) includes two distinct variations of tests. The first one is designed to deploy different usage scenarios of the module. These tests are executed by specifying the TF_PATH environment variable, which determines the different usages located in the example directory.

To execute this test, input the command ```make test TF_PATH=default```, substituting default with the specific usage you wish to test.

The second variation is known as a extended test. This one performs additional checks and can be executed without specifying any parameters, using the command ```make test_extended```.

Both are designed to be executed locally and are also integrated into the github workflow.

Each of these tests contributes to the robustness and resilience of the module. They ensure the module performs consistently and accurately under different scenarios and configurations.

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-databricks-clp/graphs/contributors).

## Contributing

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md).

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.