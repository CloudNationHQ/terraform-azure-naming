
output "unique-seed" {
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  value = local.validation
}
output "aadb2c_directory" {
  value       = local.az.aadb2c_directory
  description = "Aadb2c Directory"
}

output "aks_node_pool_linux" {
  value       = local.az.aks_node_pool_linux
  description = "Aks Node Pool Linux"
}

output "aks_node_pool_windows" {
  value       = local.az.aks_node_pool_windows
  description = "Aks Node Pool Windows"
}

output "analysis_services_server" {
  value       = local.az.analysis_services_server
  description = "Analysis Services Server"
}

output "api_management" {
  value       = local.az.api_management
  description = "Api Management"
}

output "api_management_api" {
  value       = local.az.api_management_api
  description = "Api Management Api"
}

output "api_management_api_operation_tag" {
  value       = local.az.api_management_api_operation_tag
  description = "Api Management Api Operation Tag"
}

output "api_management_backend" {
  value       = local.az.api_management_backend
  description = "Api Management Backend"
}

output "api_management_certificate" {
  value       = local.az.api_management_certificate
  description = "Api Management Certificate"
}

output "api_management_gateway" {
  value       = local.az.api_management_gateway
  description = "Api Management Gateway"
}

output "api_management_group" {
  value       = local.az.api_management_group
  description = "Api Management Group"
}

output "api_management_logger" {
  value       = local.az.api_management_logger
  description = "Api Management Logger"
}

output "app_configuration" {
  value       = local.az.app_configuration
  description = "App Configuration"
}

output "app_service" {
  value       = local.az.app_service
  description = "App Service"
}

output "app_service_environment" {
  value       = local.az.app_service_environment
  description = "App Service Environment"
}

output "app_service_plan" {
  value       = local.az.app_service_plan
  description = "App Service Plan"
}

output "application_gateway" {
  value       = local.az.application_gateway
  description = "Application Gateway"
}

output "application_insights" {
  value       = local.az.application_insights
  description = "Application Insights"
}

output "application_insights_web_test" {
  value       = local.az.application_insights_web_test
  description = "Application Insights Web Test"
}

output "application_security_group" {
  value       = local.az.application_security_group
  description = "Application Security Group"
}

output "automation_account" {
  value       = local.az.automation_account
  description = "Automation Account"
}

output "automation_certificate" {
  value       = local.az.automation_certificate
  description = "Automation Certificate"
}

output "automation_credential" {
  value       = local.az.automation_credential
  description = "Automation Credential"
}

output "automation_job_schedule" {
  value       = local.az.automation_job_schedule
  description = "Automation Job Schedule"
}

output "automation_runbook" {
  value       = local.az.automation_runbook
  description = "Automation Runbook"
}

output "automation_schedule" {
  value       = local.az.automation_schedule
  description = "Automation Schedule"
}

output "automation_variable" {
  value       = local.az.automation_variable
  description = "Automation Variable"
}

output "availability_set" {
  value       = local.az.availability_set
  description = "Availability Set"
}

output "bastion_host" {
  value       = local.az.bastion_host
  description = "Bastion Host"
}

output "batch_account" {
  value       = local.az.batch_account
  description = "Batch Account"
}

output "batch_application" {
  value       = local.az.batch_application
  description = "Batch Application"
}

output "batch_certificate" {
  value       = local.az.batch_certificate
  description = "Batch Certificate"
}

output "batch_pool" {
  value       = local.az.batch_pool
  description = "Batch Pool"
}

output "bot_channel_directline" {
  value       = local.az.bot_channel_directline
  description = "Bot Channel Directline"
}

output "bot_channel_email" {
  value       = local.az.bot_channel_email
  description = "Bot Channel Email"
}

output "bot_channel_ms_teams" {
  value       = local.az.bot_channel_ms_teams
  description = "Bot Channel Ms Teams"
}

output "bot_channel_slack" {
  value       = local.az.bot_channel_slack
  description = "Bot Channel Slack"
}

output "bot_channels_registration" {
  value       = local.az.bot_channels_registration
  description = "Bot Channels Registration"
}

output "bot_connection" {
  value       = local.az.bot_connection
  description = "Bot Connection"
}

output "bot_web_app" {
  value       = local.az.bot_web_app
  description = "Bot Web App"
}

output "cdn_frontdoor_custom_domain" {
  value       = local.az.cdn_frontdoor_custom_domain
  description = "Cdn Frontdoor Custom Domain"
}

output "cdn_frontdoor_endpoint" {
  value       = local.az.cdn_frontdoor_endpoint
  description = "Cdn Frontdoor Endpoint"
}

output "cdn_frontdoor_firewall_policy" {
  value       = local.az.cdn_frontdoor_firewall_policy
  description = "Cdn Frontdoor Firewall Policy"
}

output "cdn_frontdoor_origin" {
  value       = local.az.cdn_frontdoor_origin
  description = "Cdn Frontdoor Origin"
}

output "cdn_frontdoor_origin_group" {
  value       = local.az.cdn_frontdoor_origin_group
  description = "Cdn Frontdoor Origin Group"
}

output "cdn_frontdoor_profile" {
  value       = local.az.cdn_frontdoor_profile
  description = "Cdn Frontdoor Profile"
}

output "cdn_frontdoor_route" {
  value       = local.az.cdn_frontdoor_route
  description = "Cdn Frontdoor Route"
}

