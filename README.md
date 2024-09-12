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
| `analysis__services__server`                                                                                         | Analysis Services Server                           |
| `api__management`                                                                                                                         | Api Management                                     |
| `app__configuration`                                                                                                                | App Configuration                                  |
| `app__service`                                                                                                                                  | App Service                                        |
| `app__service__environment`                                                                                            | App Service Environment                            |
| `app__service__plan`                                                                                                                 | App Service Plan                                   |
| `application__gateway`                                                                                                          | Application Gateway                                |
| `application__insights`                                                                                                       | Application Insights                               |
| `application__security__group`                                                                                   | Application Security Group                         |
| `automation__account`                                                                                                             | Automation Account                                 |
| `automation__certificate`                                                                                                 | Automation Certificate                             |
| `automation__credential`                                                                                                    | Automation Credential                              |
| `automation__runbook`                                                                                                             | Automation Runbook                                 |
| `automation__schedule`                                                                                                          | Automation Schedule                                |
| `automation__variable`                                                                                                          | Automation Variable                                |
| `availability__set`                                                                                                                   | Availability Set                                   |
| `bastion__host'                                                                                                                               | Bastion Host                                       |
| `batch__account`                                                                                                                            | Batch Account                                      |
| `batch__application`                                                                                                                | Batch Application                                  |
| `batch__certificate`                                                                                                                | Batch Certificate                                  |
| `batch__pool`                                                                                                                                     | Batch Pool                                         |
| `bot__channel__directline`                                                                                               | Bot Channel Directline                             |
| `bot__channel__email`                                                                                                              | Bot Channel Email                                  |
| `bot__channel__ms__teams`                                                                                                   | Bot Channel Ms Teams                               |
| `bot__channel__slack`                                                                                                              | Bot Channel Slack                                  |
| `bot__channels__registration`                                                                                      | Bot Channels Registration                          |
| `bot__connection`                                                                                                                         | Bot Connection                                     |
| `bot__web__app`                                                                                                                                | Bot Web App                                        |
| `cdn__endpoint`                                                                                                                               | Cdn Endpoint                                       |
| `cdn__profile`                                                                                                                                  | Cdn Profile                                        |
| `cognitive__account`                                                                                                                | Cognitive Account                                  |
| `container__group`                                                                                                                      | Container Group                                    |
| `container__registry`                                                                                                             | Container Registry                                 |
| `container__registry__webhook`                                                                                   | Container Registry Webhook                         |
| `cosmosdb__account`                                                                                                                   | Cosmosdb Account                                   |
| `cosmosdb__cassandra__cluster`                                                                                   | Cosmosdb Cassandra Cluster                         |
| `cosmosdb__cassandra__datacenter`                                                                          | Cosmosdb Cassandra Datacenter                      |
| `cosmosdb__postgres`                                                                                                                | Cosmosdb Postgres                                  |
| `custom__provider`                                                                                                                      | Custom Provider                                    |
| `dashboard`                                                                                                                                          | Dashboard                                          |
| `data__factory`                                                                                                                               | Data Factory                                       |
| `data__factory__dataset__mysql`                                                                                 | Data Factory Dataset Mysql                         |
| `data__factory__dataset__postgresql`                                                                  | Data Factory Dataset Postgresql                    |
| `data__factory__dataset__sql__server__table`                                            | Data Factory Dataset Sql Server Table              |
| `data__factory__integration__runtime__managed`                                     | Data Factory Integration Runtime Managed           |
| `data__factory__linked__service__data__lake__storage__gen2` | Data Factory Linked Service Data Lake Storage Gen2 |
| `data__factory__linked__service__key__vault`                                            | Data Factory Linked Service Key Vault              |
| `data__factory__linked__service__mysql`                                                          | Data Factory Linked Service Mysql                  |
| `data__factory__linked__service__postgresql`                                           | Data Factory Linked Service Postgresql             |
| `data__factory__linked__service__sql__server`                                         | Data Factory Linked Service Sql Server             |
| `data__factory__pipeline`                                                                                                  | Data Factory Pipeline                              |
| `data__factory__trigger__schedule`                                                                        | Data Factory Trigger Schedule                      |
| `data__lake__analytics__account`                                                                              | Data Lake Analytics Account                        |
| `data__lake__analytics__firewall__rule`                                                          | Data Lake Analytics Firewall Rule                  |
| `data__lake__store`                                                                                                                    | Data Lake Store                                    |
| `data__lake__store__firewall__rule`                                                                      | Data Lake Store Firewall Rule                      |
| `database__migration__project`                                                                                   | Database Migration Project                         |
| `database__migration__service`                                                                                   | Database Migration Service                         |
| `databricks__cluster`                                                                                                             | Databricks Cluster                                 |
| `databricks__high__concurrency__cluster`                                                      | Databricks High Concurrency Cluster                |
| `databricks__standard__cluster`                                                                                | Databricks Standard Cluster                        |
| `databricks__workspace`                                                                                                       | Databricks Workspace                               |
| `dev__test__lab`                                                                                                                             | Dev Test Lab                                       |
| `dev__test__linux__virtual__machine`                                                                   | Dev Test Linux Virtual Machine                     |
| `dev__test__windows__virtual__machine`                                                             | Dev Test Windows Virtual Machine                   |
| `disk__encryption__set`                                                                                                        | Disk Encryption Set                                |
| `dns__a__record`                                                                                                                             | Dns A Record                                       |
| `dns__aaaa__record`                                                                                                                    | Dns Aaaa Record                                    |
| `dns__caa__record`                                                                                                                       | Dns Caa Record                                     |
| `dns__cname__record`                                                                                                                 | Dns Cname Record                                   |
| `dns__mx__record`                                                                                                                          | Dns Mx Record                                      |
| `dns__ns__record`                                                                                                                          | Dns Ns Record                                      |
| `dns__ptr__record`                                                                                                                       | Dns Ptr Record                                     |
| `dns__txt__record`                                                                                                                       | Dns Txt Record                                     |
| `dns__zone`                                                                                                                                           | Dns Zone                                           |
| `eventgrid__domain`                                                                                                                   | Eventgrid Domain                                   |
| `eventgrid__domain__topic`                                                                                               | Eventgrid Domain Topic                             |
| `eventgrid__event__subscription`                                                                             | Eventgrid Event Subscription                       |
| `eventgrid__topic`                                                                                                                      | Eventgrid Topic                                    |
| `eventhub`                                                                                                                                             | Eventhub                                           |
| `eventhub__authorization__rule`                                                                                | Eventhub Authorization Rule                        |
| `eventhub__consumer__group`                                                                                            | Eventhub Consumer Group                            |
| `eventhub__namespace`                                                                                                             | Eventhub Namespace                                 |
| `eventhub__namespace__authorization__rule`                                                | Eventhub Namespace Authorization Rule              |
| `eventhub__namespace__disaster__recovery__config`                            | Eventhub Namespace Disaster Recovery Config        |
| `express__route__circuit`                                                                                                  | Express Route Circuit                              |
| `express__route__gateway`                                                                                                  | Express Route Gateway                              |
| `firewall`                                                                                                                                             | Firewall                                           |
| `firewall__application__rule__collection`                                                   | Firewall Application Rule Collection               |
| `firewall__ip__configuration`                                                                                      | Firewall Ip Configuration                          |
| `firewall__nat__rule__collection`                                                                           | Firewall Nat Rule Collection                       |
| `firewall__network__rule__collection`                                                               | Firewall Network Rule Collection                   |
| `firewall__policy`                                                                                                                      | Firewall Policy                                    |
| `firewall__policy__rule__collection__group`                                              | Firewall Policy Rule Collection Group              |
| `frontdoor`                                                                                                                                          | Frontdoor                                          |
| `frontdoor__firewall__policy`                                                                                      | Frontdoor Firewall Policy                          |
| `function__app`                                                                                                                               | Function App                                       |
| `hdinsight__hadoop__cluster`                                                                                         | Hdinsight Hadoop Cluster                           |
| `hdinsight__hbase__cluster`                                                                                            | Hdinsight Hbase Cluster                            |
| `hdinsight__interactive__query__cluster`                                                      | Hdinsight Interactive Query Cluster                |
| `hdinsight__kafka__cluster`                                                                                            | Hdinsight Kafka Cluster                            |
| `hdinsight__ml__services__cluster`                                                                        | Hdinsight Ml Services Cluster                      |
| `hdinsight__rserver__cluster`                                                                                      | Hdinsight Rserver Cluster                          |
| `hdinsight__spark__cluster`                                                                                            | Hdinsight Spark Cluster                            |
| `hdinsight__storm__cluster`                                                                                            | Hdinsight Storm Cluster                            |
| `image`                                                                                                                                                      | Image                                              |
| `iotcentral__application`                                                                                                 | Iotcentral Application                             |
| `iothub`                                                                                                                                                   | Iothub                                             |
| `iothub__consumer__group`                                                                                                  | Iothub Consumer Group                              |
| `iothub__dps`                                                                                                                                     | Iothub Dps                                         |
| `iothub__dps__certificate`                                                                                               | Iothub Dps Certificate                             |
| `key__vault`                                                                                                                                        | Key Vault                                          |
| `key__vault__certificate`                                                                                                  | Key Vault Certificate                              |
| `key__vault__key`                                                                                                                          | Key Vault Key                                      |
| `key__vault__secret`                                                                                                                 | Key Vault Secret                                   |
| `kubernetes__cluster`                                                                                                             | Kubernetes Cluster                                 |
| `kusto__cluster`                                                                                                                            | Kusto Cluster                                      |
| `kusto__database`                                                                                                                         | Kusto Database                                     |
| `kusto__eventhub__data__connection`                                                                     | Kusto Eventhub Data Connection                     |
| `lb`                                                                                                                                                               | Lb                                                 |
| `lb__nat__rule`                                                                                                                                | Lb Nat Rule                                        |
| `linux__virtual__machine`                                                                                                  | Linux Virtual Machine                              |
| `linux__virtual__machine__scale__set`                                                                | Linux Virtual Machine Scale Set                    |
| `local__network__gateway`                                                                                                  | Local Network Gateway                              |
| `log__analytics__workspace`                                                                                            | Log Analytics Workspace                            |
| `monitor__action__group`                                                                             | Monitor Action Group     |
| `monitor__scheduled__query__rules__alert`                                                                             | Monitor Scheduled Query Rules Alert     |
| `monitor__autoscale__setting`                                                                             | Monitor Autoscale Settting     |
| `monitor__diagnostic__setting`                                                                             | Monitor Diagnostic Setting     |            
| `logic__app__workflow`                                                                                                           | Logic App Workflow                                 |
| `machine__learning__workspace`                                                                                   | Machine Learning Workspace                         |
| `managed__disk`                                                                                                                               | Managed Disk                                       |
| `maps__account`                                                                                                                               | Maps Account                                       |
| `mariadb__database`                                                                                                                   | Mariadb Database                                   |
| `mariadb__firewall__rule`                                                                                                  | Mariadb Firewall Rule                              |
| `mariadb__server`                                                                                                                         | Mariadb Server                                     |
| `mariadb__virtual__network__rule`                                                                           | Mariadb Virtual Network Rule                       |
| `mssql__database`                                                                                                                         | Mssql Database                                     |
| `mssql__elasticpool`                                                                                                                | Mssql Elasticpool                                  |
| `mssql__server`                                                                                                                               | Mssql Server                                       |
| `mysql__database`                                                                                                                         | Mysql Database                                     |
| `mysql__firewall__rule`                                                                                                        | Mysql Firewall Rule                                |
| `mysql__server`                                                                                                                               | Mysql Server                                       |
| `mysql__virtual__network__rule`                                                                                 | Mysql Virtual Network Rule                         |
| `network__ddos__protection__plan`                                                                           | Network Ddos Protection Plan                       |
| `network__interface`                                                                                                                | Network Interface                                  |
| `network__security__group`                                                                                               | Network Security Group                             |
| `network__security__group__rule`                                                                              | Network Security Group Rule                        |
| `network__security__rule`                                                                                                  | Network Security Rule                              |
| `network__watcher`                                                                                                                      | Network Watcher                                    |
| `notification__hub`                                                                                                                   | Notification Hub                                   |
| `notification__hub__authorization__rule`                                                      | Notification Hub Authorization Rule                |
| `notification__hub__namespace`                                                                                   | Notification Hub Namespace                         |
| `point__to__site__vpn__gateway`                                                                                  | Point To Site Vpn Gateway                          |
| `postgresql__database`                                                                                                          | Postgresql Database                                |
| `postgresql__firewall__rule`                                                                                         | Postgresql Firewall Rule                           |
| `postgresql__server`                                                                                                                | Postgresql Server                                  |
| `postgresql__virtual__network__rule`                                                                  | Postgresql Virtual Network Rule                    |
| `powerbi__embedded`                                                                                                                   | Powerbi Embedded                                   |
| `private__dns__a__record`                                                                                                   | Private Dns A Record                               |
| `private__dns__aaaa__record`                                                                                          | Private Dns Aaaa Record                            |
| `private__dns__cname__record`                                                                                       | Private Dns Cname Record                           |
| `private__dns__mx__record`                                                                                                | Private Dns Mx Record                              |
| `private__dns__ptr__record`                                                                                             | Private Dns Ptr Record                             |
| `private__dns__srv__record`                                                                                             | Private Dns Srv Record                             |
| `private__dns__txt__record`                                                                                             | Private Dns Txt Record                             |
| `private__dns__zone`                                                                                                                 | Private Dns Zone                                   |
| `private__dns__zone__group`                                                                                             | Private Dns Zone Group                             |
| `private__endpoint`                                                                                                                   | Private Endpoint                                   |
| `private__link__service`                                                                                                     | Private Link Service                               |
| `private__service__connection`                                                                                   | Private Service Connection                         |
| `proximity__placement__group`                                                                                      | Proximity Placement Group                          |
| `public__ip`                                                                                                                                        | Public Ip                                          |
| `public__ip__prefix`                                                                                                                 | Public Ip Prefix                                   |
| `recovery__services__vault`                                                                                            | Recovery Services Vault                            |
| `redis__cache`                                                                                                                                  | Redis Cache                                        |
| `redis__firewall__rule`                                                                                                        | Redis Firewall Rule                                |
| `relay__hybrid__connection`                                                                                            | Relay Hybrid Connection                            |
| `relay__namespace`                                                                                                                      | Relay Namespace                                    |
| `resource__group`                                                                                                                         | Resource Group                                     |
| `role__assignment`                                                                                                                      | Role Assignment                                    |
| `role__definition`                                                                                                                      | Role Definition                                    |
| `route`                                                                                                                                                      | Route                                              |
| `route__table`                                                                                                                                  | Route Table                                        |
| `search__service`                                                                                                                         | Search Service                                     |
| `service__fabric__cluster`                                                                                               | Service Fabric Cluster                             |
| `servicebus__namespace`                                                                                                       | Servicebus Namespace                               |
| `servicebus__namespace__authorization__rule`                                          | Servicebus Namespace Authorization Rule            |
| `servicebus__queue`                                                                                                                   | Servicebus Queue                                   |
| `servicebus__queue__authorization__rule`                                                      | Servicebus Queue Authorization Rule                |
| `servicebus__subscription`                                                                                              | Servicebus Subscription                            |
| `servicebus__subscription__rule`                                                                             | Servicebus Subscription Rule                       |
| `servicebus__topic`                                                                                                                   | Servicebus Topic                                   |
| `servicebus__topic__authorization__rule`                                                      | Servicebus Topic Authorization Rule                |
| `shared__image`                                                                                                                               | Shared Image                                       |
| `shared__image__gallery`                                                                                                     | Shared Image Gallery                               |
| `signalr__service`                                                                                                                      | Signalr Service                                    |
| `snapshots`                                                                                                                                          | Snapshots                                          |
| `sql__elasticpool`                                                                                                                      | Sql Elasticpool                                    |
| `sql__failover__group`                                                                                                           | Sql Failover Group                                 |
| `sql__firewall__rule`                                                                                                              | Sql Firewall Rule                                  |
| `sql__server`                                                                                                                                     | Sql Server                                         |
| `storage__account`                                                                                                                      | Storage Account                                    |
| `storage__blob`                                                                                                                               | Storage Blob                                       |
| `storage__container`                                                                                                                | Storage Container                                  |
| `storage__data__lake__gen2__filesystem`                                                          | Storage Data Lake Gen2 Filesystem                  |
| `storage__queue`                                                                                                                            | Storage Queue                                      |
| `storage__share`                                                                                                                            | Storage Share                                      |
| `storage__share__directory`                                                                                            | Storage Share Directory                            |
| `storage__table`                                                                                                                            | Storage Table                                      |
| `stream__analytics__function__javascript__udf`                                     | Stream Analytics Function Javascript Udf           |
| `stream__analytics__job`                                                                                                     | Stream Analytics Job                               |
| `stream__analytics__output__blob`                                                                           | Stream Analytics Output Blob                       |
| `stream__analytics__output__eventhub`                                                               | Stream Analytics Output Eventhub                   |
| `stream__analytics__output__mssql`                                                                        | Stream Analytics Output Mssql                      |
| `stream__analytics__output__servicebus__queue`                                     | Stream Analytics Output Servicebus Queue           |
| `stream__analytics__output__servicebus__topic`                                     | Stream Analytics Output Servicebus Topic           |
| `stream__analytics__reference__input__blob`                                              | Stream Analytics Reference Input Blob              |
| `stream__analytics__stream__input__blob`                                                       | Stream Analytics Stream Input Blob                 |
| `stream__analytics__stream__input__eventhub`                                           | Stream Analytics Stream Input Eventhub             |
| `stream__analytics__stream__input__iothub`                                                 | Stream Analytics Stream Input Iothub               |
| `subnet`                                                                                                                                                   | Subnet                                             |
| `template__deployment`                                                                                                          | Template Deployment                                |
| `traffic__manager__profile`                                                                                            | Traffic Manager Profile                            |
| `unique-seed`                                                                                                                                    | n/a                                                |
| `user__assigned__identity`                                                                                               | User Assigned Identity                             |
| `validation`                                                                                                                                       | n/a                                                |
| `virtual__machine`                                                                                                                      | Virtual Machine                                    |
| `virtual__machine__extension`                                                                                      | Virtual Machine Extension                          |
| `virtual__machine__scale__set`                                                                                    | Virtual Machine Scale Set                          |
| `virtual__machine__scale__set__extension`                                                    | Virtual Machine Scale Set Extension                |
| `virtual__network`                                                                                                                      | Virtual Network                                    |
| `virtual__network__gateway`                                                                                            | Virtual Network Gateway                            |
| `virtual__network__gateway__connection`                                                         | Virtual Network Gateway Connection                 |
| `virtual__network__peering`                                                                                            | Virtual Network Peering                            |
| `virtual__wan`                                                                                                                                  | Virtual Wan                                        |
| `windows__virtual__machine`                                                                                            | Windows Virtual Machine                            |
| `windows__virtual__machine__scale__set`                                                          | Windows Virtual Machine Scale Set                  |
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