# Azure Naming

This terraform module streamlines Azure resource naming, using regular expressions to ensure consistency and flexibility with customizable prefixes and suffixes. This facilitates structured and uniform naming across deployments.

## Features

Ensures consistent naming across all resources.

Generates resource slugs for standardized naming.

Optionally randomizes names for globally unique identifiers.

Validates names using regular expressions for compliance.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.6)

## Providers

The following providers are used by this module:

- <a name="provider_random"></a> [random](#provider\_random) (3.7.2)

## Resources

The following resources are used by this module:

- [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)
- [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_prefix"></a> [prefix](#input\_prefix)

Description: It is not recommended that you use prefix by azure you should be using a suffix for your resources.

Type: `list(string)`

Default: `[]`

### <a name="input_suffix"></a> [suffix](#input\_suffix)

Description: It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible

Type: `list(string)`

Default: `[]`

### <a name="input_unique-include-numbers"></a> [unique-include-numbers](#input\_unique-include-numbers)

Description: If you want to include numbers in the unique generation

Type: `bool`

Default: `true`

### <a name="input_unique-length"></a> [unique-length](#input\_unique-length)

Description: Max length of the uniqueness suffix to be added

Type: `number`

Default: `4`

### <a name="input_unique-seed"></a> [unique-seed](#input\_unique-seed)

Description: Custom value for the random characters to be used

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_aadb2c_directory"></a> [aadb2c\_directory](#output\_aadb2c\_directory)

Description: Aadb2c Directory

### <a name="output_aks_node_pool_linux"></a> [aks\_node\_pool\_linux](#output\_aks\_node\_pool\_linux)

Description: Aks Node Pool Linux

### <a name="output_aks_node_pool_windows"></a> [aks\_node\_pool\_windows](#output\_aks\_node\_pool\_windows)

Description: Aks Node Pool Windows

### <a name="output_analysis_services_server"></a> [analysis\_services\_server](#output\_analysis\_services\_server)

Description: Analysis Services Server

### <a name="output_api_management"></a> [api\_management](#output\_api\_management)

Description: Api Management

### <a name="output_api_management_api"></a> [api\_management\_api](#output\_api\_management\_api)

Description: Api Management Api

### <a name="output_api_management_api_operation_tag"></a> [api\_management\_api\_operation\_tag](#output\_api\_management\_api\_operation\_tag)

Description: Api Management Api Operation Tag

### <a name="output_api_management_backend"></a> [api\_management\_backend](#output\_api\_management\_backend)

Description: Api Management Backend

### <a name="output_api_management_certificate"></a> [api\_management\_certificate](#output\_api\_management\_certificate)

Description: Api Management Certificate

### <a name="output_api_management_gateway"></a> [api\_management\_gateway](#output\_api\_management\_gateway)

Description: Api Management Gateway

### <a name="output_api_management_group"></a> [api\_management\_group](#output\_api\_management\_group)

Description: Api Management Group

### <a name="output_api_management_logger"></a> [api\_management\_logger](#output\_api\_management\_logger)

Description: Api Management Logger

### <a name="output_app_configuration"></a> [app\_configuration](#output\_app\_configuration)

Description: App Configuration

### <a name="output_app_service"></a> [app\_service](#output\_app\_service)

Description: App Service

### <a name="output_app_service_environment"></a> [app\_service\_environment](#output\_app\_service\_environment)

Description: App Service Environment

### <a name="output_app_service_plan"></a> [app\_service\_plan](#output\_app\_service\_plan)

Description: App Service Plan

### <a name="output_application_gateway"></a> [application\_gateway](#output\_application\_gateway)

Description: Application Gateway

### <a name="output_application_insights"></a> [application\_insights](#output\_application\_insights)

Description: Application Insights

### <a name="output_application_insights_web_test"></a> [application\_insights\_web\_test](#output\_application\_insights\_web\_test)

Description: Application Insights Web Test

### <a name="output_application_security_group"></a> [application\_security\_group](#output\_application\_security\_group)

Description: Application Security Group

### <a name="output_automation_account"></a> [automation\_account](#output\_automation\_account)

Description: Automation Account

### <a name="output_automation_certificate"></a> [automation\_certificate](#output\_automation\_certificate)

Description: Automation Certificate

### <a name="output_automation_credential"></a> [automation\_credential](#output\_automation\_credential)

Description: Automation Credential

### <a name="output_automation_job_schedule"></a> [automation\_job\_schedule](#output\_automation\_job\_schedule)

Description: Automation Job Schedule

### <a name="output_automation_runbook"></a> [automation\_runbook](#output\_automation\_runbook)

Description: Automation Runbook

### <a name="output_automation_schedule"></a> [automation\_schedule](#output\_automation\_schedule)

Description: Automation Schedule

### <a name="output_automation_variable"></a> [automation\_variable](#output\_automation\_variable)

Description: Automation Variable

### <a name="output_automation_webhook"></a> [automation\_webhook](#output\_automation\_webhook)

Description: Automation Webhook

### <a name="output_availability_set"></a> [availability\_set](#output\_availability\_set)

Description: Availability Set

### <a name="output_bastion_host"></a> [bastion\_host](#output\_bastion\_host)

Description: Bastion Host

### <a name="output_batch_account"></a> [batch\_account](#output\_batch\_account)

Description: Batch Account

### <a name="output_batch_application"></a> [batch\_application](#output\_batch\_application)

Description: Batch Application

### <a name="output_batch_certificate"></a> [batch\_certificate](#output\_batch\_certificate)

Description: Batch Certificate

### <a name="output_batch_pool"></a> [batch\_pool](#output\_batch\_pool)

Description: Batch Pool

### <a name="output_bot_channel_directline"></a> [bot\_channel\_directline](#output\_bot\_channel\_directline)

Description: Bot Channel Directline

### <a name="output_bot_channel_email"></a> [bot\_channel\_email](#output\_bot\_channel\_email)

Description: Bot Channel Email

### <a name="output_bot_channel_ms_teams"></a> [bot\_channel\_ms\_teams](#output\_bot\_channel\_ms\_teams)

Description: Bot Channel Ms Teams

### <a name="output_bot_channel_slack"></a> [bot\_channel\_slack](#output\_bot\_channel\_slack)

Description: Bot Channel Slack

### <a name="output_bot_channels_registration"></a> [bot\_channels\_registration](#output\_bot\_channels\_registration)

Description: Bot Channels Registration

### <a name="output_bot_connection"></a> [bot\_connection](#output\_bot\_connection)

Description: Bot Connection

### <a name="output_bot_web_app"></a> [bot\_web\_app](#output\_bot\_web\_app)

Description: Bot Web App

### <a name="output_cdn_frontdoor_custom_domain"></a> [cdn\_frontdoor\_custom\_domain](#output\_cdn\_frontdoor\_custom\_domain)

Description: Cdn Frontdoor Custom Domain

### <a name="output_cdn_frontdoor_endpoint"></a> [cdn\_frontdoor\_endpoint](#output\_cdn\_frontdoor\_endpoint)

Description: Cdn Frontdoor Endpoint

### <a name="output_cdn_frontdoor_firewall_policy"></a> [cdn\_frontdoor\_firewall\_policy](#output\_cdn\_frontdoor\_firewall\_policy)

Description: Cdn Frontdoor Firewall Policy

### <a name="output_cdn_frontdoor_origin"></a> [cdn\_frontdoor\_origin](#output\_cdn\_frontdoor\_origin)

Description: Cdn Frontdoor Origin

### <a name="output_cdn_frontdoor_origin_group"></a> [cdn\_frontdoor\_origin\_group](#output\_cdn\_frontdoor\_origin\_group)

Description: Cdn Frontdoor Origin Group

### <a name="output_cdn_frontdoor_profile"></a> [cdn\_frontdoor\_profile](#output\_cdn\_frontdoor\_profile)

Description: Cdn Frontdoor Profile

### <a name="output_cdn_frontdoor_route"></a> [cdn\_frontdoor\_route](#output\_cdn\_frontdoor\_route)

Description: Cdn Frontdoor Route

### <a name="output_cdn_frontdoor_rule"></a> [cdn\_frontdoor\_rule](#output\_cdn\_frontdoor\_rule)

Description: Cdn Frontdoor Rule

### <a name="output_cdn_frontdoor_rule_set"></a> [cdn\_frontdoor\_rule\_set](#output\_cdn\_frontdoor\_rule\_set)

Description: Cdn Frontdoor Rule Set

### <a name="output_cdn_frontdoor_secret"></a> [cdn\_frontdoor\_secret](#output\_cdn\_frontdoor\_secret)

Description: Cdn Frontdoor Secret

### <a name="output_cdn_frontdoor_security_policy"></a> [cdn\_frontdoor\_security\_policy](#output\_cdn\_frontdoor\_security\_policy)

Description: Cdn Frontdoor Security Policy

### <a name="output_cognitive_account"></a> [cognitive\_account](#output\_cognitive\_account)

Description: Cognitive Account

### <a name="output_cognitive_deployment"></a> [cognitive\_deployment](#output\_cognitive\_deployment)

Description: Cognitive Deployment

### <a name="output_communication_service"></a> [communication\_service](#output\_communication\_service)

Description: Communication Service

### <a name="output_consumption_budget_resource_group"></a> [consumption\_budget\_resource\_group](#output\_consumption\_budget\_resource\_group)

Description: Consumption Budget Resource Group

### <a name="output_consumption_budget_subscription"></a> [consumption\_budget\_subscription](#output\_consumption\_budget\_subscription)

Description: Consumption Budget Subscription

### <a name="output_containerGroups"></a> [containerGroups](#output\_containerGroups)

Description: Containergroups

### <a name="output_container_app"></a> [container\_app](#output\_container\_app)

Description: Container App

### <a name="output_container_app_environment"></a> [container\_app\_environment](#output\_container\_app\_environment)

Description: Container App Environment

### <a name="output_container_app_job"></a> [container\_app\_job](#output\_container\_app\_job)

Description: Container App Job

### <a name="output_container_group"></a> [container\_group](#output\_container\_group)

Description: Container Group

### <a name="output_container_registry"></a> [container\_registry](#output\_container\_registry)

Description: Container Registry

### <a name="output_container_registry_webhook"></a> [container\_registry\_webhook](#output\_container\_registry\_webhook)

Description: Container Registry Webhook

### <a name="output_cosmosdb_account"></a> [cosmosdb\_account](#output\_cosmosdb\_account)

Description: Cosmosdb Account

### <a name="output_cosmosdb_cassandra_cluster"></a> [cosmosdb\_cassandra\_cluster](#output\_cosmosdb\_cassandra\_cluster)

Description: Cosmosdb Cassandra Cluster

### <a name="output_cosmosdb_cassandra_datacenter"></a> [cosmosdb\_cassandra\_datacenter](#output\_cosmosdb\_cassandra\_datacenter)

Description: Cosmosdb Cassandra Datacenter

### <a name="output_cosmosdb_postgres"></a> [cosmosdb\_postgres](#output\_cosmosdb\_postgres)

Description: Cosmosdb Postgres

### <a name="output_custom_provider"></a> [custom\_provider](#output\_custom\_provider)

Description: Custom Provider

### <a name="output_dashboard"></a> [dashboard](#output\_dashboard)

Description: Dashboard

### <a name="output_data_collection_endpoint"></a> [data\_collection\_endpoint](#output\_data\_collection\_endpoint)

Description: Data Collection Endpoint

### <a name="output_data_collection_rule"></a> [data\_collection\_rule](#output\_data\_collection\_rule)

Description: Data Collection Rule

### <a name="output_data_factory"></a> [data\_factory](#output\_data\_factory)

Description: Data Factory

### <a name="output_data_factory_dataset_mysql"></a> [data\_factory\_dataset\_mysql](#output\_data\_factory\_dataset\_mysql)

Description: Data Factory Dataset Mysql

### <a name="output_data_factory_dataset_postgresql"></a> [data\_factory\_dataset\_postgresql](#output\_data\_factory\_dataset\_postgresql)

Description: Data Factory Dataset Postgresql

### <a name="output_data_factory_dataset_sql_server_table"></a> [data\_factory\_dataset\_sql\_server\_table](#output\_data\_factory\_dataset\_sql\_server\_table)

Description: Data Factory Dataset Sql Server Table

### <a name="output_data_factory_integration_runtime_managed"></a> [data\_factory\_integration\_runtime\_managed](#output\_data\_factory\_integration\_runtime\_managed)

Description: Data Factory Integration Runtime Managed

### <a name="output_data_factory_linked_service_data_lake_storage_gen2"></a> [data\_factory\_linked\_service\_data\_lake\_storage\_gen2](#output\_data\_factory\_linked\_service\_data\_lake\_storage\_gen2)

Description: Data Factory Linked Service Data Lake Storage Gen2

### <a name="output_data_factory_linked_service_key_vault"></a> [data\_factory\_linked\_service\_key\_vault](#output\_data\_factory\_linked\_service\_key\_vault)

Description: Data Factory Linked Service Key Vault

### <a name="output_data_factory_linked_service_mysql"></a> [data\_factory\_linked\_service\_mysql](#output\_data\_factory\_linked\_service\_mysql)

Description: Data Factory Linked Service Mysql

### <a name="output_data_factory_linked_service_postgresql"></a> [data\_factory\_linked\_service\_postgresql](#output\_data\_factory\_linked\_service\_postgresql)

Description: Data Factory Linked Service Postgresql

### <a name="output_data_factory_linked_service_sql_server"></a> [data\_factory\_linked\_service\_sql\_server](#output\_data\_factory\_linked\_service\_sql\_server)

Description: Data Factory Linked Service Sql Server

### <a name="output_data_factory_pipeline"></a> [data\_factory\_pipeline](#output\_data\_factory\_pipeline)

Description: Data Factory Pipeline

### <a name="output_data_factory_trigger_schedule"></a> [data\_factory\_trigger\_schedule](#output\_data\_factory\_trigger\_schedule)

Description: Data Factory Trigger Schedule

### <a name="output_data_lake_analytics_account"></a> [data\_lake\_analytics\_account](#output\_data\_lake\_analytics\_account)

Description: Data Lake Analytics Account

### <a name="output_data_lake_analytics_firewall_rule"></a> [data\_lake\_analytics\_firewall\_rule](#output\_data\_lake\_analytics\_firewall\_rule)

Description: Data Lake Analytics Firewall Rule

### <a name="output_data_lake_store"></a> [data\_lake\_store](#output\_data\_lake\_store)

Description: Data Lake Store

### <a name="output_data_lake_store_firewall_rule"></a> [data\_lake\_store\_firewall\_rule](#output\_data\_lake\_store\_firewall\_rule)

Description: Data Lake Store Firewall Rule

### <a name="output_database_migration_project"></a> [database\_migration\_project](#output\_database\_migration\_project)

Description: Database Migration Project

### <a name="output_database_migration_service"></a> [database\_migration\_service](#output\_database\_migration\_service)

Description: Database Migration Service

### <a name="output_databricks_cluster"></a> [databricks\_cluster](#output\_databricks\_cluster)

Description: Databricks Cluster

### <a name="output_databricks_high_concurrency_cluster"></a> [databricks\_high\_concurrency\_cluster](#output\_databricks\_high\_concurrency\_cluster)

Description: Databricks High Concurrency Cluster

### <a name="output_databricks_standard_cluster"></a> [databricks\_standard\_cluster](#output\_databricks\_standard\_cluster)

Description: Databricks Standard Cluster

### <a name="output_databricks_workspace"></a> [databricks\_workspace](#output\_databricks\_workspace)

Description: Databricks Workspace

### <a name="output_dev_test_lab"></a> [dev\_test\_lab](#output\_dev\_test\_lab)

Description: Dev Test Lab

### <a name="output_dev_test_linux_virtual_machine"></a> [dev\_test\_linux\_virtual\_machine](#output\_dev\_test\_linux\_virtual\_machine)

Description: Dev Test Linux Virtual Machine

### <a name="output_dev_test_windows_virtual_machine"></a> [dev\_test\_windows\_virtual\_machine](#output\_dev\_test\_windows\_virtual\_machine)

Description: Dev Test Windows Virtual Machine

### <a name="output_digital_twins_endpoint_eventgrid"></a> [digital\_twins\_endpoint\_eventgrid](#output\_digital\_twins\_endpoint\_eventgrid)

Description: Digital Twins Endpoint Eventgrid

### <a name="output_digital_twins_endpoint_eventhub"></a> [digital\_twins\_endpoint\_eventhub](#output\_digital\_twins\_endpoint\_eventhub)

Description: Digital Twins Endpoint Eventhub

### <a name="output_digital_twins_endpoint_servicebus"></a> [digital\_twins\_endpoint\_servicebus](#output\_digital\_twins\_endpoint\_servicebus)

Description: Digital Twins Endpoint Servicebus

### <a name="output_digital_twins_instance"></a> [digital\_twins\_instance](#output\_digital\_twins\_instance)

Description: Digital Twins Instance

### <a name="output_disk_encryption_set"></a> [disk\_encryption\_set](#output\_disk\_encryption\_set)

Description: Disk Encryption Set

### <a name="output_dns_a_record"></a> [dns\_a\_record](#output\_dns\_a\_record)

Description: Dns A Record

### <a name="output_dns_aaaa_record"></a> [dns\_aaaa\_record](#output\_dns\_aaaa\_record)

Description: Dns Aaaa Record

### <a name="output_dns_caa_record"></a> [dns\_caa\_record](#output\_dns\_caa\_record)

Description: Dns Caa Record

### <a name="output_dns_cname_record"></a> [dns\_cname\_record](#output\_dns\_cname\_record)

Description: Dns Cname Record

### <a name="output_dns_mx_record"></a> [dns\_mx\_record](#output\_dns\_mx\_record)

Description: Dns Mx Record

### <a name="output_dns_ns_record"></a> [dns\_ns\_record](#output\_dns\_ns\_record)

Description: Dns Ns Record

### <a name="output_dns_ptr_record"></a> [dns\_ptr\_record](#output\_dns\_ptr\_record)

Description: Dns Ptr Record

### <a name="output_dns_txt_record"></a> [dns\_txt\_record](#output\_dns\_txt\_record)

Description: Dns Txt Record

### <a name="output_dns_zone"></a> [dns\_zone](#output\_dns\_zone)

Description: Dns Zone

### <a name="output_eventgrid_domain"></a> [eventgrid\_domain](#output\_eventgrid\_domain)

Description: Eventgrid Domain

### <a name="output_eventgrid_domain_topic"></a> [eventgrid\_domain\_topic](#output\_eventgrid\_domain\_topic)

Description: Eventgrid Domain Topic

### <a name="output_eventgrid_event_subscription"></a> [eventgrid\_event\_subscription](#output\_eventgrid\_event\_subscription)

Description: Eventgrid Event Subscription

### <a name="output_eventgrid_topic"></a> [eventgrid\_topic](#output\_eventgrid\_topic)

Description: Eventgrid Topic

### <a name="output_eventhub"></a> [eventhub](#output\_eventhub)

Description: Eventhub

### <a name="output_eventhub_authorization_rule"></a> [eventhub\_authorization\_rule](#output\_eventhub\_authorization\_rule)

Description: Eventhub Authorization Rule

### <a name="output_eventhub_consumer_group"></a> [eventhub\_consumer\_group](#output\_eventhub\_consumer\_group)

Description: Eventhub Consumer Group

### <a name="output_eventhub_namespace"></a> [eventhub\_namespace](#output\_eventhub\_namespace)

Description: Eventhub Namespace

### <a name="output_eventhub_namespace_authorization_rule"></a> [eventhub\_namespace\_authorization\_rule](#output\_eventhub\_namespace\_authorization\_rule)

Description: Eventhub Namespace Authorization Rule

### <a name="output_eventhub_namespace_disaster_recovery_config"></a> [eventhub\_namespace\_disaster\_recovery\_config](#output\_eventhub\_namespace\_disaster\_recovery\_config)

Description: Eventhub Namespace Disaster Recovery Config

### <a name="output_express_route_circuit"></a> [express\_route\_circuit](#output\_express\_route\_circuit)

Description: Express Route Circuit

### <a name="output_express_route_gateway"></a> [express\_route\_gateway](#output\_express\_route\_gateway)

Description: Express Route Gateway

### <a name="output_firewall"></a> [firewall](#output\_firewall)

Description: Firewall

### <a name="output_firewall_application_rule_collection"></a> [firewall\_application\_rule\_collection](#output\_firewall\_application\_rule\_collection)

Description: Firewall Application Rule Collection

### <a name="output_firewall_ip_configuration"></a> [firewall\_ip\_configuration](#output\_firewall\_ip\_configuration)

Description: Firewall Ip Configuration

### <a name="output_firewall_nat_rule_collection"></a> [firewall\_nat\_rule\_collection](#output\_firewall\_nat\_rule\_collection)

Description: Firewall Nat Rule Collection

### <a name="output_firewall_network_rule_collection"></a> [firewall\_network\_rule\_collection](#output\_firewall\_network\_rule\_collection)

Description: Firewall Network Rule Collection

### <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy)

Description: Firewall Policy

### <a name="output_firewall_policy_rule_collection_group"></a> [firewall\_policy\_rule\_collection\_group](#output\_firewall\_policy\_rule\_collection\_group)

Description: Firewall Policy Rule Collection Group

### <a name="output_frontdoor"></a> [frontdoor](#output\_frontdoor)

Description: Frontdoor

### <a name="output_frontdoor_firewall_policy"></a> [frontdoor\_firewall\_policy](#output\_frontdoor\_firewall\_policy)

Description: Frontdoor Firewall Policy

### <a name="output_function_app"></a> [function\_app](#output\_function\_app)

Description: Function App

### <a name="output_function_app_slot"></a> [function\_app\_slot](#output\_function\_app\_slot)

Description: Function App Slot

### <a name="output_hdinsight_hadoop_cluster"></a> [hdinsight\_hadoop\_cluster](#output\_hdinsight\_hadoop\_cluster)

Description: Hdinsight Hadoop Cluster

### <a name="output_hdinsight_hbase_cluster"></a> [hdinsight\_hbase\_cluster](#output\_hdinsight\_hbase\_cluster)

Description: Hdinsight Hbase Cluster

### <a name="output_hdinsight_interactive_query_cluster"></a> [hdinsight\_interactive\_query\_cluster](#output\_hdinsight\_interactive\_query\_cluster)

Description: Hdinsight Interactive Query Cluster

### <a name="output_hdinsight_kafka_cluster"></a> [hdinsight\_kafka\_cluster](#output\_hdinsight\_kafka\_cluster)

Description: Hdinsight Kafka Cluster

### <a name="output_hdinsight_ml_services_cluster"></a> [hdinsight\_ml\_services\_cluster](#output\_hdinsight\_ml\_services\_cluster)

Description: Hdinsight Ml Services Cluster

### <a name="output_hdinsight_rserver_cluster"></a> [hdinsight\_rserver\_cluster](#output\_hdinsight\_rserver\_cluster)

Description: Hdinsight Rserver Cluster

### <a name="output_hdinsight_spark_cluster"></a> [hdinsight\_spark\_cluster](#output\_hdinsight\_spark\_cluster)

Description: Hdinsight Spark Cluster

### <a name="output_hdinsight_storm_cluster"></a> [hdinsight\_storm\_cluster](#output\_hdinsight\_storm\_cluster)

Description: Hdinsight Storm Cluster

### <a name="output_healthcare_dicom_service"></a> [healthcare\_dicom\_service](#output\_healthcare\_dicom\_service)

Description: Healthcare Dicom Service

### <a name="output_healthcare_fhir_service"></a> [healthcare\_fhir\_service](#output\_healthcare\_fhir\_service)

Description: Healthcare Fhir Service

### <a name="output_healthcare_medtech_service"></a> [healthcare\_medtech\_service](#output\_healthcare\_medtech\_service)

Description: Healthcare Medtech Service

### <a name="output_healthcare_service"></a> [healthcare\_service](#output\_healthcare\_service)

Description: Healthcare Service

### <a name="output_healthcare_workspace"></a> [healthcare\_workspace](#output\_healthcare\_workspace)

Description: Healthcare Workspace

### <a name="output_image"></a> [image](#output\_image)

Description: Image

### <a name="output_integration_service_environment"></a> [integration\_service\_environment](#output\_integration\_service\_environment)

Description: Integration Service Environment

### <a name="output_iot_security_device_group"></a> [iot\_security\_device\_group](#output\_iot\_security\_device\_group)

Description: Iot Security Device Group

### <a name="output_iot_security_solution"></a> [iot\_security\_solution](#output\_iot\_security\_solution)

Description: Iot Security Solution

### <a name="output_iotcentral_application"></a> [iotcentral\_application](#output\_iotcentral\_application)

Description: Iotcentral Application

### <a name="output_iothub"></a> [iothub](#output\_iothub)

Description: Iothub

### <a name="output_iothub_consumer_group"></a> [iothub\_consumer\_group](#output\_iothub\_consumer\_group)

Description: Iothub Consumer Group

### <a name="output_iothub_dps"></a> [iothub\_dps](#output\_iothub\_dps)

Description: Iothub Dps

### <a name="output_iothub_dps_certificate"></a> [iothub\_dps\_certificate](#output\_iothub\_dps\_certificate)

Description: Iothub Dps Certificate

### <a name="output_ip_group"></a> [ip\_group](#output\_ip\_group)

Description: Ip Group

### <a name="output_key_vault"></a> [key\_vault](#output\_key\_vault)

Description: Key Vault

### <a name="output_key_vault_certificate"></a> [key\_vault\_certificate](#output\_key\_vault\_certificate)

Description: Key Vault Certificate

### <a name="output_key_vault_key"></a> [key\_vault\_key](#output\_key\_vault\_key)

Description: Key Vault Key

### <a name="output_key_vault_secret"></a> [key\_vault\_secret](#output\_key\_vault\_secret)

Description: Key Vault Secret

### <a name="output_kubernetes_cluster"></a> [kubernetes\_cluster](#output\_kubernetes\_cluster)

Description: Kubernetes Cluster

### <a name="output_kubernetes_fleet_manager"></a> [kubernetes\_fleet\_manager](#output\_kubernetes\_fleet\_manager)

Description: Kubernetes Fleet Manager

### <a name="output_kusto_cluster"></a> [kusto\_cluster](#output\_kusto\_cluster)

Description: Kusto Cluster

### <a name="output_kusto_database"></a> [kusto\_database](#output\_kusto\_database)

Description: Kusto Database

### <a name="output_kusto_eventhub_data_connection"></a> [kusto\_eventhub\_data\_connection](#output\_kusto\_eventhub\_data\_connection)

Description: Kusto Eventhub Data Connection

### <a name="output_lb"></a> [lb](#output\_lb)

Description: Lb

### <a name="output_lb_backend_address_pool"></a> [lb\_backend\_address\_pool](#output\_lb\_backend\_address\_pool)

Description: Lb Backend Address Pool

### <a name="output_lb_backend_pool"></a> [lb\_backend\_pool](#output\_lb\_backend\_pool)

Description: Lb Backend Pool

### <a name="output_lb_nat_pool"></a> [lb\_nat\_pool](#output\_lb\_nat\_pool)

Description: Lb Nat Pool

### <a name="output_lb_nat_rule"></a> [lb\_nat\_rule](#output\_lb\_nat\_rule)

Description: Lb Nat Rule

### <a name="output_lb_outbound_rule"></a> [lb\_outbound\_rule](#output\_lb\_outbound\_rule)

Description: Lb Outbound Rule

### <a name="output_lb_probe"></a> [lb\_probe](#output\_lb\_probe)

Description: Lb Probe

### <a name="output_lb_rule"></a> [lb\_rule](#output\_lb\_rule)

Description: Lb Rule

### <a name="output_linux_virtual_machine"></a> [linux\_virtual\_machine](#output\_linux\_virtual\_machine)

Description: Linux Virtual Machine

### <a name="output_linux_virtual_machine_scale_set"></a> [linux\_virtual\_machine\_scale\_set](#output\_linux\_virtual\_machine\_scale\_set)

Description: Linux Virtual Machine Scale Set

### <a name="output_load_test"></a> [load\_test](#output\_load\_test)

Description: Load Test

### <a name="output_local_network_gateway"></a> [local\_network\_gateway](#output\_local\_network\_gateway)

Description: Local Network Gateway

### <a name="output_log_analytics_cluster"></a> [log\_analytics\_cluster](#output\_log\_analytics\_cluster)

Description: Log Analytics Cluster

### <a name="output_log_analytics_storage_insights"></a> [log\_analytics\_storage\_insights](#output\_log\_analytics\_storage\_insights)

Description: Log Analytics Storage Insights

### <a name="output_log_analytics_workspace"></a> [log\_analytics\_workspace](#output\_log\_analytics\_workspace)

Description: Log Analytics Workspace

### <a name="output_logic_app_action_custom"></a> [logic\_app\_action\_custom](#output\_logic\_app\_action\_custom)

Description: Logic App Action Custom

### <a name="output_logic_app_action_http"></a> [logic\_app\_action\_http](#output\_logic\_app\_action\_http)

Description: Logic App Action Http

### <a name="output_logic_app_integration_account"></a> [logic\_app\_integration\_account](#output\_logic\_app\_integration\_account)

Description: Logic App Integration Account

### <a name="output_logic_app_trigger_custom"></a> [logic\_app\_trigger\_custom](#output\_logic\_app\_trigger\_custom)

Description: Logic App Trigger Custom

### <a name="output_logic_app_trigger_http_request"></a> [logic\_app\_trigger\_http\_request](#output\_logic\_app\_trigger\_http\_request)

Description: Logic App Trigger Http Request

### <a name="output_logic_app_trigger_recurrence"></a> [logic\_app\_trigger\_recurrence](#output\_logic\_app\_trigger\_recurrence)

Description: Logic App Trigger Recurrence

### <a name="output_logic_app_workflow"></a> [logic\_app\_workflow](#output\_logic\_app\_workflow)

Description: Logic App Workflow

### <a name="output_machine_learning_compute_instance"></a> [machine\_learning\_compute\_instance](#output\_machine\_learning\_compute\_instance)

Description: Machine Learning Compute Instance

### <a name="output_machine_learning_workspace"></a> [machine\_learning\_workspace](#output\_machine\_learning\_workspace)

Description: Machine Learning Workspace

### <a name="output_maintenance_configuration"></a> [maintenance\_configuration](#output\_maintenance\_configuration)

Description: Maintenance Configuration

### <a name="output_managed_disk"></a> [managed\_disk](#output\_managed\_disk)

Description: Managed Disk

### <a name="output_maps_account"></a> [maps\_account](#output\_maps\_account)

Description: Maps Account

### <a name="output_mariadb_database"></a> [mariadb\_database](#output\_mariadb\_database)

Description: Mariadb Database

### <a name="output_mariadb_firewall_rule"></a> [mariadb\_firewall\_rule](#output\_mariadb\_firewall\_rule)

Description: Mariadb Firewall Rule

### <a name="output_mariadb_server"></a> [mariadb\_server](#output\_mariadb\_server)

Description: Mariadb Server

### <a name="output_mariadb_virtual_network_rule"></a> [mariadb\_virtual\_network\_rule](#output\_mariadb\_virtual\_network\_rule)

Description: Mariadb Virtual Network Rule

### <a name="output_monitor_action_group"></a> [monitor\_action\_group](#output\_monitor\_action\_group)

Description: Monitor Action Group

### <a name="output_monitor_autoscale_setting"></a> [monitor\_autoscale\_setting](#output\_monitor\_autoscale\_setting)

Description: Monitor Autoscale Setting

### <a name="output_monitor_data_collection_endpoint"></a> [monitor\_data\_collection\_endpoint](#output\_monitor\_data\_collection\_endpoint)

Description: Monitor Data Collection Endpoint

### <a name="output_monitor_diagnostic_setting"></a> [monitor\_diagnostic\_setting](#output\_monitor\_diagnostic\_setting)

Description: Monitor Diagnostic Setting

### <a name="output_monitor_private_link_scope"></a> [monitor\_private\_link\_scope](#output\_monitor\_private\_link\_scope)

Description: Monitor Private Link Scope

### <a name="output_monitor_scheduled_query_rules_alert"></a> [monitor\_scheduled\_query\_rules\_alert](#output\_monitor\_scheduled\_query\_rules\_alert)

Description: Monitor Scheduled Query Rules Alert

### <a name="output_mssql_database"></a> [mssql\_database](#output\_mssql\_database)

Description: Mssql Database

### <a name="output_mssql_elasticpool"></a> [mssql\_elasticpool](#output\_mssql\_elasticpool)

Description: Mssql Elasticpool

### <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server)

Description: Mssql Server

### <a name="output_mysql_database"></a> [mysql\_database](#output\_mysql\_database)

Description: Mysql Database

### <a name="output_mysql_firewall_rule"></a> [mysql\_firewall\_rule](#output\_mysql\_firewall\_rule)

Description: Mysql Firewall Rule

### <a name="output_mysql_flexible_server"></a> [mysql\_flexible\_server](#output\_mysql\_flexible\_server)

Description: Mysql Flexible Server

### <a name="output_mysql_flexible_server_database"></a> [mysql\_flexible\_server\_database](#output\_mysql\_flexible\_server\_database)

Description: Mysql Flexible Server Database

### <a name="output_mysql_flexible_server_firewall_rule"></a> [mysql\_flexible\_server\_firewall\_rule](#output\_mysql\_flexible\_server\_firewall\_rule)

Description: Mysql Flexible Server Firewall Rule

### <a name="output_mysql_server"></a> [mysql\_server](#output\_mysql\_server)

Description: Mysql Server

### <a name="output_mysql_virtual_network_rule"></a> [mysql\_virtual\_network\_rule](#output\_mysql\_virtual\_network\_rule)

Description: Mysql Virtual Network Rule

### <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway)

Description: Nat Gateway

### <a name="output_netapp_account"></a> [netapp\_account](#output\_netapp\_account)

Description: Netapp Account

### <a name="output_netapp_pool"></a> [netapp\_pool](#output\_netapp\_pool)

Description: Netapp Pool

### <a name="output_netapp_snapshot"></a> [netapp\_snapshot](#output\_netapp\_snapshot)

Description: Netapp Snapshot

### <a name="output_netapp_volume"></a> [netapp\_volume](#output\_netapp\_volume)

Description: Netapp Volume

### <a name="output_network_ddos_protection_plan"></a> [network\_ddos\_protection\_plan](#output\_network\_ddos\_protection\_plan)

Description: Network Ddos Protection Plan

### <a name="output_network_interface"></a> [network\_interface](#output\_network\_interface)

Description: Network Interface

### <a name="output_network_security_group"></a> [network\_security\_group](#output\_network\_security\_group)

Description: Network Security Group

### <a name="output_network_security_group_rule"></a> [network\_security\_group\_rule](#output\_network\_security\_group\_rule)

Description: Network Security Group Rule

### <a name="output_network_security_rule"></a> [network\_security\_rule](#output\_network\_security\_rule)

Description: Network Security Rule

### <a name="output_network_watcher"></a> [network\_watcher](#output\_network\_watcher)

Description: Network Watcher

### <a name="output_network_watcher_flow_log"></a> [network\_watcher\_flow\_log](#output\_network\_watcher\_flow\_log)

Description: Network Watcher Flow Log

### <a name="output_nginx_deployment"></a> [nginx\_deployment](#output\_nginx\_deployment)

Description: Nginx Deployment

### <a name="output_notification_hub"></a> [notification\_hub](#output\_notification\_hub)

Description: Notification Hub

### <a name="output_notification_hub_authorization_rule"></a> [notification\_hub\_authorization\_rule](#output\_notification\_hub\_authorization\_rule)

Description: Notification Hub Authorization Rule

### <a name="output_notification_hub_namespace"></a> [notification\_hub\_namespace](#output\_notification\_hub\_namespace)

Description: Notification Hub Namespace

### <a name="output_point_to_site_vpn_gateway"></a> [point\_to\_site\_vpn\_gateway](#output\_point\_to\_site\_vpn\_gateway)

Description: Point To Site Vpn Gateway

### <a name="output_portal_dashboard"></a> [portal\_dashboard](#output\_portal\_dashboard)

Description: Portal Dashboard

### <a name="output_postgresql_database"></a> [postgresql\_database](#output\_postgresql\_database)

Description: Postgresql Database

### <a name="output_postgresql_firewall_rule"></a> [postgresql\_firewall\_rule](#output\_postgresql\_firewall\_rule)

Description: Postgresql Firewall Rule

### <a name="output_postgresql_flexible_server"></a> [postgresql\_flexible\_server](#output\_postgresql\_flexible\_server)

Description: Postgresql Flexible Server

### <a name="output_postgresql_flexible_server_database"></a> [postgresql\_flexible\_server\_database](#output\_postgresql\_flexible\_server\_database)

Description: Postgresql Flexible Server Database

### <a name="output_postgresql_flexible_server_firewall_rule"></a> [postgresql\_flexible\_server\_firewall\_rule](#output\_postgresql\_flexible\_server\_firewall\_rule)

Description: Postgresql Flexible Server Firewall Rule

### <a name="output_postgresql_server"></a> [postgresql\_server](#output\_postgresql\_server)

Description: Postgresql Server

### <a name="output_postgresql_virtual_network_rule"></a> [postgresql\_virtual\_network\_rule](#output\_postgresql\_virtual\_network\_rule)

Description: Postgresql Virtual Network Rule

### <a name="output_powerbi_embedded"></a> [powerbi\_embedded](#output\_powerbi\_embedded)

Description: Powerbi Embedded

### <a name="output_private_dns_a_record"></a> [private\_dns\_a\_record](#output\_private\_dns\_a\_record)

Description: Private Dns A Record

### <a name="output_private_dns_aaaa_record"></a> [private\_dns\_aaaa\_record](#output\_private\_dns\_aaaa\_record)

Description: Private Dns Aaaa Record

### <a name="output_private_dns_cname_record"></a> [private\_dns\_cname\_record](#output\_private\_dns\_cname\_record)

Description: Private Dns Cname Record

### <a name="output_private_dns_mx_record"></a> [private\_dns\_mx\_record](#output\_private\_dns\_mx\_record)

Description: Private Dns Mx Record

### <a name="output_private_dns_ptr_record"></a> [private\_dns\_ptr\_record](#output\_private\_dns\_ptr\_record)

Description: Private Dns Ptr Record

### <a name="output_private_dns_resolver"></a> [private\_dns\_resolver](#output\_private\_dns\_resolver)

Description: Private Dns Resolver

### <a name="output_private_dns_resolver_dns_forwarding_ruleset"></a> [private\_dns\_resolver\_dns\_forwarding\_ruleset](#output\_private\_dns\_resolver\_dns\_forwarding\_ruleset)

Description: Private Dns Resolver Dns Forwarding Ruleset

### <a name="output_private_dns_resolver_forwarding_rule"></a> [private\_dns\_resolver\_forwarding\_rule](#output\_private\_dns\_resolver\_forwarding\_rule)

Description: Private Dns Resolver Forwarding Rule

### <a name="output_private_dns_resolver_inbound_endpoint"></a> [private\_dns\_resolver\_inbound\_endpoint](#output\_private\_dns\_resolver\_inbound\_endpoint)

Description: Private Dns Resolver Inbound Endpoint

### <a name="output_private_dns_resolver_outbound_endpoint"></a> [private\_dns\_resolver\_outbound\_endpoint](#output\_private\_dns\_resolver\_outbound\_endpoint)

Description: Private Dns Resolver Outbound Endpoint

### <a name="output_private_dns_resolver_virtual_network_link"></a> [private\_dns\_resolver\_virtual\_network\_link](#output\_private\_dns\_resolver\_virtual\_network\_link)

Description: Private Dns Resolver Virtual Network Link

### <a name="output_private_dns_srv_record"></a> [private\_dns\_srv\_record](#output\_private\_dns\_srv\_record)

Description: Private Dns Srv Record

### <a name="output_private_dns_txt_record"></a> [private\_dns\_txt\_record](#output\_private\_dns\_txt\_record)

Description: Private Dns Txt Record

### <a name="output_private_dns_zone"></a> [private\_dns\_zone](#output\_private\_dns\_zone)

Description: Private Dns Zone

### <a name="output_private_dns_zone_group"></a> [private\_dns\_zone\_group](#output\_private\_dns\_zone\_group)

Description: Private Dns Zone Group

### <a name="output_private_endpoint"></a> [private\_endpoint](#output\_private\_endpoint)

Description: Private Endpoint

### <a name="output_private_link_service"></a> [private\_link\_service](#output\_private\_link\_service)

Description: Private Link Service

### <a name="output_private_service_connection"></a> [private\_service\_connection](#output\_private\_service\_connection)

Description: Private Service Connection

### <a name="output_proximity_placement_group"></a> [proximity\_placement\_group](#output\_proximity\_placement\_group)

Description: Proximity Placement Group

### <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip)

Description: Public Ip

### <a name="output_public_ip_prefix"></a> [public\_ip\_prefix](#output\_public\_ip\_prefix)

Description: Public Ip Prefix

### <a name="output_purview_account"></a> [purview\_account](#output\_purview\_account)

Description: Purview Account

### <a name="output_recovery_services_vault"></a> [recovery\_services\_vault](#output\_recovery\_services\_vault)

Description: Recovery Services Vault

### <a name="output_recovery_services_vault_backup_policy"></a> [recovery\_services\_vault\_backup\_policy](#output\_recovery\_services\_vault\_backup\_policy)

Description: Recovery Services Vault Backup Policy

### <a name="output_redhat_openshift_cluster"></a> [redhat\_openshift\_cluster](#output\_redhat\_openshift\_cluster)

Description: Redhat Openshift Cluster

### <a name="output_redhat_openshift_domain"></a> [redhat\_openshift\_domain](#output\_redhat\_openshift\_domain)

Description: Redhat Openshift Domain

### <a name="output_redis_cache"></a> [redis\_cache](#output\_redis\_cache)

Description: Redis Cache

### <a name="output_redis_firewall_rule"></a> [redis\_firewall\_rule](#output\_redis\_firewall\_rule)

Description: Redis Firewall Rule

### <a name="output_relay_hybrid_connection"></a> [relay\_hybrid\_connection](#output\_relay\_hybrid\_connection)

Description: Relay Hybrid Connection

### <a name="output_relay_namespace"></a> [relay\_namespace](#output\_relay\_namespace)

Description: Relay Namespace

### <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group)

Description: Resource Group

### <a name="output_resource_group_policy_assignment"></a> [resource\_group\_policy\_assignment](#output\_resource\_group\_policy\_assignment)

Description: Resource Group Policy Assignment

### <a name="output_role_assignment"></a> [role\_assignment](#output\_role\_assignment)

Description: Role Assignment

### <a name="output_role_definition"></a> [role\_definition](#output\_role\_definition)

Description: Role Definition

### <a name="output_route"></a> [route](#output\_route)

Description: Route

### <a name="output_route_table"></a> [route\_table](#output\_route\_table)

Description: Route Table

### <a name="output_search_service"></a> [search\_service](#output\_search\_service)

Description: Search Service

### <a name="output_service_fabric_cluster"></a> [service\_fabric\_cluster](#output\_service\_fabric\_cluster)

Description: Service Fabric Cluster

### <a name="output_servicebus_namespace"></a> [servicebus\_namespace](#output\_servicebus\_namespace)

Description: Servicebus Namespace

### <a name="output_servicebus_namespace_authorization_rule"></a> [servicebus\_namespace\_authorization\_rule](#output\_servicebus\_namespace\_authorization\_rule)

Description: Servicebus Namespace Authorization Rule

### <a name="output_servicebus_queue"></a> [servicebus\_queue](#output\_servicebus\_queue)

Description: Servicebus Queue

### <a name="output_servicebus_queue_authorization_rule"></a> [servicebus\_queue\_authorization\_rule](#output\_servicebus\_queue\_authorization\_rule)

Description: Servicebus Queue Authorization Rule

### <a name="output_servicebus_subscription"></a> [servicebus\_subscription](#output\_servicebus\_subscription)

Description: Servicebus Subscription

### <a name="output_servicebus_subscription_rule"></a> [servicebus\_subscription\_rule](#output\_servicebus\_subscription\_rule)

Description: Servicebus Subscription Rule

### <a name="output_servicebus_topic"></a> [servicebus\_topic](#output\_servicebus\_topic)

Description: Servicebus Topic

### <a name="output_servicebus_topic_authorization_rule"></a> [servicebus\_topic\_authorization\_rule](#output\_servicebus\_topic\_authorization\_rule)

Description: Servicebus Topic Authorization Rule

### <a name="output_shared_image"></a> [shared\_image](#output\_shared\_image)

Description: Shared Image

### <a name="output_shared_image_gallery"></a> [shared\_image\_gallery](#output\_shared\_image\_gallery)

Description: Shared Image Gallery

### <a name="output_signalr_service"></a> [signalr\_service](#output\_signalr\_service)

Description: Signalr Service

### <a name="output_snapshots"></a> [snapshots](#output\_snapshots)

Description: Snapshots

### <a name="output_sql_elasticpool"></a> [sql\_elasticpool](#output\_sql\_elasticpool)

Description: Sql Elasticpool

### <a name="output_sql_failover_group"></a> [sql\_failover\_group](#output\_sql\_failover\_group)

Description: Sql Failover Group

### <a name="output_sql_firewall_rule"></a> [sql\_firewall\_rule](#output\_sql\_firewall\_rule)

Description: Sql Firewall Rule

### <a name="output_sql_managed_instance"></a> [sql\_managed\_instance](#output\_sql\_managed\_instance)

Description: Sql Managed Instance

### <a name="output_sql_server"></a> [sql\_server](#output\_sql\_server)

Description: Sql Server

### <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account)

Description: Storage Account

### <a name="output_storage_blob"></a> [storage\_blob](#output\_storage\_blob)

Description: Storage Blob

### <a name="output_storage_container"></a> [storage\_container](#output\_storage\_container)

Description: Storage Container

### <a name="output_storage_data_lake_gen2_filesystem"></a> [storage\_data\_lake\_gen2\_filesystem](#output\_storage\_data\_lake\_gen2\_filesystem)

Description: Storage Data Lake Gen2 Filesystem

### <a name="output_storage_queue"></a> [storage\_queue](#output\_storage\_queue)

Description: Storage Queue

### <a name="output_storage_share"></a> [storage\_share](#output\_storage\_share)

Description: Storage Share

### <a name="output_storage_share_directory"></a> [storage\_share\_directory](#output\_storage\_share\_directory)

Description: Storage Share Directory

### <a name="output_storage_sync"></a> [storage\_sync](#output\_storage\_sync)

Description: Storage Sync

### <a name="output_storage_sync_group"></a> [storage\_sync\_group](#output\_storage\_sync\_group)

Description: Storage Sync Group

### <a name="output_storage_table"></a> [storage\_table](#output\_storage\_table)

Description: Storage Table

### <a name="output_stream_analytics_function_javascript_udf"></a> [stream\_analytics\_function\_javascript\_udf](#output\_stream\_analytics\_function\_javascript\_udf)

Description: Stream Analytics Function Javascript Udf

### <a name="output_stream_analytics_job"></a> [stream\_analytics\_job](#output\_stream\_analytics\_job)

Description: Stream Analytics Job

### <a name="output_stream_analytics_output_blob"></a> [stream\_analytics\_output\_blob](#output\_stream\_analytics\_output\_blob)

Description: Stream Analytics Output Blob

### <a name="output_stream_analytics_output_eventhub"></a> [stream\_analytics\_output\_eventhub](#output\_stream\_analytics\_output\_eventhub)

Description: Stream Analytics Output Eventhub

### <a name="output_stream_analytics_output_mssql"></a> [stream\_analytics\_output\_mssql](#output\_stream\_analytics\_output\_mssql)

Description: Stream Analytics Output Mssql

### <a name="output_stream_analytics_output_servicebus_queue"></a> [stream\_analytics\_output\_servicebus\_queue](#output\_stream\_analytics\_output\_servicebus\_queue)

Description: Stream Analytics Output Servicebus Queue

### <a name="output_stream_analytics_output_servicebus_topic"></a> [stream\_analytics\_output\_servicebus\_topic](#output\_stream\_analytics\_output\_servicebus\_topic)

Description: Stream Analytics Output Servicebus Topic

### <a name="output_stream_analytics_reference_input_blob"></a> [stream\_analytics\_reference\_input\_blob](#output\_stream\_analytics\_reference\_input\_blob)

Description: Stream Analytics Reference Input Blob

### <a name="output_stream_analytics_stream_input_blob"></a> [stream\_analytics\_stream\_input\_blob](#output\_stream\_analytics\_stream\_input\_blob)

Description: Stream Analytics Stream Input Blob

### <a name="output_stream_analytics_stream_input_eventhub"></a> [stream\_analytics\_stream\_input\_eventhub](#output\_stream\_analytics\_stream\_input\_eventhub)

Description: Stream Analytics Stream Input Eventhub

### <a name="output_stream_analytics_stream_input_iothub"></a> [stream\_analytics\_stream\_input\_iothub](#output\_stream\_analytics\_stream\_input\_iothub)

Description: Stream Analytics Stream Input Iothub

### <a name="output_subnet"></a> [subnet](#output\_subnet)

Description: Subnet

### <a name="output_subscription_policy_assignment"></a> [subscription\_policy\_assignment](#output\_subscription\_policy\_assignment)

Description: Subscription Policy Assignment

### <a name="output_synapse_firewall_rule"></a> [synapse\_firewall\_rule](#output\_synapse\_firewall\_rule)

Description: Synapse Firewall Rule

### <a name="output_synapse_integration_runtime_azure"></a> [synapse\_integration\_runtime\_azure](#output\_synapse\_integration\_runtime\_azure)

Description: Synapse Integration Runtime Azure

### <a name="output_synapse_integration_runtime_self_hosted"></a> [synapse\_integration\_runtime\_self\_hosted](#output\_synapse\_integration\_runtime\_self\_hosted)

Description: Synapse Integration Runtime Self Hosted

### <a name="output_synapse_linked_service"></a> [synapse\_linked\_service](#output\_synapse\_linked\_service)

Description: Synapse Linked Service

### <a name="output_synapse_managed_private_endpoint"></a> [synapse\_managed\_private\_endpoint](#output\_synapse\_managed\_private\_endpoint)

Description: Synapse Managed Private Endpoint

### <a name="output_synapse_private_link_hub"></a> [synapse\_private\_link\_hub](#output\_synapse\_private\_link\_hub)

Description: Synapse Private Link Hub

### <a name="output_synapse_spark_pool"></a> [synapse\_spark\_pool](#output\_synapse\_spark\_pool)

Description: Synapse Spark Pool

### <a name="output_synapse_sql_pool"></a> [synapse\_sql\_pool](#output\_synapse\_sql\_pool)

Description: Synapse Sql Pool

### <a name="output_synapse_sql_pool_vulnerability_assessment_baseline"></a> [synapse\_sql\_pool\_vulnerability\_assessment\_baseline](#output\_synapse\_sql\_pool\_vulnerability\_assessment\_baseline)

Description: Synapse Sql Pool Vulnerability Assessment Baseline

### <a name="output_synapse_sql_pool_workload_classifier"></a> [synapse\_sql\_pool\_workload\_classifier](#output\_synapse\_sql\_pool\_workload\_classifier)

Description: Synapse Sql Pool Workload Classifier

### <a name="output_synapse_sql_pool_workload_group"></a> [synapse\_sql\_pool\_workload\_group](#output\_synapse\_sql\_pool\_workload\_group)

Description: Synapse Sql Pool Workload Group

### <a name="output_synapse_workspace"></a> [synapse\_workspace](#output\_synapse\_workspace)

Description: Synapse Workspace

### <a name="output_template_deployment"></a> [template\_deployment](#output\_template\_deployment)

Description: Template Deployment

### <a name="output_traffic_manager_profile"></a> [traffic\_manager\_profile](#output\_traffic\_manager\_profile)

Description: Traffic Manager Profile

### <a name="output_unique-seed"></a> [unique-seed](#output\_unique-seed)

Description: n/a

### <a name="output_user_assigned_identity"></a> [user\_assigned\_identity](#output\_user\_assigned\_identity)

Description: User Assigned Identity

### <a name="output_validation"></a> [validation](#output\_validation)

Description: n/a

### <a name="output_virtual_desktop_application_group"></a> [virtual\_desktop\_application\_group](#output\_virtual\_desktop\_application\_group)

Description: Virtual Desktop Application Group

### <a name="output_virtual_desktop_host_pool"></a> [virtual\_desktop\_host\_pool](#output\_virtual\_desktop\_host\_pool)

Description: Virtual Desktop Host Pool

### <a name="output_virtual_desktop_workspace"></a> [virtual\_desktop\_workspace](#output\_virtual\_desktop\_workspace)

Description: Virtual Desktop Workspace

### <a name="output_virtual_hub"></a> [virtual\_hub](#output\_virtual\_hub)

Description: Virtual Hub

### <a name="output_virtual_hub_connection"></a> [virtual\_hub\_connection](#output\_virtual\_hub\_connection)

Description: Virtual Hub Connection

### <a name="output_virtual_machine"></a> [virtual\_machine](#output\_virtual\_machine)

Description: Virtual Machine

### <a name="output_virtual_machine_extension"></a> [virtual\_machine\_extension](#output\_virtual\_machine\_extension)

Description: Virtual Machine Extension

### <a name="output_virtual_machine_scale_set"></a> [virtual\_machine\_scale\_set](#output\_virtual\_machine\_scale\_set)

Description: Virtual Machine Scale Set

### <a name="output_virtual_machine_scale_set_extension"></a> [virtual\_machine\_scale\_set\_extension](#output\_virtual\_machine\_scale\_set\_extension)

Description: Virtual Machine Scale Set Extension

### <a name="output_virtual_network"></a> [virtual\_network](#output\_virtual\_network)

Description: Virtual Network

### <a name="output_virtual_network_gateway"></a> [virtual\_network\_gateway](#output\_virtual\_network\_gateway)

Description: Virtual Network Gateway

### <a name="output_virtual_network_gateway_connection"></a> [virtual\_network\_gateway\_connection](#output\_virtual\_network\_gateway\_connection)

Description: Virtual Network Gateway Connection

### <a name="output_virtual_network_peering"></a> [virtual\_network\_peering](#output\_virtual\_network\_peering)

Description: Virtual Network Manager

### <a name="output_virtual_network_manager"></a> [virtual\_network\_manager](#output\_virtual\_network\_manager) | Virtual Network Manager |

Description: Virtual Network Peering

### <a name="output_virtual_wan"></a> [virtual\_wan](#output\_virtual\_wan)

Description: Virtual Wan

### <a name="output_vpn_gateway"></a> [vpn\_gateway](#output\_vpn\_gateway)

Description: Vpn Gateway

### <a name="output_vpn_gateway_connection"></a> [vpn\_gateway\_connection](#output\_vpn\_gateway\_connection)

Description: Vpn Gateway Connection

### <a name="output_vpn_site"></a> [vpn\_site](#output\_vpn\_site)

Description: Vpn Site

### <a name="output_web_application_firewall_policy"></a> [web\_application\_firewall\_policy](#output\_web\_application\_firewall\_policy)

Description: Web Application Firewall Policy

### <a name="output_web_pubsub"></a> [web\_pubsub](#output\_web\_pubsub)

Description: Web Pubsub

### <a name="output_web_pubsub_hub"></a> [web\_pubsub\_hub](#output\_web\_pubsub\_hub)

Description: Web Pubsub Hub

### <a name="output_windows_virtual_machine"></a> [windows\_virtual\_machine](#output\_windows\_virtual\_machine)

Description: Windows Virtual Machine

### <a name="output_windows_virtual_machine_scale_set"></a> [windows\_virtual\_machine\_scale\_set](#output\_windows\_virtual\_machine\_scale\_set)

Description: Windows Virtual Machine Scale Set
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-naming/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-naming" />
</a>

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