output "cdn_frontdoor_rule" {
  value       = local.az.cdn_frontdoor_rule
  description = "Cdn Frontdoor Rule"
}

output "cdn_frontdoor_rule_set" {
  value       = local.az.cdn_frontdoor_rule_set
  description = "Cdn Frontdoor Rule Set"
}

output "cdn_frontdoor_secret" {
  value       = local.az.cdn_frontdoor_secret
  description = "Cdn Frontdoor Secret"
}

output "cdn_frontdoor_security_policy" {
  value       = local.az.cdn_frontdoor_security_policy
  description = "Cdn Frontdoor Security Policy"
}

output "cognitive_account" {
  value       = local.az.cognitive_account
  description = "Cognitive Account"
}

output "cognitive_deployment" {
  value       = local.az.cognitive_deployment
  description = "Cognitive Deployment"
}

output "communication_service" {
  value       = local.az.communication_service
  description = "Communication Service"
}

output "consumption_budget_resource_group" {
  value       = local.az.consumption_budget_resource_group
  description = "Consumption Budget Resource Group"
}

output "consumption_budget_subscription" {
  value       = local.az.consumption_budget_subscription
  description = "Consumption Budget Subscription"
}

output "containerGroups" {
  value       = local.az.containerGroups
  description = "Containergroups"
}

output "container_app" {
  value       = local.az.container_app
  description = "Container App"
}

output "container_app_environment" {
  value       = local.az.container_app_environment
  description = "Container App Environment"
}

output "container_app_job" {
  value       = local.az.container_app_job
  description = "Container App Job"
}

output "container_group" {
  value       = local.az.container_group
  description = "Container Group"
}

output "container_registry" {
  value       = local.az.container_registry
  description = "Container Registry"
}

output "container_registry_webhook" {
  value       = local.az.container_registry_webhook
  description = "Container Registry Webhook"
}

output "cosmosdb_account" {
  value       = local.az.cosmosdb_account
  description = "Cosmosdb Account"
}

output "cosmosdb_cassandra_cluster" {
  value       = local.az.cosmosdb_cassandra_cluster
  description = "Cosmosdb Cassandra Cluster"
}

output "cosmosdb_cassandra_datacenter" {
  value       = local.az.cosmosdb_cassandra_datacenter
  description = "Cosmosdb Cassandra Datacenter"
}

output "cosmosdb_postgres" {
  value       = local.az.cosmosdb_postgres
  description = "Cosmosdb Postgres"
}

output "custom_provider" {
  value       = local.az.custom_provider
  description = "Custom Provider"
}

output "dashboard" {
  value       = local.az.dashboard
  description = "Dashboard"
}

output "data_collection_endpoint" {
  value       = local.az.data_collection_endpoint
  description = "Data Collection Endpoint"
}

output "data_collection_rule" {
  value       = local.az.data_collection_rule
  description = "Data Collection Rule"
}

output "data_factory" {
  value       = local.az.data_factory
  description = "Data Factory"
}

output "data_factory_dataset_mysql" {
  value       = local.az.data_factory_dataset_mysql
  description = "Data Factory Dataset Mysql"
}

output "data_factory_dataset_postgresql" {
  value       = local.az.data_factory_dataset_postgresql
  description = "Data Factory Dataset Postgresql"
}

output "data_factory_dataset_sql_server_table" {
  value       = local.az.data_factory_dataset_sql_server_table
  description = "Data Factory Dataset Sql Server Table"
}

output "data_factory_integration_runtime_managed" {
  value       = local.az.data_factory_integration_runtime_managed
  description = "Data Factory Integration Runtime Managed"
}

output "data_factory_linked_service_data_lake_storage_gen2" {
  value       = local.az.data_factory_linked_service_data_lake_storage_gen2
  description = "Data Factory Linked Service Data Lake Storage Gen2"
}

output "data_factory_linked_service_key_vault" {
  value       = local.az.data_factory_linked_service_key_vault
  description = "Data Factory Linked Service Key Vault"
}

output "data_factory_linked_service_mysql" {
  value       = local.az.data_factory_linked_service_mysql
  description = "Data Factory Linked Service Mysql"
}

output "data_factory_linked_service_postgresql" {
  value       = local.az.data_factory_linked_service_postgresql
  description = "Data Factory Linked Service Postgresql"
}

output "data_factory_linked_service_sql_server" {
  value       = local.az.data_factory_linked_service_sql_server
  description = "Data Factory Linked Service Sql Server"
}

output "data_factory_pipeline" {
  value       = local.az.data_factory_pipeline
  description = "Data Factory Pipeline"
}

output "data_factory_trigger_schedule" {
  value       = local.az.data_factory_trigger_schedule
  description = "Data Factory Trigger Schedule"
}

output "data_lake_analytics_account" {
  value       = local.az.data_lake_analytics_account
  description = "Data Lake Analytics Account"
}

output "data_lake_analytics_firewall_rule" {
  value       = local.az.data_lake_analytics_firewall_rule
  description = "Data Lake Analytics Firewall Rule"
}

output "data_lake_store" {
  value       = local.az.data_lake_store
  description = "Data Lake Store"
}

output "data_lake_store_firewall_rule" {
  value       = local.az.data_lake_store_firewall_rule
  description = "Data Lake Store Firewall Rule"
}

output "database_migration_project" {
  value       = local.az.database_migration_project
  description = "Database Migration Project"
}

output "database_migration_service" {
  value       = local.az.database_migration_service
  description = "Database Migration Service"
}

