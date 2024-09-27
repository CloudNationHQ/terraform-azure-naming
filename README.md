# Azure Naming

This terraform module streamlines Azure resource naming, using regular expressions to ensure consistency and flexibility with customizable prefixes and suffixes. This facilitates structured and uniform naming across deployments.

## Goals

The main objective is to create a more logic data structure, achieved by combining and grouping related resources together in a complex object.

The structure of the module promotes reusability. It's intended to be a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.

A primary goal is to utilize keys and values in the object that correspond to the REST API's structure. This enables us to carry out iterations, increasing its practical value as time goes on.

A last key goal is to separate logic from configuration in the module, thereby enhancing its scalability, ease of customization, and manageability.

## Non-Goals

These modules are not intended to be complete, ready-to-use solutions; they are designed as components for creating your own patterns.

They are not tailored for a single use case but are meant to be versatile and applicable to a range of scenarios.

Security standardization is applied at the pattern level, while the modules include default values based on best practices but do not enforce specific security standards.

End-to-end testing is not conducted on these modules, as they are individual components and do not undergo the extensive testing reserved for complete patterns or solutions.

## Features

- ensures consistent naming across all resources.
- generates resource slugs for standardized naming.
- optionally randomizes names for globally unique identifiers.
- validates names using regular expressions for compliance.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | It is not recommended that you use prefix by azure you should be using a suffix for your resources. | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible | `list(string)` | `[]` | no |
| <a name="input_unique-include-numbers"></a> [unique-include-numbers](#input\_unique-include-numbers) | If you want to include numbers in the unique generation | `bool` | `true` | no |
| <a name="input_unique-length"></a> [unique-length](#input\_unique-length) | Max length of the uniqueness suffix to be added | `number` | `4` | no |
| <a name="input_unique-seed"></a> [unique-seed](#input\_unique-seed) | Custom value for the random characters to be used | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aadb2c_directory"></a> [aadb2c\_directory](#output\_aadb2c\_directory) | Aadb2c Directory |
| <a name="output_aks_node_pool_linux"></a> [aks\_node\_pool\_linux](#output\_aks\_node\_pool\_linux) | Aks Node Pool Linux |
| <a name="output_aks_node_pool_windows"></a> [aks\_node\_pool\_windows](#output\_aks\_node\_pool\_windows) | Aks Node Pool Windows |
| <a name="output_analysis_services_server"></a> [analysis\_services\_server](#output\_analysis\_services\_server) | Analysis Services Server |
| <a name="output_api_management"></a> [api\_management](#output\_api\_management) | Api Management |
| <a name="output_api_management_api"></a> [api\_management\_api](#output\_api\_management\_api) | Api Management Api |
| <a name="output_api_management_api_operation_tag"></a> [api\_management\_api\_operation\_tag](#output\_api\_management\_api\_operation\_tag) | Api Management Api Operation Tag |
| <a name="output_api_management_backend"></a> [api\_management\_backend](#output\_api\_management\_backend) | Api Management Backend |
| <a name="output_api_management_certificate"></a> [api\_management\_certificate](#output\_api\_management\_certificate) | Api Management Certificate |
| <a name="output_api_management_gateway"></a> [api\_management\_gateway](#output\_api\_management\_gateway) | Api Management Gateway |
| <a name="output_api_management_group"></a> [api\_management\_group](#output\_api\_management\_group) | Api Management Group |
| <a name="output_api_management_logger"></a> [api\_management\_logger](#output\_api\_management\_logger) | Api Management Logger |
| <a name="output_app_configuration"></a> [app\_configuration](#output\_app\_configuration) | App Configuration |
| <a name="output_app_service"></a> [app\_service](#output\_app\_service) | App Service |
| <a name="output_app_service_environment"></a> [app\_service\_environment](#output\_app\_service\_environment) | App Service Environment |
| <a name="output_app_service_plan"></a> [app\_service\_plan](#output\_app\_service\_plan) | App Service Plan |
| <a name="output_application_gateway"></a> [application\_gateway](#output\_application\_gateway) | Application Gateway |
| <a name="output_application_insights"></a> [application\_insights](#output\_application\_insights) | Application Insights |
| <a name="output_application_insights_web_test"></a> [application\_insights\_web\_test](#output\_application\_insights\_web\_test) | Application Insights Web Test |
| <a name="output_application_security_group"></a> [application\_security\_group](#output\_application\_security\_group) | Application Security Group |
| <a name="output_automation_account"></a> [automation\_account](#output\_automation\_account) | Automation Account |
| <a name="output_automation_certificate"></a> [automation\_certificate](#output\_automation\_certificate) | Automation Certificate |
| <a name="output_automation_credential"></a> [automation\_credential](#output\_automation\_credential) | Automation Credential |
| <a name="output_automation_job_schedule"></a> [automation\_job\_schedule](#output\_automation\_job\_schedule) | Automation Job Schedule |
| <a name="output_automation_runbook"></a> [automation\_runbook](#output\_automation\_runbook) | Automation Runbook |
| <a name="output_automation_schedule"></a> [automation\_schedule](#output\_automation\_schedule) | Automation Schedule |
| <a name="output_automation_variable"></a> [automation\_variable](#output\_automation\_variable) | Automation Variable |
| <a name="output_availability_set"></a> [availability\_set](#output\_availability\_set) | Availability Set |
| <a name="output_bastion_host"></a> [bastion\_host](#output\_bastion\_host) | Bastion Host |
| <a name="output_batch_account"></a> [batch\_account](#output\_batch\_account) | Batch Account |
| <a name="output_batch_application"></a> [batch\_application](#output\_batch\_application) | Batch Application |
| <a name="output_batch_certificate"></a> [batch\_certificate](#output\_batch\_certificate) | Batch Certificate |
| <a name="output_batch_pool"></a> [batch\_pool](#output\_batch\_pool) | Batch Pool |
| <a name="output_bot_channel_directline"></a> [bot\_channel\_directline](#output\_bot\_channel\_directline) | Bot Channel Directline |
| <a name="output_bot_channel_email"></a> [bot\_channel\_email](#output\_bot\_channel\_email) | Bot Channel Email |
| <a name="output_bot_channel_ms_teams"></a> [bot\_channel\_ms\_teams](#output\_bot\_channel\_ms\_teams) | Bot Channel Ms Teams |
| <a name="output_bot_channel_slack"></a> [bot\_channel\_slack](#output\_bot\_channel\_slack) | Bot Channel Slack |
| <a name="output_bot_channels_registration"></a> [bot\_channels\_registration](#output\_bot\_channels\_registration) | Bot Channels Registration |
| <a name="output_bot_connection"></a> [bot\_connection](#output\_bot\_connection) | Bot Connection |
| <a name="output_bot_web_app"></a> [bot\_web\_app](#output\_bot\_web\_app) | Bot Web App |
| <a name="output_cdn_endpoint"></a> [cdn\_endpoint](#output\_cdn\_endpoint) | Cdn Endpoint |
| <a name="output_cdn_profile"></a> [cdn\_profile](#output\_cdn\_profile) | Cdn Profile |
| <a name="output_cognitive_account"></a> [cognitive\_account](#output\_cognitive\_account) | Cognitive Account |
| <a name="output_cognitive_deployment"></a> [cognitive\_deployment](#output\_cognitive\_deployment) | Cognitive Deployment |
| <a name="output_communication_service"></a> [communication\_service](#output\_communication\_service) | Communication Service |
| <a name="output_consumption_budget_resource_group"></a> [consumption\_budget\_resource\_group](#output\_consumption\_budget\_resource\_group) | Consumption Budget Resource Group |
| <a name="output_consumption_budget_subscription"></a> [consumption\_budget\_subscription](#output\_consumption\_budget\_subscription) | Consumption Budget Subscription |
| <a name="output_containerGroups"></a> [containerGroups](#output\_containerGroups) | Containergroups |
| <a name="output_container_app"></a> [container\_app](#output\_container\_app) | Container App |
| <a name="output_container_app_environment"></a> [container\_app\_environment](#output\_container\_app\_environment) | Container App Environment |
| <a name="output_container_app_job"></a> [container\_app\_job](#output\_container\_app\_job) | Container App Job |
| <a name="output_container_group"></a> [container\_group](#output\_container\_group) | Container Group |
| <a name="output_container_registry"></a> [container\_registry](#output\_container\_registry) | Container Registry |
| <a name="output_container_registry_webhook"></a> [container\_registry\_webhook](#output\_container\_registry\_webhook) | Container Registry Webhook |
| <a name="output_cosmosdb_account"></a> [cosmosdb\_account](#output\_cosmosdb\_account) | Cosmosdb Account |
| <a name="output_cosmosdb_cassandra_cluster"></a> [cosmosdb\_cassandra\_cluster](#output\_cosmosdb\_cassandra\_cluster) | Cosmosdb Cassandra Cluster |
| <a name="output_cosmosdb_cassandra_datacenter"></a> [cosmosdb\_cassandra\_datacenter](#output\_cosmosdb\_cassandra\_datacenter) | Cosmosdb Cassandra Datacenter |
| <a name="output_cosmosdb_postgres"></a> [cosmosdb\_postgres](#output\_cosmosdb\_postgres) | Cosmosdb Postgres |
| <a name="output_custom_provider"></a> [custom\_provider](#output\_custom\_provider) | Custom Provider |
| <a name="output_dashboard"></a> [dashboard](#output\_dashboard) | Dashboard |
| <a name="output_data_collection_endpoint"></a> [data\_collection\_endpoint](#output\_data\_collection\_endpoint) | Data Collection Endpoint |
| <a name="output_data_collection_rule"></a> [data\_collection\_rule](#output\_data\_collection\_rule) | Data Collection Rule |
| <a name="output_data_factory"></a> [data\_factory](#output\_data\_factory) | Data Factory |
| <a name="output_data_factory_dataset_mysql"></a> [data\_factory\_dataset\_mysql](#output\_data\_factory\_dataset\_mysql) | Data Factory Dataset Mysql |
| <a name="output_data_factory_dataset_postgresql"></a> [data\_factory\_dataset\_postgresql](#output\_data\_factory\_dataset\_postgresql) | Data Factory Dataset Postgresql |
| <a name="output_data_factory_dataset_sql_server_table"></a> [data\_factory\_dataset\_sql\_server\_table](#output\_data\_factory\_dataset\_sql\_server\_table) | Data Factory Dataset Sql Server Table |
| <a name="output_data_factory_integration_runtime_managed"></a> [data\_factory\_integration\_runtime\_managed](#output\_data\_factory\_integration\_runtime\_managed) | Data Factory Integration Runtime Managed |
| <a name="output_data_factory_linked_service_data_lake_storage_gen2"></a> [data\_factory\_linked\_service\_data\_lake\_storage\_gen2](#output\_data\_factory\_linked\_service\_data\_lake\_storage\_gen2) | Data Factory Linked Service Data Lake Storage Gen2 |
| <a name="output_data_factory_linked_service_key_vault"></a> [data\_factory\_linked\_service\_key\_vault](#output\_data\_factory\_linked\_service\_key\_vault) | Data Factory Linked Service Key Vault |
| <a name="output_data_factory_linked_service_mysql"></a> [data\_factory\_linked\_service\_mysql](#output\_data\_factory\_linked\_service\_mysql) | Data Factory Linked Service Mysql |
| <a name="output_data_factory_linked_service_postgresql"></a> [data\_factory\_linked\_service\_postgresql](#output\_data\_factory\_linked\_service\_postgresql) | Data Factory Linked Service Postgresql |
| <a name="output_data_factory_linked_service_sql_server"></a> [data\_factory\_linked\_service\_sql\_server](#output\_data\_factory\_linked\_service\_sql\_server) | Data Factory Linked Service Sql Server |
| <a name="output_data_factory_pipeline"></a> [data\_factory\_pipeline](#output\_data\_factory\_pipeline) | Data Factory Pipeline |
| <a name="output_data_factory_trigger_schedule"></a> [data\_factory\_trigger\_schedule](#output\_data\_factory\_trigger\_schedule) | Data Factory Trigger Schedule |
| <a name="output_data_lake_analytics_account"></a> [data\_lake\_analytics\_account](#output\_data\_lake\_analytics\_account) | Data Lake Analytics Account |
| <a name="output_data_lake_analytics_firewall_rule"></a> [data\_lake\_analytics\_firewall\_rule](#output\_data\_lake\_analytics\_firewall\_rule) | Data Lake Analytics Firewall Rule |
| <a name="output_data_lake_store"></a> [data\_lake\_store](#output\_data\_lake\_store) | Data Lake Store |
| <a name="output_data_lake_store_firewall_rule"></a> [data\_lake\_store\_firewall\_rule](#output\_data\_lake\_store\_firewall\_rule) | Data Lake Store Firewall Rule |
| <a name="output_database_migration_project"></a> [database\_migration\_project](#output\_database\_migration\_project) | Database Migration Project |
| <a name="output_database_migration_service"></a> [database\_migration\_service](#output\_database\_migration\_service) | Database Migration Service |
| <a name="output_databricks_cluster"></a> [databricks\_cluster](#output\_databricks\_cluster) | Databricks Cluster |
| <a name="output_databricks_high_concurrency_cluster"></a> [databricks\_high\_concurrency\_cluster](#output\_databricks\_high\_concurrency\_cluster) | Databricks High Concurrency Cluster |
| <a name="output_databricks_standard_cluster"></a> [databricks\_standard\_cluster](#output\_databricks\_standard\_cluster) | Databricks Standard Cluster |
| <a name="output_databricks_workspace"></a> [databricks\_workspace](#output\_databricks\_workspace) | Databricks Workspace |
| <a name="output_dev_test_lab"></a> [dev\_test\_lab](#output\_dev\_test\_lab) | Dev Test Lab |
| <a name="output_dev_test_linux_virtual_machine"></a> [dev\_test\_linux\_virtual\_machine](#output\_dev\_test\_linux\_virtual\_machine) | Dev Test Linux Virtual Machine |
| <a name="output_dev_test_windows_virtual_machine"></a> [dev\_test\_windows\_virtual\_machine](#output\_dev\_test\_windows\_virtual\_machine) | Dev Test Windows Virtual Machine |
| <a name="output_digital_twins_endpoint_eventgrid"></a> [digital\_twins\_endpoint\_eventgrid](#output\_digital\_twins\_endpoint\_eventgrid) | Digital Twins Endpoint Eventgrid |
| <a name="output_digital_twins_endpoint_eventhub"></a> [digital\_twins\_endpoint\_eventhub](#output\_digital\_twins\_endpoint\_eventhub) | Digital Twins Endpoint Eventhub |
| <a name="output_digital_twins_endpoint_servicebus"></a> [digital\_twins\_endpoint\_servicebus](#output\_digital\_twins\_endpoint\_servicebus) | Digital Twins Endpoint Servicebus |
| <a name="output_digital_twins_instance"></a> [digital\_twins\_instance](#output\_digital\_twins\_instance) | Digital Twins Instance |
| <a name="output_disk_encryption_set"></a> [disk\_encryption\_set](#output\_disk\_encryption\_set) | Disk Encryption Set |
| <a name="output_dns_a_record"></a> [dns\_a\_record](#output\_dns\_a\_record) | Dns A Record |
| <a name="output_dns_aaaa_record"></a> [dns\_aaaa\_record](#output\_dns\_aaaa\_record) | Dns Aaaa Record |
| <a name="output_dns_caa_record"></a> [dns\_caa\_record](#output\_dns\_caa\_record) | Dns Caa Record |
| <a name="output_dns_cname_record"></a> [dns\_cname\_record](#output\_dns\_cname\_record) | Dns Cname Record |
| <a name="output_dns_mx_record"></a> [dns\_mx\_record](#output\_dns\_mx\_record) | Dns Mx Record |
| <a name="output_dns_ns_record"></a> [dns\_ns\_record](#output\_dns\_ns\_record) | Dns Ns Record |
| <a name="output_dns_ptr_record"></a> [dns\_ptr\_record](#output\_dns\_ptr\_record) | Dns Ptr Record |
| <a name="output_dns_txt_record"></a> [dns\_txt\_record](#output\_dns\_txt\_record) | Dns Txt Record |
| <a name="output_dns_zone"></a> [dns\_zone](#output\_dns\_zone) | Dns Zone |
| <a name="output_eventgrid_domain"></a> [eventgrid\_domain](#output\_eventgrid\_domain) | Eventgrid Domain |
| <a name="output_eventgrid_domain_topic"></a> [eventgrid\_domain\_topic](#output\_eventgrid\_domain\_topic) | Eventgrid Domain Topic |
| <a name="output_eventgrid_event_subscription"></a> [eventgrid\_event\_subscription](#output\_eventgrid\_event\_subscription) | Eventgrid Event Subscription |
| <a name="output_eventgrid_topic"></a> [eventgrid\_topic](#output\_eventgrid\_topic) | Eventgrid Topic |
| <a name="output_eventhub"></a> [eventhub](#output\_eventhub) | Eventhub |
| <a name="output_eventhub_authorization_rule"></a> [eventhub\_authorization\_rule](#output\_eventhub\_authorization\_rule) | Eventhub Authorization Rule |
| <a name="output_eventhub_consumer_group"></a> [eventhub\_consumer\_group](#output\_eventhub\_consumer\_group) | Eventhub Consumer Group |
| <a name="output_eventhub_namespace"></a> [eventhub\_namespace](#output\_eventhub\_namespace) | Eventhub Namespace |
| <a name="output_eventhub_namespace_authorization_rule"></a> [eventhub\_namespace\_authorization\_rule](#output\_eventhub\_namespace\_authorization\_rule) | Eventhub Namespace Authorization Rule |
| <a name="output_eventhub_namespace_disaster_recovery_config"></a> [eventhub\_namespace\_disaster\_recovery\_config](#output\_eventhub\_namespace\_disaster\_recovery\_config) | Eventhub Namespace Disaster Recovery Config |
| <a name="output_express_route_circuit"></a> [express\_route\_circuit](#output\_express\_route\_circuit) | Express Route Circuit |
| <a name="output_express_route_gateway"></a> [express\_route\_gateway](#output\_express\_route\_gateway) | Express Route Gateway |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | Firewall |
| <a name="output_firewall_application_rule_collection"></a> [firewall\_application\_rule\_collection](#output\_firewall\_application\_rule\_collection) | Firewall Application Rule Collection |
| <a name="output_firewall_ip_configuration"></a> [firewall\_ip\_configuration](#output\_firewall\_ip\_configuration) | Firewall Ip Configuration |
| <a name="output_firewall_nat_rule_collection"></a> [firewall\_nat\_rule\_collection](#output\_firewall\_nat\_rule\_collection) | Firewall Nat Rule Collection |
| <a name="output_firewall_network_rule_collection"></a> [firewall\_network\_rule\_collection](#output\_firewall\_network\_rule\_collection) | Firewall Network Rule Collection |
| <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy) | Firewall Policy |
| <a name="output_firewall_policy_rule_collection_group"></a> [firewall\_policy\_rule\_collection\_group](#output\_firewall\_policy\_rule\_collection\_group) | Firewall Policy Rule Collection Group |
| <a name="output_frontdoor"></a> [frontdoor](#output\_frontdoor) | Frontdoor |
| <a name="output_frontdoor_firewall_policy"></a> [frontdoor\_firewall\_policy](#output\_frontdoor\_firewall\_policy) | Frontdoor Firewall Policy |
| <a name="output_function_app"></a> [function\_app](#output\_function\_app) | Function App |
| <a name="output_function_app_slot"></a> [function\_app\_slot](#output\_function\_app\_slot) | Function App Slot |
| <a name="output_hdinsight_hadoop_cluster"></a> [hdinsight\_hadoop\_cluster](#output\_hdinsight\_hadoop\_cluster) | Hdinsight Hadoop Cluster |
| <a name="output_hdinsight_hbase_cluster"></a> [hdinsight\_hbase\_cluster](#output\_hdinsight\_hbase\_cluster) | Hdinsight Hbase Cluster |
| <a name="output_hdinsight_interactive_query_cluster"></a> [hdinsight\_interactive\_query\_cluster](#output\_hdinsight\_interactive\_query\_cluster) | Hdinsight Interactive Query Cluster |
| <a name="output_hdinsight_kafka_cluster"></a> [hdinsight\_kafka\_cluster](#output\_hdinsight\_kafka\_cluster) | Hdinsight Kafka Cluster |
| <a name="output_hdinsight_ml_services_cluster"></a> [hdinsight\_ml\_services\_cluster](#output\_hdinsight\_ml\_services\_cluster) | Hdinsight Ml Services Cluster |
| <a name="output_hdinsight_rserver_cluster"></a> [hdinsight\_rserver\_cluster](#output\_hdinsight\_rserver\_cluster) | Hdinsight Rserver Cluster |
| <a name="output_hdinsight_spark_cluster"></a> [hdinsight\_spark\_cluster](#output\_hdinsight\_spark\_cluster) | Hdinsight Spark Cluster |
| <a name="output_hdinsight_storm_cluster"></a> [hdinsight\_storm\_cluster](#output\_hdinsight\_storm\_cluster) | Hdinsight Storm Cluster |
| <a name="output_healthcare_dicom_service"></a> [healthcare\_dicom\_service](#output\_healthcare\_dicom\_service) | Healthcare Dicom Service |
| <a name="output_healthcare_fhir_service"></a> [healthcare\_fhir\_service](#output\_healthcare\_fhir\_service) | Healthcare Fhir Service |
| <a name="output_healthcare_medtech_service"></a> [healthcare\_medtech\_service](#output\_healthcare\_medtech\_service) | Healthcare Medtech Service |
| <a name="output_healthcare_service"></a> [healthcare\_service](#output\_healthcare\_service) | Healthcare Service |
| <a name="output_healthcare_workspace"></a> [healthcare\_workspace](#output\_healthcare\_workspace) | Healthcare Workspace |
| <a name="output_image"></a> [image](#output\_image) | Image |
| <a name="output_integration_service_environment"></a> [integration\_service\_environment](#output\_integration\_service\_environment) | Integration Service Environment |
| <a name="output_iot_security_device_group"></a> [iot\_security\_device\_group](#output\_iot\_security\_device\_group) | Iot Security Device Group |
| <a name="output_iot_security_solution"></a> [iot\_security\_solution](#output\_iot\_security\_solution) | Iot Security Solution |
| <a name="output_iotcentral_application"></a> [iotcentral\_application](#output\_iotcentral\_application) | Iotcentral Application |
| <a name="output_iothub"></a> [iothub](#output\_iothub) | Iothub |
| <a name="output_iothub_consumer_group"></a> [iothub\_consumer\_group](#output\_iothub\_consumer\_group) | Iothub Consumer Group |
| <a name="output_iothub_dps"></a> [iothub\_dps](#output\_iothub\_dps) | Iothub Dps |
| <a name="output_iothub_dps_certificate"></a> [iothub\_dps\_certificate](#output\_iothub\_dps\_certificate) | Iothub Dps Certificate |
| <a name="output_ip_group"></a> [ip\_group](#output\_ip\_group) | Ip Group |
| <a name="output_key_vault"></a> [key\_vault](#output\_key\_vault) | Key Vault |
| <a name="output_key_vault_certificate"></a> [key\_vault\_certificate](#output\_key\_vault\_certificate) | Key Vault Certificate |
| <a name="output_key_vault_key"></a> [key\_vault\_key](#output\_key\_vault\_key) | Key Vault Key |
| <a name="output_key_vault_secret"></a> [key\_vault\_secret](#output\_key\_vault\_secret) | Key Vault Secret |
| <a name="output_kubernetes_cluster"></a> [kubernetes\_cluster](#output\_kubernetes\_cluster) | Kubernetes Cluster |
| <a name="output_kubernetes_fleet_manager"></a> [kubernetes\_fleet\_manager](#output\_kubernetes\_fleet\_manager) | Kubernetes Fleet Manager |
| <a name="output_kusto_cluster"></a> [kusto\_cluster](#output\_kusto\_cluster) | Kusto Cluster |
| <a name="output_kusto_database"></a> [kusto\_database](#output\_kusto\_database) | Kusto Database |
| <a name="output_kusto_eventhub_data_connection"></a> [kusto\_eventhub\_data\_connection](#output\_kusto\_eventhub\_data\_connection) | Kusto Eventhub Data Connection |
| <a name="output_lb"></a> [lb](#output\_lb) | Lb |
| <a name="output_lb_backend_address_pool"></a> [lb\_backend\_address\_pool](#output\_lb\_backend\_address\_pool) | Lb Backend Address Pool |
| <a name="output_lb_backend_pool"></a> [lb\_backend\_pool](#output\_lb\_backend\_pool) | Lb Backend Pool |
| <a name="output_lb_nat_pool"></a> [lb\_nat\_pool](#output\_lb\_nat\_pool) | Lb Nat Pool |
| <a name="output_lb_nat_rule"></a> [lb\_nat\_rule](#output\_lb\_nat\_rule) | Lb Nat Rule |
| <a name="output_lb_outbound_rule"></a> [lb\_outbound\_rule](#output\_lb\_outbound\_rule) | Lb Outbound Rule |
| <a name="output_lb_probe"></a> [lb\_probe](#output\_lb\_probe) | Lb Probe |
| <a name="output_lb_rule"></a> [lb\_rule](#output\_lb\_rule) | Lb Rule |
| <a name="output_linux_virtual_machine"></a> [linux\_virtual\_machine](#output\_linux\_virtual\_machine) | Linux Virtual Machine |
| <a name="output_linux_virtual_machine_scale_set"></a> [linux\_virtual\_machine\_scale\_set](#output\_linux\_virtual\_machine\_scale\_set) | Linux Virtual Machine Scale Set |
| <a name="output_load_test"></a> [load\_test](#output\_load\_test) | Load Test |
| <a name="output_local_network_gateway"></a> [local\_network\_gateway](#output\_local\_network\_gateway) | Local Network Gateway |
| <a name="output_log_analytics_cluster"></a> [log\_analytics\_cluster](#output\_log\_analytics\_cluster) | Log Analytics Cluster |
| <a name="output_log_analytics_storage_insights"></a> [log\_analytics\_storage\_insights](#output\_log\_analytics\_storage\_insights) | Log Analytics Storage Insights |
| <a name="output_log_analytics_workspace"></a> [log\_analytics\_workspace](#output\_log\_analytics\_workspace) | Log Analytics Workspace |
| <a name="output_logic_app_action_custom"></a> [logic\_app\_action\_custom](#output\_logic\_app\_action\_custom) | Logic App Action Custom |
| <a name="output_logic_app_action_http"></a> [logic\_app\_action\_http](#output\_logic\_app\_action\_http) | Logic App Action Http |
| <a name="output_logic_app_integration_account"></a> [logic\_app\_integration\_account](#output\_logic\_app\_integration\_account) | Logic App Integration Account |
| <a name="output_logic_app_trigger_custom"></a> [logic\_app\_trigger\_custom](#output\_logic\_app\_trigger\_custom) | Logic App Trigger Custom |
| <a name="output_logic_app_trigger_http_request"></a> [logic\_app\_trigger\_http\_request](#output\_logic\_app\_trigger\_http\_request) | Logic App Trigger Http Request |
| <a name="output_logic_app_trigger_recurrence"></a> [logic\_app\_trigger\_recurrence](#output\_logic\_app\_trigger\_recurrence) | Logic App Trigger Recurrence |
| <a name="output_logic_app_workflow"></a> [logic\_app\_workflow](#output\_logic\_app\_workflow) | Logic App Workflow |
| <a name="output_machine_learning_compute_instance"></a> [machine\_learning\_compute\_instance](#output\_machine\_learning\_compute\_instance) | Machine Learning Compute Instance |
| <a name="output_machine_learning_workspace"></a> [machine\_learning\_workspace](#output\_machine\_learning\_workspace) | Machine Learning Workspace |
| <a name="output_maintenance_configuration"></a> [maintenance\_configuration](#output\_maintenance\_configuration) | Maintenance Configuration |
| <a name="output_managed_disk"></a> [managed\_disk](#output\_managed\_disk) | Managed Disk |
| <a name="output_maps_account"></a> [maps\_account](#output\_maps\_account) | Maps Account |
| <a name="output_mariadb_database"></a> [mariadb\_database](#output\_mariadb\_database) | Mariadb Database |
| <a name="output_mariadb_firewall_rule"></a> [mariadb\_firewall\_rule](#output\_mariadb\_firewall\_rule) | Mariadb Firewall Rule |
| <a name="output_mariadb_server"></a> [mariadb\_server](#output\_mariadb\_server) | Mariadb Server |
| <a name="output_mariadb_virtual_network_rule"></a> [mariadb\_virtual\_network\_rule](#output\_mariadb\_virtual\_network\_rule) | Mariadb Virtual Network Rule |
| <a name="output_monitor_action_group"></a> [monitor\_action\_group](#output\_monitor\_action\_group) | Monitor Action Group |
| <a name="output_monitor_autoscale_setting"></a> [monitor\_autoscale\_setting](#output\_monitor\_autoscale\_setting) | Monitor Autoscale Setting |
| <a name="output_monitor_data_collection_endpoint"></a> [monitor\_data\_collection\_endpoint](#output\_monitor\_data\_collection\_endpoint) | Monitor Data Collection Endpoint |
| <a name="output_monitor_diagnostic_setting"></a> [monitor\_diagnostic\_setting](#output\_monitor\_diagnostic\_setting) | Monitor Diagnostic Setting |
| <a name="output_monitor_private_link_scope"></a> [monitor\_private\_link\_scope](#output\_monitor\_private\_link\_scope) | Monitor Private Link Scope |
| <a name="output_monitor_scheduled_query_rules_alert"></a> [monitor\_scheduled\_query\_rules\_alert](#output\_monitor\_scheduled\_query\_rules\_alert) | Monitor Scheduled Query Rules Alert |
| <a name="output_mssql_database"></a> [mssql\_database](#output\_mssql\_database) | Mssql Database |
| <a name="output_mssql_elasticpool"></a> [mssql\_elasticpool](#output\_mssql\_elasticpool) | Mssql Elasticpool |
| <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server) | Mssql Server |
| <a name="output_mysql_database"></a> [mysql\_database](#output\_mysql\_database) | Mysql Database |
| <a name="output_mysql_firewall_rule"></a> [mysql\_firewall\_rule](#output\_mysql\_firewall\_rule) | Mysql Firewall Rule |
| <a name="output_mysql_flexible_server"></a> [mysql\_flexible\_server](#output\_mysql\_flexible\_server) | Mysql Flexible Server |
| <a name="output_mysql_flexible_server_database"></a> [mysql\_flexible\_server\_database](#output\_mysql\_flexible\_server\_database) | Mysql Flexible Server Database |
| <a name="output_mysql_flexible_server_firewall_rule"></a> [mysql\_flexible\_server\_firewall\_rule](#output\_mysql\_flexible\_server\_firewall\_rule) | Mysql Flexible Server Firewall Rule |
| <a name="output_mysql_server"></a> [mysql\_server](#output\_mysql\_server) | Mysql Server |
| <a name="output_mysql_virtual_network_rule"></a> [mysql\_virtual\_network\_rule](#output\_mysql\_virtual\_network\_rule) | Mysql Virtual Network Rule |
| <a name="output_netapp_account"></a> [netapp\_account](#output\_netapp\_account) | Netapp Account |
| <a name="output_netapp_pool"></a> [netapp\_pool](#output\_netapp\_pool) | Netapp Pool |
| <a name="output_netapp_snapshot"></a> [netapp\_snapshot](#output\_netapp\_snapshot) | Netapp Snapshot |
| <a name="output_netapp_volume"></a> [netapp\_volume](#output\_netapp\_volume) | Netapp Volume |
| <a name="output_network_ddos_protection_plan"></a> [network\_ddos\_protection\_plan](#output\_network\_ddos\_protection\_plan) | Network Ddos Protection Plan |
| <a name="output_network_interface"></a> [network\_interface](#output\_network\_interface) | Network Interface |
| <a name="output_network_security_group"></a> [network\_security\_group](#output\_network\_security\_group) | Network Security Group |
| <a name="output_network_security_group_rule"></a> [network\_security\_group\_rule](#output\_network\_security\_group\_rule) | Network Security Group Rule |
| <a name="output_network_security_rule"></a> [network\_security\_rule](#output\_network\_security\_rule) | Network Security Rule |
| <a name="output_network_watcher"></a> [network\_watcher](#output\_network\_watcher) | Network Watcher |
| <a name="output_network_watcher_flow_log"></a> [network\_watcher\_flow\_log](#output\_network\_watcher\_flow\_log) | Network Watcher Flow Log |
| <a name="output_nginx_deployment"></a> [nginx\_deployment](#output\_nginx\_deployment) | Nginx Deployment |
| <a name="output_notification_hub"></a> [notification\_hub](#output\_notification\_hub) | Notification Hub |
| <a name="output_notification_hub_authorization_rule"></a> [notification\_hub\_authorization\_rule](#output\_notification\_hub\_authorization\_rule) | Notification Hub Authorization Rule |
| <a name="output_notification_hub_namespace"></a> [notification\_hub\_namespace](#output\_notification\_hub\_namespace) | Notification Hub Namespace |
| <a name="output_point_to_site_vpn_gateway"></a> [point\_to\_site\_vpn\_gateway](#output\_point\_to\_site\_vpn\_gateway) | Point To Site Vpn Gateway |
| <a name="output_portal_dashboard"></a> [portal\_dashboard](#output\_portal\_dashboard) | Portal Dashboard |
| <a name="output_postgresql_database"></a> [postgresql\_database](#output\_postgresql\_database) | Postgresql Database |
| <a name="output_postgresql_firewall_rule"></a> [postgresql\_firewall\_rule](#output\_postgresql\_firewall\_rule) | Postgresql Firewall Rule |
| <a name="output_postgresql_flexible_server"></a> [postgresql\_flexible\_server](#output\_postgresql\_flexible\_server) | Postgresql Flexible Server |
| <a name="output_postgresql_flexible_server_database"></a> [postgresql\_flexible\_server\_database](#output\_postgresql\_flexible\_server\_database) | Postgresql Flexible Server Database |
| <a name="output_postgresql_flexible_server_firewall_rule"></a> [postgresql\_flexible\_server\_firewall\_rule](#output\_postgresql\_flexible\_server\_firewall\_rule) | Postgresql Flexible Server Firewall Rule |
| <a name="output_postgresql_server"></a> [postgresql\_server](#output\_postgresql\_server) | Postgresql Server |
| <a name="output_postgresql_virtual_network_rule"></a> [postgresql\_virtual\_network\_rule](#output\_postgresql\_virtual\_network\_rule) | Postgresql Virtual Network Rule |
| <a name="output_powerbi_embedded"></a> [powerbi\_embedded](#output\_powerbi\_embedded) | Powerbi Embedded |
| <a name="output_private_dns_a_record"></a> [private\_dns\_a\_record](#output\_private\_dns\_a\_record) | Private Dns A Record |
| <a name="output_private_dns_aaaa_record"></a> [private\_dns\_aaaa\_record](#output\_private\_dns\_aaaa\_record) | Private Dns Aaaa Record |
| <a name="output_private_dns_cname_record"></a> [private\_dns\_cname\_record](#output\_private\_dns\_cname\_record) | Private Dns Cname Record |
| <a name="output_private_dns_mx_record"></a> [private\_dns\_mx\_record](#output\_private\_dns\_mx\_record) | Private Dns Mx Record |
| <a name="output_private_dns_ptr_record"></a> [private\_dns\_ptr\_record](#output\_private\_dns\_ptr\_record) | Private Dns Ptr Record |
| <a name="output_private_dns_resolver"></a> [private\_dns\_resolver](#output\_private\_dns\_resolver) | Private Dns Resolver |
| <a name="output_private_dns_resolver_dns_forwarding_ruleset"></a> [private\_dns\_resolver\_dns\_forwarding\_ruleset](#output\_private\_dns\_resolver\_dns\_forwarding\_ruleset) | Private Dns Resolver Dns Forwarding Ruleset |
| <a name="output_private_dns_resolver_forwarding_rule"></a> [private\_dns\_resolver\_forwarding\_rule](#output\_private\_dns\_resolver\_forwarding\_rule) | Private Dns Resolver Forwarding Rule |
| <a name="output_private_dns_resolver_inbound_endpoint"></a> [private\_dns\_resolver\_inbound\_endpoint](#output\_private\_dns\_resolver\_inbound\_endpoint) | Private Dns Resolver Inbound Endpoint |
| <a name="output_private_dns_resolver_outbound_endpoint"></a> [private\_dns\_resolver\_outbound\_endpoint](#output\_private\_dns\_resolver\_outbound\_endpoint) | Private Dns Resolver Outbound Endpoint |
| <a name="output_private_dns_resolver_virtual_network_link"></a> [private\_dns\_resolver\_virtual\_network\_link](#output\_private\_dns\_resolver\_virtual\_network\_link) | Private Dns Resolver Virtual Network Link |
| <a name="output_private_dns_srv_record"></a> [private\_dns\_srv\_record](#output\_private\_dns\_srv\_record) | Private Dns Srv Record |
| <a name="output_private_dns_txt_record"></a> [private\_dns\_txt\_record](#output\_private\_dns\_txt\_record) | Private Dns Txt Record |
| <a name="output_private_dns_zone"></a> [private\_dns\_zone](#output\_private\_dns\_zone) | Private Dns Zone |
| <a name="output_private_dns_zone_group"></a> [private\_dns\_zone\_group](#output\_private\_dns\_zone\_group) | Private Dns Zone Group |
| <a name="output_private_endpoint"></a> [private\_endpoint](#output\_private\_endpoint) | Private Endpoint |
| <a name="output_private_link_service"></a> [private\_link\_service](#output\_private\_link\_service) | Private Link Service |
| <a name="output_private_service_connection"></a> [private\_service\_connection](#output\_private\_service\_connection) | Private Service Connection |
| <a name="output_proximity_placement_group"></a> [proximity\_placement\_group](#output\_proximity\_placement\_group) | Proximity Placement Group |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public Ip |
| <a name="output_public_ip_prefix"></a> [public\_ip\_prefix](#output\_public\_ip\_prefix) | Public Ip Prefix |
| <a name="output_purview_account"></a> [purview\_account](#output\_purview\_account) | Purview Account |
| <a name="output_recovery_services_vault"></a> [recovery\_services\_vault](#output\_recovery\_services\_vault) | Recovery Services Vault |
| <a name="output_recovery_services_vault_backup_policy"></a> [recovery\_services\_vault\_backup\_policy](#output\_recovery\_services\_vault\_backup\_policy) | Recovery Services Vault Backup Policy |
| <a name="output_redhat_openshift_cluster"></a> [redhat\_openshift\_cluster](#output\_redhat\_openshift\_cluster) | Redhat Openshift Cluster |
| <a name="output_redhat_openshift_domain"></a> [redhat\_openshift\_domain](#output\_redhat\_openshift\_domain) | Redhat Openshift Domain |
| <a name="output_redis_cache"></a> [redis\_cache](#output\_redis\_cache) | Redis Cache |
| <a name="output_redis_firewall_rule"></a> [redis\_firewall\_rule](#output\_redis\_firewall\_rule) | Redis Firewall Rule |
| <a name="output_relay_hybrid_connection"></a> [relay\_hybrid\_connection](#output\_relay\_hybrid\_connection) | Relay Hybrid Connection |
| <a name="output_relay_namespace"></a> [relay\_namespace](#output\_relay\_namespace) | Relay Namespace |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Resource Group |
| <a name="output_resource_group_policy_assignment"></a> [resource\_group\_policy\_assignment](#output\_resource\_group\_policy\_assignment) | Resource Group Policy Assignment |
| <a name="output_role_assignment"></a> [role\_assignment](#output\_role\_assignment) | Role Assignment |
| <a name="output_role_definition"></a> [role\_definition](#output\_role\_definition) | Role Definition |
| <a name="output_route"></a> [route](#output\_route) | Route |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | Route Table |
| <a name="output_search_service"></a> [search\_service](#output\_search\_service) | Search Service |
| <a name="output_service_fabric_cluster"></a> [service\_fabric\_cluster](#output\_service\_fabric\_cluster) | Service Fabric Cluster |
| <a name="output_servicebus_namespace"></a> [servicebus\_namespace](#output\_servicebus\_namespace) | Servicebus Namespace |
| <a name="output_servicebus_namespace_authorization_rule"></a> [servicebus\_namespace\_authorization\_rule](#output\_servicebus\_namespace\_authorization\_rule) | Servicebus Namespace Authorization Rule |
| <a name="output_servicebus_queue"></a> [servicebus\_queue](#output\_servicebus\_queue) | Servicebus Queue |
| <a name="output_servicebus_queue_authorization_rule"></a> [servicebus\_queue\_authorization\_rule](#output\_servicebus\_queue\_authorization\_rule) | Servicebus Queue Authorization Rule |
| <a name="output_servicebus_subscription"></a> [servicebus\_subscription](#output\_servicebus\_subscription) | Servicebus Subscription |
| <a name="output_servicebus_subscription_rule"></a> [servicebus\_subscription\_rule](#output\_servicebus\_subscription\_rule) | Servicebus Subscription Rule |
| <a name="output_servicebus_topic"></a> [servicebus\_topic](#output\_servicebus\_topic) | Servicebus Topic |
| <a name="output_servicebus_topic_authorization_rule"></a> [servicebus\_topic\_authorization\_rule](#output\_servicebus\_topic\_authorization\_rule) | Servicebus Topic Authorization Rule |
| <a name="output_shared_image"></a> [shared\_image](#output\_shared\_image) | Shared Image |
| <a name="output_shared_image_gallery"></a> [shared\_image\_gallery](#output\_shared\_image\_gallery) | Shared Image Gallery |
| <a name="output_signalr_service"></a> [signalr\_service](#output\_signalr\_service) | Signalr Service |
| <a name="output_snapshots"></a> [snapshots](#output\_snapshots) | Snapshots |
| <a name="output_sql_elasticpool"></a> [sql\_elasticpool](#output\_sql\_elasticpool) | Sql Elasticpool |
| <a name="output_sql_failover_group"></a> [sql\_failover\_group](#output\_sql\_failover\_group) | Sql Failover Group |
| <a name="output_sql_firewall_rule"></a> [sql\_firewall\_rule](#output\_sql\_firewall\_rule) | Sql Firewall Rule |
| <a name="output_sql_server"></a> [sql\_server](#output\_sql\_server) | Sql Server |
| <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account) | Storage Account |
| <a name="output_storage_blob"></a> [storage\_blob](#output\_storage\_blob) | Storage Blob |
| <a name="output_storage_container"></a> [storage\_container](#output\_storage\_container) | Storage Container |
| <a name="output_storage_data_lake_gen2_filesystem"></a> [storage\_data\_lake\_gen2\_filesystem](#output\_storage\_data\_lake\_gen2\_filesystem) | Storage Data Lake Gen2 Filesystem |
| <a name="output_storage_queue"></a> [storage\_queue](#output\_storage\_queue) | Storage Queue |
| <a name="output_storage_share"></a> [storage\_share](#output\_storage\_share) | Storage Share |
| <a name="output_storage_share_directory"></a> [storage\_share\_directory](#output\_storage\_share\_directory) | Storage Share Directory |
| <a name="output_storage_sync"></a> [storage\_sync](#output\_storage\_sync) | Storage Sync |
| <a name="output_storage_sync_group"></a> [storage\_sync\_group](#output\_storage\_sync\_group) | Storage Sync Group |
| <a name="output_storage_table"></a> [storage\_table](#output\_storage\_table) | Storage Table |
| <a name="output_stream_analytics_function_javascript_udf"></a> [stream\_analytics\_function\_javascript\_udf](#output\_stream\_analytics\_function\_javascript\_udf) | Stream Analytics Function Javascript Udf |
| <a name="output_stream_analytics_job"></a> [stream\_analytics\_job](#output\_stream\_analytics\_job) | Stream Analytics Job |
| <a name="output_stream_analytics_output_blob"></a> [stream\_analytics\_output\_blob](#output\_stream\_analytics\_output\_blob) | Stream Analytics Output Blob |
| <a name="output_stream_analytics_output_eventhub"></a> [stream\_analytics\_output\_eventhub](#output\_stream\_analytics\_output\_eventhub) | Stream Analytics Output Eventhub |
| <a name="output_stream_analytics_output_mssql"></a> [stream\_analytics\_output\_mssql](#output\_stream\_analytics\_output\_mssql) | Stream Analytics Output Mssql |
| <a name="output_stream_analytics_output_servicebus_queue"></a> [stream\_analytics\_output\_servicebus\_queue](#output\_stream\_analytics\_output\_servicebus\_queue) | Stream Analytics Output Servicebus Queue |
| <a name="output_stream_analytics_output_servicebus_topic"></a> [stream\_analytics\_output\_servicebus\_topic](#output\_stream\_analytics\_output\_servicebus\_topic) | Stream Analytics Output Servicebus Topic |
| <a name="output_stream_analytics_reference_input_blob"></a> [stream\_analytics\_reference\_input\_blob](#output\_stream\_analytics\_reference\_input\_blob) | Stream Analytics Reference Input Blob |
| <a name="output_stream_analytics_stream_input_blob"></a> [stream\_analytics\_stream\_input\_blob](#output\_stream\_analytics\_stream\_input\_blob) | Stream Analytics Stream Input Blob |
| <a name="output_stream_analytics_stream_input_eventhub"></a> [stream\_analytics\_stream\_input\_eventhub](#output\_stream\_analytics\_stream\_input\_eventhub) | Stream Analytics Stream Input Eventhub |
| <a name="output_stream_analytics_stream_input_iothub"></a> [stream\_analytics\_stream\_input\_iothub](#output\_stream\_analytics\_stream\_input\_iothub) | Stream Analytics Stream Input Iothub |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Subnet |
| <a name="output_subscription_policy_assignment"></a> [subscription\_policy\_assignment](#output\_subscription\_policy\_assignment) | Subscription Policy Assignment |
| <a name="output_synapse_firewall_rule"></a> [synapse\_firewall\_rule](#output\_synapse\_firewall\_rule) | Synapse Firewall Rule |
| <a name="output_synapse_integration_runtime_azure"></a> [synapse\_integration\_runtime\_azure](#output\_synapse\_integration\_runtime\_azure) | Synapse Integration Runtime Azure |
| <a name="output_synapse_integration_runtime_self_hosted"></a> [synapse\_integration\_runtime\_self\_hosted](#output\_synapse\_integration\_runtime\_self\_hosted) | Synapse Integration Runtime Self Hosted |
| <a name="output_synapse_linked_service"></a> [synapse\_linked\_service](#output\_synapse\_linked\_service) | Synapse Linked Service |
| <a name="output_synapse_managed_private_endpoint"></a> [synapse\_managed\_private\_endpoint](#output\_synapse\_managed\_private\_endpoint) | Synapse Managed Private Endpoint |
| <a name="output_synapse_private_link_hub"></a> [synapse\_private\_link\_hub](#output\_synapse\_private\_link\_hub) | Synapse Private Link Hub |
| <a name="output_synapse_spark_pool"></a> [synapse\_spark\_pool](#output\_synapse\_spark\_pool) | Synapse Spark Pool |
| <a name="output_synapse_sql_pool"></a> [synapse\_sql\_pool](#output\_synapse\_sql\_pool) | Synapse Sql Pool |
| <a name="output_synapse_sql_pool_vulnerability_assessment_baseline"></a> [synapse\_sql\_pool\_vulnerability\_assessment\_baseline](#output\_synapse\_sql\_pool\_vulnerability\_assessment\_baseline) | Synapse Sql Pool Vulnerability Assessment Baseline |
| <a name="output_synapse_sql_pool_workload_classifier"></a> [synapse\_sql\_pool\_workload\_classifier](#output\_synapse\_sql\_pool\_workload\_classifier) | Synapse Sql Pool Workload Classifier |
| <a name="output_synapse_sql_pool_workload_group"></a> [synapse\_sql\_pool\_workload\_group](#output\_synapse\_sql\_pool\_workload\_group) | Synapse Sql Pool Workload Group |
| <a name="output_synapse_workspace"></a> [synapse\_workspace](#output\_synapse\_workspace) | Synapse Workspace |
| <a name="output_template_deployment"></a> [template\_deployment](#output\_template\_deployment) | Template Deployment |
| <a name="output_traffic_manager_profile"></a> [traffic\_manager\_profile](#output\_traffic\_manager\_profile) | Traffic Manager Profile |
| <a name="output_unique-seed"></a> [unique-seed](#output\_unique-seed) | n/a |
| <a name="output_user_assigned_identity"></a> [user\_assigned\_identity](#output\_user\_assigned\_identity) | User Assigned Identity |
| <a name="output_validation"></a> [validation](#output\_validation) | n/a |
| <a name="output_virtual_desktop_application_group"></a> [virtual\_desktop\_application\_group](#output\_virtual\_desktop\_application\_group) | Virtual Desktop Application Group |
| <a name="output_virtual_desktop_host_pool"></a> [virtual\_desktop\_host\_pool](#output\_virtual\_desktop\_host\_pool) | Virtual Desktop Host Pool |
| <a name="output_virtual_desktop_workspace"></a> [virtual\_desktop\_workspace](#output\_virtual\_desktop\_workspace) | Virtual Desktop Workspace |
| <a name="output_virtual_hub"></a> [virtual\_hub](#output\_virtual\_hub) | Virtual Hub |
| <a name="output_virtual_hub_connection"></a> [virtual\_hub\_connection](#output\_virtual\_hub\_connection) | Virtual Hub Connection |
| <a name="output_virtual_machine"></a> [virtual\_machine](#output\_virtual\_machine) | Virtual Machine |
| <a name="output_virtual_machine_extension"></a> [virtual\_machine\_extension](#output\_virtual\_machine\_extension) | Virtual Machine Extension |
| <a name="output_virtual_machine_scale_set"></a> [virtual\_machine\_scale\_set](#output\_virtual\_machine\_scale\_set) | Virtual Machine Scale Set |
| <a name="output_virtual_machine_scale_set_extension"></a> [virtual\_machine\_scale\_set\_extension](#output\_virtual\_machine\_scale\_set\_extension) | Virtual Machine Scale Set Extension |
| <a name="output_virtual_network"></a> [virtual\_network](#output\_virtual\_network) | Virtual Network |
| <a name="output_virtual_network_gateway"></a> [virtual\_network\_gateway](#output\_virtual\_network\_gateway) | Virtual Network Gateway |
| <a name="output_virtual_network_gateway_connection"></a> [virtual\_network\_gateway\_connection](#output\_virtual\_network\_gateway\_connection) | Virtual Network Gateway Connection |
| <a name="output_virtual_network_peering"></a> [virtual\_network\_peering](#output\_virtual\_network\_peering) | Virtual Network Peering |
| <a name="output_virtual_wan"></a> [virtual\_wan](#output\_virtual\_wan) | Virtual Wan |
| <a name="output_vpn_gateway_connection"></a> [vpn\_gateway\_connection](#output\_vpn\_gateway\_connection) | Vpn Gateway Connection |
| <a name="output_vpn_site"></a> [vpn\_site](#output\_vpn\_site) | Vpn Site |
| <a name="output_web_pubsub"></a> [web\_pubsub](#output\_web\_pubsub) | Web Pubsub |
| <a name="output_web_pubsub_hub"></a> [web\_pubsub\_hub](#output\_web\_pubsub\_hub) | Web Pubsub Hub |
| <a name="output_windows_virtual_machine"></a> [windows\_virtual\_machine](#output\_windows\_virtual\_machine) | Windows Virtual Machine |
| <a name="output_windows_virtual_machine_scale_set"></a> [windows\_virtual\_machine\_scale\_set](#output\_windows\_virtual\_machine\_scale\_set) | Windows Virtual Machine Scale Set |
<!-- END_TF_DOCS -->

## Notes

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory

## Contributing

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md).

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-azure-naming/graphs/contributors).

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.