output "databricks_cluster" {
  value       = local.az.databricks_cluster
  description = "Databricks Cluster"
}

output "databricks_high_concurrency_cluster" {
  value       = local.az.databricks_high_concurrency_cluster
  description = "Databricks High Concurrency Cluster"
}

output "databricks_standard_cluster" {
  value       = local.az.databricks_standard_cluster
  description = "Databricks Standard Cluster"
}

output "databricks_workspace" {
  value       = local.az.databricks_workspace
  description = "Databricks Workspace"
}

output "dev_test_lab" {
  value       = local.az.dev_test_lab
  description = "Dev Test Lab"
}

output "dev_test_linux_virtual_machine" {
  value       = local.az.dev_test_linux_virtual_machine
  description = "Dev Test Linux Virtual Machine"
}

output "dev_test_windows_virtual_machine" {
  value       = local.az.dev_test_windows_virtual_machine
  description = "Dev Test Windows Virtual Machine"
}

output "digital_twins_endpoint_eventgrid" {
  value       = local.az.digital_twins_endpoint_eventgrid
  description = "Digital Twins Endpoint Eventgrid"
}

output "digital_twins_endpoint_eventhub" {
  value       = local.az.digital_twins_endpoint_eventhub
  description = "Digital Twins Endpoint Eventhub"
}

output "digital_twins_endpoint_servicebus" {
  value       = local.az.digital_twins_endpoint_servicebus
  description = "Digital Twins Endpoint Servicebus"
}

output "digital_twins_instance" {
  value       = local.az.digital_twins_instance
  description = "Digital Twins Instance"
}

output "disk_encryption_set" {
  value       = local.az.disk_encryption_set
  description = "Disk Encryption Set"
}

output "dns_a_record" {
  value       = local.az.dns_a_record
  description = "Dns A Record"
}

output "dns_aaaa_record" {
  value       = local.az.dns_aaaa_record
  description = "Dns Aaaa Record"
}

output "dns_caa_record" {
  value       = local.az.dns_caa_record
  description = "Dns Caa Record"
}

output "dns_cname_record" {
  value       = local.az.dns_cname_record
  description = "Dns Cname Record"
}

output "dns_mx_record" {
  value       = local.az.dns_mx_record
  description = "Dns Mx Record"
}

output "dns_ns_record" {
  value       = local.az.dns_ns_record
  description = "Dns Ns Record"
}

output "dns_ptr_record" {
  value       = local.az.dns_ptr_record
  description = "Dns Ptr Record"
}

output "dns_txt_record" {
  value       = local.az.dns_txt_record
  description = "Dns Txt Record"
}

output "dns_zone" {
  value       = local.az.dns_zone
  description = "Dns Zone"
}

output "eventgrid_domain" {
  value       = local.az.eventgrid_domain
  description = "Eventgrid Domain"
}

output "eventgrid_domain_topic" {
  value       = local.az.eventgrid_domain_topic
  description = "Eventgrid Domain Topic"
}

output "eventgrid_event_subscription" {
  value       = local.az.eventgrid_event_subscription
  description = "Eventgrid Event Subscription"
}

output "eventgrid_topic" {
  value       = local.az.eventgrid_topic
  description = "Eventgrid Topic"
}

output "eventhub" {
  value       = local.az.eventhub
  description = "Eventhub"
}

output "eventhub_authorization_rule" {
  value       = local.az.eventhub_authorization_rule
  description = "Eventhub Authorization Rule"
}

output "eventhub_consumer_group" {
  value       = local.az.eventhub_consumer_group
  description = "Eventhub Consumer Group"
}

output "eventhub_namespace" {
  value       = local.az.eventhub_namespace
  description = "Eventhub Namespace"
}

output "eventhub_namespace_authorization_rule" {
  value       = local.az.eventhub_namespace_authorization_rule
  description = "Eventhub Namespace Authorization Rule"
}

output "eventhub_namespace_disaster_recovery_config" {
  value       = local.az.eventhub_namespace_disaster_recovery_config
  description = "Eventhub Namespace Disaster Recovery Config"
}

output "express_route_circuit" {
  value       = local.az.express_route_circuit
  description = "Express Route Circuit"
}

output "express_route_gateway" {
  value       = local.az.express_route_gateway
  description = "Express Route Gateway"
}

output "firewall" {
  value       = local.az.firewall
  description = "Firewall"
}

output "firewall_application_rule_collection" {
  value       = local.az.firewall_application_rule_collection
  description = "Firewall Application Rule Collection"
}

output "firewall_ip_configuration" {
  value       = local.az.firewall_ip_configuration
  description = "Firewall Ip Configuration"
}

output "firewall_nat_rule_collection" {
  value       = local.az.firewall_nat_rule_collection
  description = "Firewall Nat Rule Collection"
}

output "firewall_network_rule_collection" {
  value       = local.az.firewall_network_rule_collection
  description = "Firewall Network Rule Collection"
}

output "firewall_policy" {
  value       = local.az.firewall_policy
  description = "Firewall Policy"
}

output "firewall_policy_rule_collection_group" {
  value       = local.az.firewall_policy_rule_collection_group
  description = "Firewall Policy Rule Collection Group"
}

output "frontdoor" {
  value       = local.az.frontdoor
  description = "Frontdoor"
}

output "frontdoor_firewall_policy" {
  value       = local.az.frontdoor_firewall_policy
  description = "Frontdoor Firewall Policy"
}

output "function_app" {
  value       = local.az.function_app
  description = "Function App"
}

output "function_app_slot" {
  value       = local.az.function_app_slot
  description = "Function App Slot"
}

output "hdinsight_hadoop_cluster" {
  value       = local.az.hdinsight_hadoop_cluster
  description = "Hdinsight Hadoop Cluster"
}

output "hdinsight_hbase_cluster" {
  value       = local.az.hdinsight_hbase_cluster
  description = "Hdinsight Hbase Cluster"
}

output "hdinsight_interactive_query_cluster" {
  value       = local.az.hdinsight_interactive_query_cluster
  description = "Hdinsight Interactive Query Cluster"
}

output "hdinsight_kafka_cluster" {
  value       = local.az.hdinsight_kafka_cluster
  description = "Hdinsight Kafka Cluster"
}

output "hdinsight_ml_services_cluster" {
  value       = local.az.hdinsight_ml_services_cluster
  description = "Hdinsight Ml Services Cluster"
}

output "hdinsight_rserver_cluster" {
  value       = local.az.hdinsight_rserver_cluster
  description = "Hdinsight Rserver Cluster"
}

output "hdinsight_spark_cluster" {
  value       = local.az.hdinsight_spark_cluster
  description = "Hdinsight Spark Cluster"
}

output "hdinsight_storm_cluster" {
  value       = local.az.hdinsight_storm_cluster
  description = "Hdinsight Storm Cluster"
}

output "healthcare_dicom_service" {
  value       = local.az.healthcare_dicom_service
  description = "Healthcare Dicom Service"
}

output "healthcare_fhir_service" {
  value       = local.az.healthcare_fhir_service
  description = "Healthcare Fhir Service"
}

output "healthcare_medtech_service" {
  value       = local.az.healthcare_medtech_service
  description = "Healthcare Medtech Service"
}

output "healthcare_service" {
  value       = local.az.healthcare_service
  description = "Healthcare Service"
}

output "healthcare_workspace" {
  value       = local.az.healthcare_workspace
  description = "Healthcare Workspace"
}

output "image" {
  value       = local.az.image
  description = "Image"
}

output "integration_service_environment" {
  value       = local.az.integration_service_environment
  description = "Integration Service Environment"
}

output "iot_security_device_group" {
  value       = local.az.iot_security_device_group
  description = "Iot Security Device Group"
}

output "iot_security_solution" {
  value       = local.az.iot_security_solution
  description = "Iot Security Solution"
}

output "iotcentral_application" {
  value       = local.az.iotcentral_application
  description = "Iotcentral Application"
}

output "iothub" {
  value       = local.az.iothub
  description = "Iothub"
}

output "iothub_consumer_group" {
  value       = local.az.iothub_consumer_group
  description = "Iothub Consumer Group"
}

output "iothub_dps" {
  value       = local.az.iothub_dps
  description = "Iothub Dps"
}

output "iothub_dps_certificate" {
  value       = local.az.iothub_dps_certificate
  description = "Iothub Dps Certificate"
}

output "ip_group" {
  value       = local.az.ip_group
  description = "Ip Group"
}

output "key_vault" {
  value       = local.az.key_vault
  description = "Key Vault"
}

output "key_vault_certificate" {
  value       = local.az.key_vault_certificate
  description = "Key Vault Certificate"
}

output "key_vault_key" {
  value       = local.az.key_vault_key
  description = "Key Vault Key"
}

output "key_vault_secret" {
  value       = local.az.key_vault_secret
  description = "Key Vault Secret"
}

output "kubernetes_cluster" {
  value       = local.az.kubernetes_cluster
  description = "Kubernetes Cluster"
}

output "kubernetes_fleet_manager" {
  value       = local.az.kubernetes_fleet_manager
  description = "Kubernetes Fleet Manager"
}

output "kusto_cluster" {
  value       = local.az.kusto_cluster
  description = "Kusto Cluster"
}

output "kusto_database" {
  value       = local.az.kusto_database
  description = "Kusto Database"
}

output "kusto_eventhub_data_connection" {
  value       = local.az.kusto_eventhub_data_connection
  description = "Kusto Eventhub Data Connection"
}

output "lb" {
  value       = local.az.lb
  description = "Lb"
}

output "lb_backend_address_pool" {
  value       = local.az.lb_backend_address_pool
  description = "Lb Backend Address Pool"
}

output "lb_backend_pool" {
  value       = local.az.lb_backend_pool
  description = "Lb Backend Pool"
}

output "lb_nat_pool" {
  value       = local.az.lb_nat_pool
  description = "Lb Nat Pool"
}

output "lb_nat_rule" {
  value       = local.az.lb_nat_rule
  description = "Lb Nat Rule"
}

output "lb_outbound_rule" {
  value       = local.az.lb_outbound_rule
  description = "Lb Outbound Rule"
}

output "lb_probe" {
  value       = local.az.lb_probe
  description = "Lb Probe"
}

output "lb_rule" {
  value       = local.az.lb_rule
  description = "Lb Rule"
}

output "linux_virtual_machine" {
  value       = local.az.linux_virtual_machine
  description = "Linux Virtual Machine"
}

output "linux_virtual_machine_scale_set" {
  value       = local.az.linux_virtual_machine_scale_set
  description = "Linux Virtual Machine Scale Set"
}

output "load_test" {
  value       = local.az.load_test
  description = "Load Test"
}

output "local_network_gateway" {
  value       = local.az.local_network_gateway
  description = "Local Network Gateway"
}

output "log_analytics_cluster" {
  value       = local.az.log_analytics_cluster
  description = "Log Analytics Cluster"
}

output "log_analytics_storage_insights" {
  value       = local.az.log_analytics_storage_insights
  description = "Log Analytics Storage Insights"
}

output "log_analytics_workspace" {
  value       = local.az.log_analytics_workspace
  description = "Log Analytics Workspace"
}

output "logic_app_action_custom" {
  value       = local.az.logic_app_action_custom
  description = "Logic App Action Custom"
}

output "logic_app_action_http" {
  value       = local.az.logic_app_action_http
  description = "Logic App Action Http"
}

output "logic_app_integration_account" {
  value       = local.az.logic_app_integration_account
  description = "Logic App Integration Account"
}

output "logic_app_trigger_custom" {
  value       = local.az.logic_app_trigger_custom
  description = "Logic App Trigger Custom"
}

output "logic_app_trigger_http_request" {
  value       = local.az.logic_app_trigger_http_request
  description = "Logic App Trigger Http Request"
}

output "logic_app_trigger_recurrence" {
  value       = local.az.logic_app_trigger_recurrence
  description = "Logic App Trigger Recurrence"
}

output "logic_app_workflow" {
  value       = local.az.logic_app_workflow
  description = "Logic App Workflow"
}

output "machine_learning_compute_instance" {
  value       = local.az.machine_learning_compute_instance
  description = "Machine Learning Compute Instance"
}

output "machine_learning_workspace" {
  value       = local.az.machine_learning_workspace
  description = "Machine Learning Workspace"
}

output "maintenance_configuration" {
  value       = local.az.maintenance_configuration
  description = "Maintenance Configuration"
}

output "managed_disk" {
  value       = local.az.managed_disk
  description = "Managed Disk"
}

output "maps_account" {
  value       = local.az.maps_account
  description = "Maps Account"
}

output "mariadb_database" {
  value       = local.az.mariadb_database
  description = "Mariadb Database"
}

output "mariadb_firewall_rule" {
  value       = local.az.mariadb_firewall_rule
  description = "Mariadb Firewall Rule"
}

output "mariadb_server" {
  value       = local.az.mariadb_server
  description = "Mariadb Server"
}

output "mariadb_virtual_network_rule" {
  value       = local.az.mariadb_virtual_network_rule
  description = "Mariadb Virtual Network Rule"
}

output "monitor_action_group" {
  value       = local.az.monitor_action_group
  description = "Monitor Action Group"
}

output "monitor_autoscale_setting" {
  value       = local.az.monitor_autoscale_setting
  description = "Monitor Autoscale Setting"
}

output "monitor_data_collection_endpoint" {
  value       = local.az.monitor_data_collection_endpoint
  description = "Monitor Data Collection Endpoint"
}

output "monitor_diagnostic_setting" {
  value       = local.az.monitor_diagnostic_setting
  description = "Monitor Diagnostic Setting"
}

output "monitor_private_link_scope" {
  value       = local.az.monitor_private_link_scope
  description = "Monitor Private Link Scope"
}

output "monitor_scheduled_query_rules_alert" {
  value       = local.az.monitor_scheduled_query_rules_alert
  description = "Monitor Scheduled Query Rules Alert"
}

output "mssql_database" {
  value       = local.az.mssql_database
  description = "Mssql Database"
}

output "mssql_elasticpool" {
  value       = local.az.mssql_elasticpool
  description = "Mssql Elasticpool"
}

output "mssql_server" {
  value       = local.az.mssql_server
  description = "Mssql Server"
}

output "mysql_database" {
  value       = local.az.mysql_database
  description = "Mysql Database"
}

output "mysql_firewall_rule" {
  value       = local.az.mysql_firewall_rule
  description = "Mysql Firewall Rule"
}

output "mysql_flexible_server" {
  value       = local.az.mysql_flexible_server
  description = "Mysql Flexible Server"
}

output "mysql_flexible_server_database" {
  value       = local.az.mysql_flexible_server_database
  description = "Mysql Flexible Server Database"
}

output "mysql_flexible_server_firewall_rule" {
  value       = local.az.mysql_flexible_server_firewall_rule
  description = "Mysql Flexible Server Firewall Rule"
}

output "mysql_server" {
  value       = local.az.mysql_server
  description = "Mysql Server"
}

output "mysql_virtual_network_rule" {
  value       = local.az.mysql_virtual_network_rule
  description = "Mysql Virtual Network Rule"
}

output "netapp_account" {
  value       = local.az.netapp_account
  description = "Netapp Account"
}

output "netapp_pool" {
  value       = local.az.netapp_pool
  description = "Netapp Pool"
}

output "netapp_snapshot" {
  value       = local.az.netapp_snapshot
  description = "Netapp Snapshot"
}

output "netapp_volume" {
  value       = local.az.netapp_volume
  description = "Netapp Volume"
}

output "network_ddos_protection_plan" {
  value       = local.az.network_ddos_protection_plan
  description = "Network Ddos Protection Plan"
}

output "network_interface" {
  value       = local.az.network_interface
  description = "Network Interface"
}

output "network_security_group" {
  value       = local.az.network_security_group
  description = "Network Security Group"
}

output "network_security_group_rule" {
  value       = local.az.network_security_group_rule
  description = "Network Security Group Rule"
}

output "network_security_rule" {
  value       = local.az.network_security_rule
  description = "Network Security Rule"
}

output "network_watcher" {
  value       = local.az.network_watcher
  description = "Network Watcher"
}

output "network_watcher_flow_log" {
  value       = local.az.network_watcher_flow_log
  description = "Network Watcher Flow Log"
}

output "nginx_deployment" {
  value       = local.az.nginx_deployment
  description = "Nginx Deployment"
}

output "notification_hub" {
  value       = local.az.notification_hub
  description = "Notification Hub"
}

output "notification_hub_authorization_rule" {
  value       = local.az.notification_hub_authorization_rule
  description = "Notification Hub Authorization Rule"
}

output "notification_hub_namespace" {
  value       = local.az.notification_hub_namespace
  description = "Notification Hub Namespace"
}

output "point_to_site_vpn_gateway" {
  value       = local.az.point_to_site_vpn_gateway
  description = "Point To Site Vpn Gateway"
}

output "portal_dashboard" {
  value       = local.az.portal_dashboard
  description = "Portal Dashboard"
}

output "postgresql_database" {
  value       = local.az.postgresql_database
  description = "Postgresql Database"
}

output "postgresql_firewall_rule" {
  value       = local.az.postgresql_firewall_rule
  description = "Postgresql Firewall Rule"
}

output "postgresql_flexible_server" {
  value       = local.az.postgresql_flexible_server
  description = "Postgresql Flexible Server"
}

output "postgresql_flexible_server_database" {
  value       = local.az.postgresql_flexible_server_database
  description = "Postgresql Flexible Server Database"
}

output "postgresql_flexible_server_firewall_rule" {
  value       = local.az.postgresql_flexible_server_firewall_rule
  description = "Postgresql Flexible Server Firewall Rule"
}

output "postgresql_server" {
  value       = local.az.postgresql_server
  description = "Postgresql Server"
}

output "postgresql_virtual_network_rule" {
  value       = local.az.postgresql_virtual_network_rule
  description = "Postgresql Virtual Network Rule"
}

output "powerbi_embedded" {
  value       = local.az.powerbi_embedded
  description = "Powerbi Embedded"
}

output "private_dns_a_record" {
  value       = local.az.private_dns_a_record
  description = "Private Dns A Record"
}

output "private_dns_aaaa_record" {
  value       = local.az.private_dns_aaaa_record
  description = "Private Dns Aaaa Record"
}

output "private_dns_cname_record" {
  value       = local.az.private_dns_cname_record
  description = "Private Dns Cname Record"
}

output "private_dns_mx_record" {
  value       = local.az.private_dns_mx_record
  description = "Private Dns Mx Record"
}

output "private_dns_ptr_record" {
  value       = local.az.private_dns_ptr_record
  description = "Private Dns Ptr Record"
}

output "private_dns_resolver" {
  value       = local.az.private_dns_resolver
  description = "Private Dns Resolver"
}

output "private_dns_resolver_dns_forwarding_ruleset" {
  value       = local.az.private_dns_resolver_dns_forwarding_ruleset
  description = "Private Dns Resolver Dns Forwarding Ruleset"
}

output "private_dns_resolver_forwarding_rule" {
  value       = local.az.private_dns_resolver_forwarding_rule
  description = "Private Dns Resolver Forwarding Rule"
}

output "private_dns_resolver_inbound_endpoint" {
  value       = local.az.private_dns_resolver_inbound_endpoint
  description = "Private Dns Resolver Inbound Endpoint"
}

output "private_dns_resolver_outbound_endpoint" {
  value       = local.az.private_dns_resolver_outbound_endpoint
  description = "Private Dns Resolver Outbound Endpoint"
}

output "private_dns_resolver_virtual_network_link" {
  value       = local.az.private_dns_resolver_virtual_network_link
  description = "Private Dns Resolver Virtual Network Link"
}

output "private_dns_srv_record" {
  value       = local.az.private_dns_srv_record
  description = "Private Dns Srv Record"
}

output "private_dns_txt_record" {
  value       = local.az.private_dns_txt_record
  description = "Private Dns Txt Record"
}

output "private_dns_zone" {
  value       = local.az.private_dns_zone
  description = "Private Dns Zone"
}

output "private_dns_zone_group" {
  value       = local.az.private_dns_zone_group
  description = "Private Dns Zone Group"
}

output "private_endpoint" {
  value       = local.az.private_endpoint
  description = "Private Endpoint"
}

output "private_link_service" {
  value       = local.az.private_link_service
  description = "Private Link Service"
}

output "private_service_connection" {
  value       = local.az.private_service_connection
  description = "Private Service Connection"
}

output "proximity_placement_group" {
  value       = local.az.proximity_placement_group
  description = "Proximity Placement Group"
}

output "public_ip" {
  value       = local.az.public_ip
  description = "Public Ip"
}

output "public_ip_prefix" {
  value       = local.az.public_ip_prefix
  description = "Public Ip Prefix"
}

output "purview_account" {
  value       = local.az.purview_account
  description = "Purview Account"
}

output "recovery_services_vault" {
  value       = local.az.recovery_services_vault
  description = "Recovery Services Vault"
}

output "recovery_services_vault_backup_policy" {
  value       = local.az.recovery_services_vault_backup_policy
  description = "Recovery Services Vault Backup Policy"
}

output "redhat_openshift_cluster" {
  value       = local.az.redhat_openshift_cluster
  description = "Redhat Openshift Cluster"
}

output "redhat_openshift_domain" {
  value       = local.az.redhat_openshift_domain
  description = "Redhat Openshift Domain"
}

output "redis_cache" {
  value       = local.az.redis_cache
  description = "Redis Cache"
}

output "redis_firewall_rule" {
  value       = local.az.redis_firewall_rule
  description = "Redis Firewall Rule"
}

output "relay_hybrid_connection" {
  value       = local.az.relay_hybrid_connection
  description = "Relay Hybrid Connection"
}

output "relay_namespace" {
  value       = local.az.relay_namespace
  description = "Relay Namespace"
}

output "resource_group" {
  value       = local.az.resource_group
  description = "Resource Group"
}

output "resource_group_policy_assignment" {
  value       = local.az.resource_group_policy_assignment
  description = "Resource Group Policy Assignment"
}

output "role_assignment" {
  value       = local.az.role_assignment
  description = "Role Assignment"
}

output "role_definition" {
  value       = local.az.role_definition
  description = "Role Definition"
}

output "route" {
  value       = local.az.route
  description = "Route"
}

output "route_table" {
  value       = local.az.route_table
  description = "Route Table"
}

output "search_service" {
  value       = local.az.search_service
  description = "Search Service"
}

output "service_fabric_cluster" {
  value       = local.az.service_fabric_cluster
  description = "Service Fabric Cluster"
}

output "servicebus_namespace" {
  value       = local.az.servicebus_namespace
  description = "Servicebus Namespace"
}

output "servicebus_namespace_authorization_rule" {
  value       = local.az.servicebus_namespace_authorization_rule
  description = "Servicebus Namespace Authorization Rule"
}

output "servicebus_queue" {
  value       = local.az.servicebus_queue
  description = "Servicebus Queue"
}

output "servicebus_queue_authorization_rule" {
  value       = local.az.servicebus_queue_authorization_rule
  description = "Servicebus Queue Authorization Rule"
}

output "servicebus_subscription" {
  value       = local.az.servicebus_subscription
  description = "Servicebus Subscription"
}

output "servicebus_subscription_rule" {
  value       = local.az.servicebus_subscription_rule
  description = "Servicebus Subscription Rule"
}

output "servicebus_topic" {
  value       = local.az.servicebus_topic
  description = "Servicebus Topic"
}

output "servicebus_topic_authorization_rule" {
  value       = local.az.servicebus_topic_authorization_rule
  description = "Servicebus Topic Authorization Rule"
}

output "shared_image" {
  value       = local.az.shared_image
  description = "Shared Image"
}

output "shared_image_gallery" {
  value       = local.az.shared_image_gallery
  description = "Shared Image Gallery"
}

output "signalr_service" {
  value       = local.az.signalr_service
  description = "Signalr Service"
}

output "snapshots" {
  value       = local.az.snapshots
  description = "Snapshots"
}

output "sql_elasticpool" {
  value       = local.az.sql_elasticpool
  description = "Sql Elasticpool"
}

output "sql_failover_group" {
  value       = local.az.sql_failover_group
  description = "Sql Failover Group"
}

output "sql_firewall_rule" {
  value       = local.az.sql_firewall_rule
  description = "Sql Firewall Rule"
}

output "sql_server" {
  value       = local.az.sql_server
  description = "Sql Server"
}

output "storage_account" {
  value       = local.az.storage_account
  description = "Storage Account"
}

output "storage_blob" {
  value       = local.az.storage_blob
  description = "Storage Blob"
}

output "storage_container" {
  value       = local.az.storage_container
  description = "Storage Container"
}

output "storage_data_lake_gen2_filesystem" {
  value       = local.az.storage_data_lake_gen2_filesystem
  description = "Storage Data Lake Gen2 Filesystem"
}

output "storage_queue" {
  value       = local.az.storage_queue
  description = "Storage Queue"
}

output "storage_share" {
  value       = local.az.storage_share
  description = "Storage Share"
}

output "storage_share_directory" {
  value       = local.az.storage_share_directory
  description = "Storage Share Directory"
}

output "storage_sync" {
  value       = local.az.storage_sync
  description = "Storage Sync"
}

output "storage_sync_group" {
  value       = local.az.storage_sync_group
  description = "Storage Sync Group"
}

output "storage_table" {
  value       = local.az.storage_table
  description = "Storage Table"
}

output "stream_analytics_function_javascript_udf" {
  value       = local.az.stream_analytics_function_javascript_udf
  description = "Stream Analytics Function Javascript Udf"
}

output "stream_analytics_job" {
  value       = local.az.stream_analytics_job
  description = "Stream Analytics Job"
}

output "stream_analytics_output_blob" {
  value       = local.az.stream_analytics_output_blob
  description = "Stream Analytics Output Blob"
}

output "stream_analytics_output_eventhub" {
  value       = local.az.stream_analytics_output_eventhub
  description = "Stream Analytics Output Eventhub"
}

output "stream_analytics_output_mssql" {
  value       = local.az.stream_analytics_output_mssql
  description = "Stream Analytics Output Mssql"
}

output "stream_analytics_output_servicebus_queue" {
  value       = local.az.stream_analytics_output_servicebus_queue
  description = "Stream Analytics Output Servicebus Queue"
}

output "stream_analytics_output_servicebus_topic" {
  value       = local.az.stream_analytics_output_servicebus_topic
  description = "Stream Analytics Output Servicebus Topic"
}

output "stream_analytics_reference_input_blob" {
  value       = local.az.stream_analytics_reference_input_blob
  description = "Stream Analytics Reference Input Blob"
}

output "stream_analytics_stream_input_blob" {
  value       = local.az.stream_analytics_stream_input_blob
  description = "Stream Analytics Stream Input Blob"
}

output "stream_analytics_stream_input_eventhub" {
  value       = local.az.stream_analytics_stream_input_eventhub
  description = "Stream Analytics Stream Input Eventhub"
}

output "stream_analytics_stream_input_iothub" {
  value       = local.az.stream_analytics_stream_input_iothub
  description = "Stream Analytics Stream Input Iothub"
}

output "subnet" {
  value       = local.az.subnet
  description = "Subnet"
}

output "subscription_policy_assignment" {
  value       = local.az.subscription_policy_assignment
  description = "Subscription Policy Assignment"
}

output "synapse_firewall_rule" {
  value       = local.az.synapse_firewall_rule
  description = "Synapse Firewall Rule"
}

output "synapse_integration_runtime_azure" {
  value       = local.az.synapse_integration_runtime_azure
  description = "Synapse Integration Runtime Azure"
}

output "synapse_integration_runtime_self_hosted" {
  value       = local.az.synapse_integration_runtime_self_hosted
  description = "Synapse Integration Runtime Self Hosted"
}

output "synapse_linked_service" {
  value       = local.az.synapse_linked_service
  description = "Synapse Linked Service"
}

output "synapse_managed_private_endpoint" {
  value       = local.az.synapse_managed_private_endpoint
  description = "Synapse Managed Private Endpoint"
}

output "synapse_private_link_hub" {
  value       = local.az.synapse_private_link_hub
  description = "Synapse Private Link Hub"
}

output "synapse_spark_pool" {
  value       = local.az.synapse_spark_pool
  description = "Synapse Spark Pool"
}

output "synapse_sql_pool" {
  value       = local.az.synapse_sql_pool
  description = "Synapse Sql Pool"
}

output "synapse_sql_pool_vulnerability_assessment_baseline" {
  value       = local.az.synapse_sql_pool_vulnerability_assessment_baseline
  description = "Synapse Sql Pool Vulnerability Assessment Baseline"
}

output "synapse_sql_pool_workload_classifier" {
  value       = local.az.synapse_sql_pool_workload_classifier
  description = "Synapse Sql Pool Workload Classifier"
}

output "synapse_sql_pool_workload_group" {
  value       = local.az.synapse_sql_pool_workload_group
  description = "Synapse Sql Pool Workload Group"
}

output "synapse_workspace" {
  value       = local.az.synapse_workspace
  description = "Synapse Workspace"
}

output "template_deployment" {
  value       = local.az.template_deployment
  description = "Template Deployment"
}

output "traffic_manager_profile" {
  value       = local.az.traffic_manager_profile
  description = "Traffic Manager Profile"
}

output "user_assigned_identity" {
  value       = local.az.user_assigned_identity
  description = "User Assigned Identity"
}

output "virtual_desktop_application_group" {
  value       = local.az.virtual_desktop_application_group
  description = "Virtual Desktop Application Group"
}

output "virtual_desktop_host_pool" {
  value       = local.az.virtual_desktop_host_pool
  description = "Virtual Desktop Host Pool"
}

output "virtual_desktop_workspace" {
  value       = local.az.virtual_desktop_workspace
  description = "Virtual Desktop Workspace"
}

output "virtual_hub" {
  value       = local.az.virtual_hub
  description = "Virtual Hub"
}

output "virtual_hub_connection" {
  value       = local.az.virtual_hub_connection
  description = "Virtual Hub Connection"
}

output "virtual_machine" {
  value       = local.az.virtual_machine
  description = "Virtual Machine"
}

output "virtual_machine_extension" {
  value       = local.az.virtual_machine_extension
  description = "Virtual Machine Extension"
}

output "virtual_machine_scale_set" {
  value       = local.az.virtual_machine_scale_set
  description = "Virtual Machine Scale Set"
}

output "virtual_machine_scale_set_extension" {
  value       = local.az.virtual_machine_scale_set_extension
  description = "Virtual Machine Scale Set Extension"
}

output "virtual_network" {
  value       = local.az.virtual_network
  description = "Virtual Network"
}

output "virtual_network_gateway" {
  value       = local.az.virtual_network_gateway
  description = "Virtual Network Gateway"
}

output "virtual_network_gateway_connection" {
  value       = local.az.virtual_network_gateway_connection
  description = "Virtual Network Gateway Connection"
}

output "virtual_network_peering" {
  value       = local.az.virtual_network_peering
  description = "Virtual Network Peering"
}

output "virtual_wan" {
  value       = local.az.virtual_wan
  description = "Virtual Wan"
}

output "vpn_gateway_connection" {
  value       = local.az.vpn_gateway_connection
  description = "Vpn Gateway Connection"
}

output "vpn_site" {
  value       = local.az.vpn_site
  description = "Vpn Site"
}

output "web_pubsub" {
  value       = local.az.web_pubsub
  description = "Web Pubsub"
}

output "web_pubsub_hub" {
  value       = local.az.web_pubsub_hub
  description = "Web Pubsub Hub"
}

output "windows_virtual_machine" {
  value       = local.az.windows_virtual_machine
  description = "Windows Virtual Machine"
}

output "windows_virtual_machine_scale_set" {
  value       = local.az.windows_virtual_machine_scale_set
  description = "Windows Virtual Machine Scale Set"
}


