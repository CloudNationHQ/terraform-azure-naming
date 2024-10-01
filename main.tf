terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
  required_version = "~> 1.0"
}

resource "random_string" "main" {
  length  = 60
  special = false
  upper   = false
  numeric = var.unique-include-numbers
}

resource "random_string" "first_letter" {
  length  = 1
  special = false
  upper   = false
  numeric = false
}

locals {
  // adding a first letter to guarantee that you always start with a letter
  random_safe_generation = join("", [random_string.first_letter.result, random_string.main.result])
  random                 = substr(coalesce(var.unique-seed, local.random_safe_generation), 0, var.unique-length)
  prefix                 = join("-", var.prefix)
  prefix_safe            = lower(join("", var.prefix))
  suffix                 = join("-", var.suffix)
  suffix_unique          = join("-", concat(var.suffix, [local.random]))
  suffix_safe            = lower(join("", var.suffix))
  suffix_unique_safe     = lower(join("", concat(var.suffix, [local.random])))
  // Names based on the recommendations of
  // https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
  az = {
    aadb2c_directory = {
      name        = substr(join("-", compact([local.prefix, "aadb2c", local.suffix])), 0, 75)
      name_unique = substr(join("-", compact([local.prefix, "aadb2c", local.suffix_unique])), 0, 75)
      dashes      = true
      slug        = "aadb2c"
      min_length  = 1
      max_length  = 75
      scope       = "global"
      regex       = "^[a-zA-Z0-9-]{1,75}$"
    }
    aks_node_pool_linux = {
      name        = substr(join("", compact([local.prefix_safe, "npl", local.suffix_safe])), 0, 11)
      name_unique = substr(join("", compact([local.prefix_safe, "npl", local.suffix_unique_safe])), 0, 11)
      dashes      = false
      slug        = "npl"
      min_length  = 1
      max_length  = 11
      scope       = "parent"
      regex       = "^[a-z][a-z0-9]{0,10}$"
    }
    aks_node_pool_windows = {
      name        = substr(join("", compact([local.prefix_safe, "npw", local.suffix_safe])), 0, 6)
      name_unique = substr(join("", compact([local.prefix_safe, "npw", local.suffix_unique_safe])), 0, 6)
      dashes      = false
      slug        = "npw"
      min_length  = 1
      max_length  = 6
      scope       = "parent"
      regex       = "^[a-z][a-z0-9]{0,5}$"
    }
    analysis_services_server = {
      name        = substr(join("", compact([local.prefix_safe, "as", local.suffix_safe])), 0, 63)
      name_unique = substr(join("", compact([local.prefix_safe, "as", local.suffix_unique_safe])), 0, 63)
      dashes      = false
      slug        = "as"
      min_length  = 3
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-z][a-z0-9]{2,62}$"
    }
    api_management = {
      name        = substr(join("", compact([local.prefix_safe, "apim", local.suffix_safe])), 0, 50)
      name_unique = substr(join("", compact([local.prefix_safe, "apim", local.suffix_unique_safe])), 0, 50)
      dashes      = false
      slug        = "apim"
      min_length  = 1
      max_length  = 50
      scope       = "global"
      regex       = "^[a-z][a-zA-Z0-9]{0,49}$"
    }
    api_management_api = {
      name        = substr(join("-", compact([local.prefix, "apimapi", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimapi", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimapi"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_api_operation_tag = {
      name        = substr(join("-", compact([local.prefix, "apimapiopt", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimapiopt", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimapiopt"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_backend = {
      name        = substr(join("-", compact([local.prefix, "apimbe", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimbe", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimbe"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_certificate = {
      name        = substr(join("-", compact([local.prefix, "apimcer", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimcer", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimcer"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_gateway = {
      name        = substr(join("-", compact([local.prefix, "apimgw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimgw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimgw"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_group = {
      name        = substr(join("-", compact([local.prefix, "apimgr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimgr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimgr"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    api_management_logger = {
      name        = substr(join("-", compact([local.prefix, "apimlg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "apimlg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "apimlg"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,78}[a-zA-Z0-9|]$"
    }
    app_configuration = {
      name        = substr(join("-", compact([local.prefix, "appcg", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "appcg", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "appcg"
      min_length  = 5
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9_-]{5,50}$"
    }
    app_service = {
      name        = substr(join("-", compact([local.prefix, "app", local.suffix])), 0, 60)
      name_unique = substr(join("-", compact([local.prefix, "app", local.suffix_unique])), 0, 60)
      dashes      = true
      slug        = "app"
      min_length  = 2
      max_length  = 60
      scope       = "global"
      regex       = "^[a-z0-9][a-zA-Z0-9-]{0,58}[a-z0-9]$"
    }
    app_service_environment = {
      name        = substr(join("-", compact([local.prefix, "ase", local.suffix])), 0, 36)
      name_unique = substr(join("-", compact([local.prefix, "ase", local.suffix_unique])), 0, 36)
      dashes      = true
      slug        = "ase"
      min_length  = 1
      max_length  = 36
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{1,36}$"
    }
    app_service_plan = {
      name        = substr(join("-", compact([local.prefix, "plan", local.suffix])), 0, 40)
      name_unique = substr(join("-", compact([local.prefix, "plan", local.suffix_unique])), 0, 40)
      dashes      = true
      slug        = "plan"
      min_length  = 1
      max_length  = 40
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{1,40}$"
    }
    application_gateway = {
      name        = substr(join("-", compact([local.prefix, "agw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "agw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "agw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9._-]{0,78}[a-zA-Z0-9_]$"
    }
    application_insights = {
      name        = substr(join("-", compact([local.prefix, "appi", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "appi", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "appi"
      min_length  = 10
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^%&?/]{10,260}$"
    }
    application_insights_web_test = {
      name        = substr(join("-", compact([local.prefix, "appiwt", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "appiwt", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "appiwt"
      min_length  = 1
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z][a-zA-Z0-9- ]{0,62}[a-zA-Z0-9]$"
    }
    application_security_group = {
      name        = substr(join("-", compact([local.prefix, "asg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "asg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "asg"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9._-]{0,78}[a-zA-Z0-9_]$"
    }
    automation_account = {
      name        = substr(join("-", compact([local.prefix, "aa", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "aa", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "aa"
      min_length  = 6
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{4,48}[a-zA-Z0-9]$"
    }
    automation_certificate = {
      name        = substr(join("-", compact([local.prefix, "aacert", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aacert", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aacert"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?+/ ]{1,128}$"
    }
    automation_credential = {
      name        = substr(join("-", compact([local.prefix, "aacred", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aacred", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aacred"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?+/ ]{1,128}$"
    }
    automation_job_schedule = {
      name        = substr(join("-", compact([local.prefix, "aajs", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aajs", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aajs"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?+/ ]{1,128}$"
    }
    automation_runbook = {
      name        = substr(join("-", compact([local.prefix, "aarun", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "aarun", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "aarun"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]$"
    }
    automation_schedule = {
      name        = substr(join("-", compact([local.prefix, "aasched", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aasched", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aasched"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?+/ ]{1,128}$"
    }
    automation_variable = {
      name        = substr(join("-", compact([local.prefix, "aavar", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aavar", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aavar"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?+/ ]{1,128}$"
    }
    availability_set = {
      name        = substr(join("-", compact([local.prefix, "avail", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "avail", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "avail"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9._-]{0,78}[a-zA-Z0-9_]$"
    }
    bastion_host = {
      name        = substr(join("-", compact([local.prefix, "bas", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "bas", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "bas"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9._-]{0,78}[a-zA-Z0-9_]$"
    }
    batch_account = {
      name        = substr(join("", compact([local.prefix_safe, "ba", local.suffix_safe])), 0, 24)
      name_unique = substr(join("", compact([local.prefix_safe, "ba", local.suffix_unique_safe])), 0, 24)
      dashes      = false
      slug        = "ba"
      min_length  = 3
      max_length  = 24
      scope       = "region"
      regex       = "^[a-z0-9]{3,24}$"
    }
    batch_application = {
      name        = substr(join("-", compact([local.prefix, "baapp", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "baapp", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "baapp"
      min_length  = 1
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,64}$"
    }
    batch_certificate = {
      name        = substr(join("-", compact([local.prefix, "bacert", local.suffix])), 0, 45)
      name_unique = substr(join("-", compact([local.prefix, "bacert", local.suffix_unique])), 0, 45)
      dashes      = true
      slug        = "bacert"
      min_length  = 5
      max_length  = 45
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{5,45}$"
    }
    batch_pool = {
      name        = substr(join("-", compact([local.prefix, "bapool", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "bapool", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "bapool"
      min_length  = 3
      max_length  = 24
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{3,24}$"
    }
    bot_channel_directline = {
      name        = substr(join("-", compact([local.prefix, "botline", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botline", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botline"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_channel_email = {
      name        = substr(join("-", compact([local.prefix, "botmail", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botmail", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botmail"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_channel_ms_teams = {
      name        = substr(join("-", compact([local.prefix, "botteams", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botteams", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botteams"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_channel_slack = {
      name        = substr(join("-", compact([local.prefix, "botslack", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botslack", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botslack"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_channels_registration = {
      name        = substr(join("-", compact([local.prefix, "botchan", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botchan", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botchan"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_connection = {
      name        = substr(join("-", compact([local.prefix, "botcon", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "botcon", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "botcon"
      min_length  = 2
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    bot_web_app = {
      name        = substr(join("-", compact([local.prefix, "bot", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "bot", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "bot"
      min_length  = 2
      max_length  = 64
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,62}[a-zA-Z0-9]$"
    }
    cdn_endpoint = {
      name        = substr(join("-", compact([local.prefix, "cdn", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "cdn", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "cdn"
      min_length  = 1
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,48}[a-zA-Z0-9]$"
    }
    cdn_profile = {
      name        = substr(join("-", compact([local.prefix, "cdnprof", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "cdnprof", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "cdnprof"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,258}[a-zA-Z0-9]$"
    }
    cognitive_account = {
      name        = substr(join("-", compact([local.prefix, "cog", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "cog", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "cog"
      min_length  = 2
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,62}[a-zA-Z0-9]$"
    }
    cognitive_deployment = {
      name        = substr(join("-", compact([local.prefix, "cog", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "cog", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "cog"
      min_length  = 2
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{0,62}[a-zA-Z0-9]$"
    }
    communication_service = {
      name        = substr(join("-", compact([local.prefix, "acs", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "acs", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "acs"
      min_length  = 1
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,64}$"
    }
    consumption_budget_resource_group = {
      name        = substr(join("-", compact([local.prefix, "acbrg", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "acbrg", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "acbrg"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{1,63}$"
    }
    consumption_budget_subscription = {
      name        = substr(join("-", compact([local.prefix, "acbs", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "acbs", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "acbs"
      min_length  = 1
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9-_]{1,63}$"
    }
    containerGroups = {
      name        = substr(join("-", compact([local.prefix, "cg", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "cg", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "cg"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]$"
    }
    container_app = {
      name        = substr(join("-", compact([local.prefix, "ca", local.suffix])), 0, 32)
      name_unique = substr(join("-", compact([local.prefix, "ca", local.suffix_unique])), 0, 32)
      dashes      = true
      slug        = "ca"
      min_length  = 2
      max_length  = 32
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,30}[a-zA-Z0-9]$"
    }
    container_app_environment = {
      name        = substr(join("-", compact([local.prefix, "cae", local.suffix])), 0, 60)
      name_unique = substr(join("-", compact([local.prefix, "cae", local.suffix_unique])), 0, 60)
      dashes      = true
      slug        = "cae"
      min_length  = 1
      max_length  = 60
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,58}[a-zA-Z0-9]$"
    }
    container_app_job = {
      name        = substr(join("-", compact([local.prefix, "caj", local.suffix])), 0, 32)
      name_unique = substr(join("-", compact([local.prefix, "caj", local.suffix_unique])), 0, 32)
      dashes      = true
      slug        = "caj"
      min_length  = 2
      max_length  = 32
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,30}[a-zA-Z0-9]$"
    }
    container_group = {
      name        = substr(join("-", compact([local.prefix, "cg", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "cg", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "cg"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]$"
    }
    container_registry = {
      name        = substr(join("", compact([local.prefix_safe, "acr", local.suffix_safe])), 0, 63)
      name_unique = substr(join("", compact([local.prefix_safe, "acr", local.suffix_unique_safe])), 0, 63)
      dashes      = false
      slug        = "acr"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]{1,63}$"
    }
    container_registry_webhook = {
      name        = substr(join("", compact([local.prefix_safe, "crwh", local.suffix_safe])), 0, 50)
      name_unique = substr(join("", compact([local.prefix_safe, "crwh", local.suffix_unique_safe])), 0, 50)
      dashes      = false
      slug        = "crwh"
      min_length  = 1
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]{5,50}$"
    }
    cosmosdb_account = {
      name        = substr(join("-", compact([local.prefix, "cosmos", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "cosmos", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "cosmos"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-z0-9][a-z0-9-_.]{1,61}[a-z0-9]$"
    }
    cosmosdb_cassandra_cluster = {
      name        = substr(join("-", compact([local.prefix, "mcc", local.suffix])), 0, 44)
      name_unique = substr(join("-", compact([local.prefix, "mcc", local.suffix_unique])), 0, 44)
      dashes      = true
      slug        = "mcc"
      min_length  = 1
      max_length  = 44
      scope       = "parent"
      regex       = "^[a-z0-9][a-zA-Z0-9-]{1,61}[a-z0-9]$"
    }
    cosmosdb_cassandra_datacenter = {
      name        = substr(join("-", compact([local.prefix, "mcdc", local.suffix])), 0, 44)
      name_unique = substr(join("-", compact([local.prefix, "mcdc", local.suffix_unique])), 0, 44)
      dashes      = true
      slug        = "mcdc"
      min_length  = 1
      max_length  = 44
      scope       = "parent"
      regex       = "^[a-z0-9][a-zA-Z0-9-]{1,61}[a-z0-9]$"
    }
    cosmosdb_postgres = {
      name        = substr(join("-", compact([local.prefix, "cospos", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "cospos", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "cospos"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-z0-9][a-z0-9-_.]{1,61}[a-z0-9]$"
    }
    custom_provider = {
      name        = substr(join("-", compact([local.prefix, "prov", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "prov", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "prov"
      min_length  = 3
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[^&%?\\/][^&%.?\\/]{0,62}[^&%.?\\/ ]$"
    }
    dashboard = {
      name        = substr(join("-", compact([local.prefix, "dsb", local.suffix])), 0, 160)
      name_unique = substr(join("-", compact([local.prefix, "dsb", local.suffix_unique])), 0, 160)
      dashes      = true
      slug        = "dsb"
      min_length  = 3
      max_length  = 160
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{3,160}$"
    }
    data_collection_endpoint = {
      name        = substr(join("-", compact([local.prefix, "dcr", local.suffix])), 0, 44)
      name_unique = substr(join("-", compact([local.prefix, "dcr", local.suffix_unique])), 0, 44)
      dashes      = true
      slug        = "dcr"
      min_length  = 3
      max_length  = 44
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]([a-zA-Z0-9-]{1,42}[a-zA-Z0-9])?$"
    }
    data_collection_rule = {
      name        = substr(join("-", compact([local.prefix, "dcr", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "dcr", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "dcr"
      min_length  = 1
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9_-]{1,64}$"
    }
    data_factory = {
      name        = substr(join("-", compact([local.prefix, "adf", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adf", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adf"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]$"
    }
    data_factory_dataset_mysql = {
      name        = substr(join("-", compact([local.prefix, "adfmysql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfmysql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfmysql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{1,258}[a-zA-Z0-9]$"
    }
    data_factory_dataset_postgresql = {
      name        = substr(join("-", compact([local.prefix, "adfpsql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfpsql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfpsql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{1,258}[a-zA-Z0-9]$"
    }
    data_factory_dataset_sql_server_table = {
      name        = substr(join("-", compact([local.prefix, "adfmssql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfmssql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfmssql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{1,258}[a-zA-Z0-9]$"
    }
    data_factory_integration_runtime_managed = {
      name        = substr(join("-", compact([local.prefix, "adfir", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adfir", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adfir"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]$"
    }
    data_factory_linked_service_data_lake_storage_gen2 = {
      name        = substr(join("-", compact([local.prefix, "adfsvst", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfsvst", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfsvst"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_factory_linked_service_key_vault = {
      name        = substr(join("-", compact([local.prefix, "adfsvkv", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfsvkv", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfsvkv"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_factory_linked_service_mysql = {
      name        = substr(join("-", compact([local.prefix, "adfsvmysql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfsvmysql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfsvmysql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_factory_linked_service_postgresql = {
      name        = substr(join("-", compact([local.prefix, "adfsvpsql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfsvpsql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfsvpsql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_factory_linked_service_sql_server = {
      name        = substr(join("-", compact([local.prefix, "adfsvmssql", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfsvmssql", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfsvmssql"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_factory_pipeline = {
      name        = substr(join("-", compact([local.prefix, "adfpl", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adfpl", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adfpl"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{1,258}[a-zA-Z0-9]$"
    }
    data_factory_trigger_schedule = {
      name        = substr(join("-", compact([local.prefix, "adftg", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "adftg", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "adftg"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][^<>*%:.?\\\\+\\/]{0,258}$"
    }
    data_lake_analytics_account = {
      name        = substr(join("", compact([local.prefix_safe, "dla", local.suffix_safe])), 0, 24)
      name_unique = substr(join("", compact([local.prefix_safe, "dla", local.suffix_unique_safe])), 0, 24)
      dashes      = false
      slug        = "dla"
      min_length  = 3
      max_length  = 24
      scope       = "global"
      regex       = "^[a-z0-9]{3,24}$"
    }
    data_lake_analytics_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "dlfw", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "dlfw", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "dlfw"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-z0-9-_]{3,50}$"
    }
    data_lake_store = {
      name        = substr(join("", compact([local.prefix_safe, "dls", local.suffix_safe])), 0, 24)
      name_unique = substr(join("", compact([local.prefix_safe, "dls", local.suffix_unique_safe])), 0, 24)
      dashes      = false
      slug        = "dls"
      min_length  = 3
      max_length  = 24
      scope       = "parent"
      regex       = "^[a-z0-9]{3,24}$"
    }
    data_lake_store_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "dlsfw", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "dlsfw", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "dlsfw"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,50}$"
    }
    database_migration_project = {
      name        = substr(join("-", compact([local.prefix, "migr", local.suffix])), 0, 57)
      name_unique = substr(join("-", compact([local.prefix, "migr", local.suffix_unique])), 0, 57)
      dashes      = true
      slug        = "migr"
      min_length  = 2
      max_length  = 57
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_.]{0,55}[a-zA-Z0-9]$"
    }
    database_migration_service = {
      name        = substr(join("-", compact([local.prefix, "dms", local.suffix])), 0, 62)
      name_unique = substr(join("-", compact([local.prefix, "dms", local.suffix_unique])), 0, 62)
      dashes      = true
      slug        = "dms"
      min_length  = 2
      max_length  = 62
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_.]{0,60}[a-zA-Z0-9]$"
    }
    databricks_cluster = {
      name        = substr(join("-", compact([local.prefix, "dbc", local.suffix])), 0, 30)
      name_unique = substr(join("-", compact([local.prefix, "dbc", local.suffix_unique])), 0, 30)
      dashes      = true
      slug        = "dbc"
      min_length  = 3
      max_length  = 30
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,30}$"
    }
    databricks_high_concurrency_cluster = {
      name        = substr(join("-", compact([local.prefix, "dbhcc", local.suffix])), 0, 30)
      name_unique = substr(join("-", compact([local.prefix, "dbhcc", local.suffix_unique])), 0, 30)
      dashes      = true
      slug        = "dbhcc"
      min_length  = 3
      max_length  = 30
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,30}$"
    }
    databricks_standard_cluster = {
      name        = substr(join("-", compact([local.prefix, "dbsc", local.suffix])), 0, 30)
      name_unique = substr(join("-", compact([local.prefix, "dbsc", local.suffix_unique])), 0, 30)
      dashes      = true
      slug        = "dbsc"
      min_length  = 3
      max_length  = 30
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,30}$"
    }
    databricks_workspace = {
      name        = substr(join("-", compact([local.prefix, "dbw", local.suffix])), 0, 30)
      name_unique = substr(join("-", compact([local.prefix, "dbw", local.suffix_unique])), 0, 30)
      dashes      = true
      slug        = "dbw"
      min_length  = 3
      max_length  = 30
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{3,30}$"
    }
    dev_test_lab = {
      name        = substr(join("-", compact([local.prefix, "lab", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "lab", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "lab"
      min_length  = 1
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{1,50}$"
    }
    dev_test_linux_virtual_machine = {
      name        = substr(join("-", compact([local.prefix, "labvm", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "labvm", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "labvm"
      min_length  = 1
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{1,64}$"
    }
    dev_test_windows_virtual_machine = {
      name        = substr(join("-", compact([local.prefix, "labvm", local.suffix])), 0, 15)
      name_unique = substr(join("-", compact([local.prefix, "labvm", local.suffix_unique])), 0, 15)
      dashes      = true
      slug        = "labvm"
      min_length  = 1
      max_length  = 15
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{1,15}$"
    }
    digital_twins_endpoint_eventgrid = {
      name        = substr(join("-", compact([local.prefix, "adteg", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "adteg", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "adteg"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,50}$"
    }
    digital_twins_endpoint_eventhub = {
      name        = substr(join("-", compact([local.prefix, "adteh", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "adteh", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "adteh"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,50}$"
    }
    digital_twins_endpoint_servicebus = {
      name        = substr(join("-", compact([local.prefix, "adtsb", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "adtsb", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "adtsb"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,50}$"
    }
    digital_twins_instance = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    disk_encryption_set = {
      name        = substr(join("-", compact([local.prefix, "des", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "des", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "des"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9_]{1,80}$"
    }
    dns_a_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_aaaa_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_caa_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_cname_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_mx_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_ns_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_ptr_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_txt_record = {
      name        = substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    dns_zone = {
      name        = substr(join("-", compact([local.prefix, "dns", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "dns", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "dns"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,61}[a-zA-Z0-9_]$"
    }
    eventgrid_domain = {
      name        = substr(join("-", compact([local.prefix, "egd", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "egd", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "egd"
      min_length  = 3
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{3,50}$"
    }
    eventgrid_domain_topic = {
      name        = substr(join("-", compact([local.prefix, "egdt", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "egdt", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "egdt"
      min_length  = 3
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{3,50}$"
    }
    eventgrid_event_subscription = {
      name        = substr(join("-", compact([local.prefix, "egs", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "egs", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "egs"
      min_length  = 3
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{3,64}$"
    }
    eventgrid_topic = {
      name        = substr(join("-", compact([local.prefix, "egt", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "egt", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "egt"
      min_length  = 3
      max_length  = 50
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{3,50}$"
    }
    eventhub = {
      name        = substr(join("-", compact([local.prefix, "evh", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "evh", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "evh"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    eventhub_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "ehar", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "ehar", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "ehar"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    eventhub_consumer_group = {
      name        = substr(join("-", compact([local.prefix, "ehcg", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "ehcg", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "ehcg"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    eventhub_namespace = {
      name        = substr(join("-", compact([local.prefix, "ehn", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "ehn", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "ehn"
      min_length  = 1
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{0,48}[a-zA-Z0-9]$"
    }
    eventhub_namespace_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "ehnar", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "ehnar", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "ehnar"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    eventhub_namespace_disaster_recovery_config = {
      name        = substr(join("-", compact([local.prefix, "ehdr", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "ehdr", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "ehdr"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    express_route_circuit = {
      name        = substr(join("-", compact([local.prefix, "erc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "erc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "erc"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    express_route_gateway = {
      name        = substr(join("-", compact([local.prefix, "ergw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "ergw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "ergw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall = {
      name        = substr(join("-", compact([local.prefix, "fw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_application_rule_collection = {
      name        = substr(join("-", compact([local.prefix, "fwapp", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fwapp", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fwapp"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_ip_configuration = {
      name        = substr(join("-", compact([local.prefix, "fwipconf", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fwipconf", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fwipconf"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_nat_rule_collection = {
      name        = substr(join("-", compact([local.prefix, "fwnatrc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fwnatrc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fwnatrc"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_network_rule_collection = {
      name        = substr(join("-", compact([local.prefix, "fwnetrc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fwnetrc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fwnetrc"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_policy = {
      name        = substr(join("-", compact([local.prefix, "afwp", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "afwp", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "afwp"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    firewall_policy_rule_collection_group = {
      name        = substr(join("-", compact([local.prefix, "fwprcg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fwprcg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fwprcg"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    frontdoor = {
      name        = substr(join("-", compact([local.prefix, "fd", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "fd", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "fd"
      min_length  = 5
      max_length  = 64
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{3,62}[a-zA-Z0-9]$"
    }
    frontdoor_firewall_policy = {
      name        = substr(join("-", compact([local.prefix, "fdfw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fdfw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fdfw"
      min_length  = 1
      max_length  = 80
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    function_app = {
      name        = substr(join("-", compact([local.prefix, "func", local.suffix])), 0, 60)
      name_unique = substr(join("-", compact([local.prefix, "func", local.suffix_unique])), 0, 60)
      dashes      = true
      slug        = "func"
      min_length  = 2
      max_length  = 60
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{0,58}[a-zA-Z0-9]$"
    }
    function_app_slot = {
      name        = substr(join("-", compact([local.prefix, "fas", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "fas", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "fas"
      min_length  = 2
      max_length  = 59
      scope       = "global"
      regex       = "^[0-9A-Za-z][0-9A-Za-z-]{0,57}[0-9a-zA-Z]$"
    }
    hdinsight_hadoop_cluster = {
      name        = substr(join("-", compact([local.prefix, "hadoop", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "hadoop", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "hadoop"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_hbase_cluster = {
      name        = substr(join("-", compact([local.prefix, "hbase", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "hbase", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "hbase"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_interactive_query_cluster = {
      name        = substr(join("-", compact([local.prefix, "iqr", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "iqr", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "iqr"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_kafka_cluster = {
      name        = substr(join("-", compact([local.prefix, "kafka", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "kafka", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "kafka"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_ml_services_cluster = {
      name        = substr(join("-", compact([local.prefix, "mls", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "mls", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "mls"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_rserver_cluster = {
      name        = substr(join("-", compact([local.prefix, "rsv", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "rsv", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "rsv"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_spark_cluster = {
      name        = substr(join("-", compact([local.prefix, "spark", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "spark", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "spark"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    hdinsight_storm_cluster = {
      name        = substr(join("-", compact([local.prefix, "storm", local.suffix])), 0, 59)
      name_unique = substr(join("-", compact([local.prefix, "storm", local.suffix_unique])), 0, 59)
      dashes      = true
      slug        = "storm"
      min_length  = 3
      max_length  = 59
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,57}[a-zA-Z0-9]$"
    }
    healthcare_dicom_service = {
      name        = substr(join("-", compact([local.prefix, "dicom", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "dicom", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "dicom"
      min_length  = 3
      max_length  = 24
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,22}[a-z0-9]$"
    }
    healthcare_fhir_service = {
      name        = substr(join("-", compact([local.prefix, "fhir", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "fhir", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "fhir"
      min_length  = 3
      max_length  = 24
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,22}[a-z0-9]$"
    }
    healthcare_medtech_service = {
      name        = substr(join("-", compact([local.prefix, "medtech", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "medtech", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "medtech"
      min_length  = 3
      max_length  = 24
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,22}[a-z0-9]$"
    }
    healthcare_service = {
      name        = substr(join("-", compact([local.prefix, "hcasvc", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "hcasvc", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "hcasvc"
      min_length  = 3
      max_length  = 24
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{1,22}[a-z0-9]$"
    }
    healthcare_workspace = {
      name        = substr(join("", compact([local.prefix_safe, "hcw", local.suffix_safe])), 0, 24)
      name_unique = substr(join("", compact([local.prefix_safe, "hcw", local.suffix_unique_safe])), 0, 24)
      dashes      = false
      slug        = "hcw"
      min_length  = 3
      max_length  = 24
      scope       = "global"
      regex       = "^[a-z0-9]{3,24}$"
    }
    image = {
      name        = substr(join("-", compact([local.prefix, "img", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "img", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "img"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\._-]{0,78}[a-zA-Z0-9_]$"
    }
    integration_service_environment = {
      name        = substr(join("-", compact([local.prefix, "lappise", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lappise", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lappise"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\-\\\\_\\\\.]{1,80}$"
    }
    iot_security_device_group = {
      name        = substr(join("-", compact([local.prefix, "iotdg", local.suffix])), 0, 32)
      name_unique = substr(join("-", compact([local.prefix, "iotdg", local.suffix_unique])), 0, 32)
      dashes      = true
      slug        = "iotdg"
      min_length  = 1
      max_length  = 32
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-._]{1,32}$"
    }
    iot_security_solution = {
      name        = substr(join("-", compact([local.prefix, "iotss", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "iotss", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "iotss"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{1,260}$"
    }
    iotcentral_application = {
      name        = substr(join("-", compact([local.prefix, "iotapp", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "iotapp", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "iotapp"
      min_length  = 2
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{0,61}[a-z0-9]$"
    }
    iothub = {
      name        = substr(join("-", compact([local.prefix, "iot", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "iot", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "iot"
      min_length  = 3
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,47}[a-z0-9]$"
    }
    iothub_consumer_group = {
      name        = substr(join("-", compact([local.prefix, "iotcg", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "iotcg", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "iotcg"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-._]{1,50}$"
    }
    iothub_dps = {
      name        = substr(join("-", compact([local.prefix, "dps", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "dps", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "dps"
      min_length  = 3
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-]{3,63}[a-zA-Z0-9]$"
    }
    iothub_dps_certificate = {
      name        = substr(join("-", compact([local.prefix, "dpscert", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "dpscert", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "dpscert"
      min_length  = 1
      max_length  = 64
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-._]{1,64}$"
    }
    ip_group = {
      name        = substr(join("-", compact([local.prefix, "ipgr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "ipgr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "ipgr"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    key_vault = {
      name        = substr(join("-", compact([local.prefix, "kv", local.suffix])), 0, 24)
      name_unique = substr(join("-", compact([local.prefix, "kv", local.suffix_unique])), 0, 24)
      dashes      = true
      slug        = "kv"
      min_length  = 3
      max_length  = 24
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{1,22}[a-zA-Z0-9]$"
    }
    key_vault_certificate = {
      name        = substr(join("-", compact([local.prefix, "kvc", local.suffix])), 0, 127)
      name_unique = substr(join("-", compact([local.prefix, "kvc", local.suffix_unique])), 0, 127)
      dashes      = true
      slug        = "kvc"
      min_length  = 1
      max_length  = 127
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{1,127}$"
    }
    key_vault_key = {
      name        = substr(join("-", compact([local.prefix, "kvk", local.suffix])), 0, 127)
      name_unique = substr(join("-", compact([local.prefix, "kvk", local.suffix_unique])), 0, 127)
      dashes      = true
      slug        = "kvk"
      min_length  = 1
      max_length  = 127
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{1,127}$"
    }
    key_vault_secret = {
      name        = substr(join("-", compact([local.prefix, "kvs", local.suffix])), 0, 127)
      name_unique = substr(join("-", compact([local.prefix, "kvs", local.suffix_unique])), 0, 127)
      dashes      = true
      slug        = "kvs"
      min_length  = 1
      max_length  = 127
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{1,127}$"
    }
    kubernetes_cluster = {
      name        = substr(join("-", compact([local.prefix, "aks", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "aks", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "aks"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_.]{0,61}[a-zA-Z0-9]$"
    }
    kubernetes_fleet_manager = {
      name        = substr(join("-", compact([local.prefix, "fleet", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "fleet", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "fleet"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[0-9a-z]([0-9a-z-]{0,61}[0-9a-z])?$"
    }
    kusto_cluster = {
      name        = substr(join("", compact([local.prefix_safe, "kc", local.suffix_safe])), 0, 22)
      name_unique = substr(join("", compact([local.prefix_safe, "kc", local.suffix_unique_safe])), 0, 22)
      dashes      = false
      slug        = "kc"
      min_length  = 4
      max_length  = 22
      scope       = "global"
      regex       = "^[a-z][a-z0-9]{3,21}$"
    }
    kusto_database = {
      name        = substr(join("-", compact([local.prefix, "kdb", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "kdb", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "kdb"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9- .]{1,260}$"
    }
    kusto_eventhub_data_connection = {
      name        = substr(join("-", compact([local.prefix, "kehc", local.suffix])), 0, 40)
      name_unique = substr(join("-", compact([local.prefix, "kehc", local.suffix_unique])), 0, 40)
      dashes      = true
      slug        = "kehc"
      min_length  = 1
      max_length  = 40
      scope       = "parent"
      regex       = "^[a-zA-Z0-9- .]{1,40}$"
    }
    lb = {
      name        = substr(join("-", compact([local.prefix, "lb", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lb", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lb"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    lb_backend_address_pool = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    lb_backend_pool = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    lb_nat_pool = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    lb_nat_rule = {
      name        = substr(join("-", compact([local.prefix, "lbnatrl", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lbnatrl", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lbnatrl"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    lb_outbound_rule = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    lb_probe = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    lb_rule = {
      name        = substr(join("-", compact([local.prefix, "adt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "adt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "adt"
      min_length  = 4
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    linux_virtual_machine = {
      name        = substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "vm", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "vm"
      min_length  = 1
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,62}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
    linux_virtual_machine_scale_set = {
      name        = substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "vmss", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "vmss"
      min_length  = 1
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,62}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
    load_test = {
      name        = substr(join("-", compact([local.prefix, "load", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "load", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "load"
      min_length  = 1
      max_length  = 64
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-_]{0,62}[a-zA-Z0-9|]$"
    }
    local_network_gateway = {
      name        = substr(join("-", compact([local.prefix, "lgw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lgw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lgw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    log_analytics_cluster = {
      name        = substr(join("-", compact([local.prefix, "logc", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "logc", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "logc"
      min_length  = 4
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{2,61}[a-zA-Z0-9]$"
    }
    log_analytics_storage_insights = {
      name        = substr(join("-", compact([local.prefix, "lasi", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "lasi", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "lasi"
      min_length  = 4
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{2,61}[a-zA-Z0-9]$"
    }
    log_analytics_workspace = {
      name        = substr(join("-", compact([local.prefix, "log", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "log", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "log"
      min_length  = 4
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{2,61}[a-zA-Z0-9]$"
    }
    logic_app_action_custom = {
      name        = substr(join("-", compact([local.prefix, "lappac", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lappac", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lappac"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_action_http = {
      name        = substr(join("-", compact([local.prefix, "lappah", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lappah", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lappah"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_integration_account = {
      name        = substr(join("-", compact([local.prefix, "lappia", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lappia", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lappia"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_trigger_custom = {
      name        = substr(join("-", compact([local.prefix, "lapptc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lapptc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lapptc"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_trigger_http_request = {
      name        = substr(join("-", compact([local.prefix, "lappth", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lappth", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lappth"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_trigger_recurrence = {
      name        = substr(join("-", compact([local.prefix, "lapptc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "lapptc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "lapptc"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z\\\\(\\\\-\\\\)\\\\_\\\\.]{1,80}$"
    }
    logic_app_workflow = {
      name        = substr(join("-", compact([local.prefix, "logic", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "logic", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "logic"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    machine_learning_compute_instance = {
      name        = substr(join("-", compact([local.prefix, "amlci", local.suffix])), 0, 16)
      name_unique = substr(join("-", compact([local.prefix, "amlci", local.suffix_unique])), 0, 16)
      dashes      = true
      slug        = "amlci"
      min_length  = 1
      max_length  = 16
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-z0-9-]{0,14}[a-zA-Z0-9]$"
    }
    machine_learning_workspace = {
      name        = substr(join("-", compact([local.prefix, "mlw", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "mlw", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "mlw"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{1,259}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    maintenance_configuration = {
      name        = substr(join("-", compact([local.prefix, "mcf", local.suffix])), 0, 60)
      name_unique = substr(join("-", compact([local.prefix, "mcf", local.suffix_unique])), 0, 60)
      dashes      = true
      slug        = "mcf"
      min_length  = 1
      max_length  = 60
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,58}[a-zA-Z0-9_]$"
    }
    managed_disk = {
      name        = substr(join("-", compact([local.prefix, "dsk", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dsk", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dsk"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9_]{1,80}$"
    }
    maps_account = {
      name        = substr(join("-", compact([local.prefix, "map", local.suffix])), 0, 98)
      name_unique = substr(join("-", compact([local.prefix, "map", local.suffix_unique])), 0, 98)
      dashes      = true
      slug        = "map"
      min_length  = 1
      max_length  = 98
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-.]{0,96}[a-zA-Z0-9]$"
    }
    mariadb_database = {
      name        = substr(join("-", compact([local.prefix, "mariadb", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "mariadb", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "mariadb"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,63}$"
    }
    mariadb_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "mariafw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "mariafw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "mariafw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,128}$"
    }
    mariadb_server = {
      name        = substr(join("-", compact([local.prefix, "maria", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "maria", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "maria"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-za-z0-9-]{1,61}[a-z0-9]$"
    }
    mariadb_virtual_network_rule = {
      name        = substr(join("-", compact([local.prefix, "mariavn", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "mariavn", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "mariavn"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,128}$"
    }
    monitor_action_group = {
      name        = substr(join("-", compact([local.prefix, "mag", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "mag", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "mag"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^%&\\\\?\\\\+\\\\/]{1,259}[^%&\\\\?\\\\+\\\\/ ]$"
    }
    monitor_autoscale_setting = {
      name        = substr(join("-", compact([local.prefix, "mas", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "mas", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "mas"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^<>%\\\\&\\\\?\\\\+\\\\/]{1,259}[^<>%\\\\&\\\\?\\\\+\\\\/ ]$"
    }
    monitor_data_collection_endpoint = {
      name        = substr(join("-", compact([local.prefix, "dce", local.suffix])), 0, 44)
      name_unique = substr(join("-", compact([local.prefix, "dce", local.suffix_unique])), 0, 44)
      dashes      = true
      slug        = "dce"
      min_length  = 3
      max_length  = 44
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,42}[a-zA-Z0-9]$"
    }
    monitor_diagnostic_setting = {
      name        = substr(join("-", compact([local.prefix, "mds", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "mds", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "mds"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^*<>%:&\\\\?\\\\+\\\\/]{1,259}[^*<>%:&\\\\?\\\\+\\\\/ ]$"
    }
    monitor_private_link_scope = {
      name        = substr(join("-", compact([local.prefix, "ampls", local.suffix])), 0, 255)
      name_unique = substr(join("-", compact([local.prefix, "ampls", local.suffix_unique])), 0, 255)
      dashes      = true
      slug        = "ampls"
      min_length  = 1
      max_length  = 255
      scope       = "resourceGroup"
      regex       = "^[0-9A-Za-z-._()]{0,254}[0-9A-Za-z-_()]$"
    }
    monitor_scheduled_query_rules_alert = {
      name        = substr(join("-", compact([local.prefix, "msqa", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "msqa", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "msqa"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^*<>%:{}&\\#.,\\\\?\\\\+\\\\/]{1,259}[^*<>%:{}&\\#.,\\\\?\\\\+\\\\/ ]$"
    }
    mssql_database = {
      name        = substr(join("-", compact([local.prefix, "sqldb", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "sqldb", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "sqldb"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{1,127}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    mssql_elasticpool = {
      name        = substr(join("-", compact([local.prefix, "sqlep", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "sqlep", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "sqlep"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{1,127}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    mssql_server = {
      name        = substr(join("-", compact([local.prefix, "sql", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sql", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sql"
      min_length  = 1
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{0,61}[a-z0-9]$"
    }
    mysql_database = {
      name        = substr(join("-", compact([local.prefix, "mysqldb", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "mysqldb", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "mysqldb"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,63}$"
    }
    mysql_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "mysqlfw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "mysqlfw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "mysqlfw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,128}$"
    }
    mysql_flexible_server = {
      name        = substr(join("-", compact([local.prefix, "mysqlf", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "mysqlf", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "mysqlf"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-za-z0-9-]{1,61}[a-z0-9]$"
    }
    mysql_flexible_server_database = {
      name        = substr(join("-", compact([local.prefix, "mysqlfdb", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "mysqlfdb", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "mysqlfdb"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,63}$"
    }
    mysql_flexible_server_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "mysqlffw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "mysqlffw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "mysqlffw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,128}$"
    }
    mysql_server = {
      name        = substr(join("-", compact([local.prefix, "mysql", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "mysql", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "mysql"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-za-z0-9-]{1,61}[a-z0-9]$"
    }
    mysql_virtual_network_rule = {
      name        = substr(join("-", compact([local.prefix, "mysqlvn", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "mysqlvn", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "mysqlvn"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{1,128}$"
    }
    netapp_account = {
      name        = substr(join("-", compact([local.prefix, "ana", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "ana", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "ana"
      min_length  = 1
      max_length  = 128
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_]{0,126}[a-zA-Z0-9]$"
    }
    netapp_pool = {
      name        = substr(join("-", compact([local.prefix, "anp", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "anp", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "anp"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9]$"
    }
    netapp_snapshot = {
      name        = substr(join("-", compact([local.prefix, "ans", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "ans", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "ans"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9]$"
    }
    netapp_volume = {
      name        = substr(join("-", compact([local.prefix, "anv", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "anv", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "anv"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9]$"
    }
    network_ddos_protection_plan = {
      name        = substr(join("-", compact([local.prefix, "ddospp", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "ddospp", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "ddospp"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_interface = {
      name        = substr(join("-", compact([local.prefix, "nic", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "nic", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "nic"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_security_group = {
      name        = substr(join("-", compact([local.prefix, "nsg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "nsg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "nsg"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_security_group_rule = {
      name        = substr(join("-", compact([local.prefix, "nsgr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "nsgr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "nsgr"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_security_rule = {
      name        = substr(join("-", compact([local.prefix, "nsgr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "nsgr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "nsgr"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_watcher = {
      name        = substr(join("-", compact([local.prefix, "nw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "nw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "nw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    network_watcher_flow_log = {
      name        = substr(join("-", compact([local.prefix, "fl", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "fl", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "fl"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    nginx_deployment = {
      name        = substr(join("-", compact([local.prefix, "nginx", local.suffix])), 0, 30)
      name_unique = substr(join("-", compact([local.prefix, "nginx", local.suffix_unique])), 0, 30)
      dashes      = true
      slug        = "nginx"
      min_length  = 1
      max_length  = 30
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]([a-zA-Z0-9-]{0,28}[a-zA-Z0-9])?$"
    }
    notification_hub = {
      name        = substr(join("-", compact([local.prefix, "nh", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "nh", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "nh"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,259}$"
    }
    notification_hub_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "nhar", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "nhar", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "nhar"
      min_length  = 1
      max_length  = 256
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,255}$"
    }
    notification_hub_namespace = {
      name        = substr(join("-", compact([local.prefix, "nhns", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "nhns", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "nhns"
      min_length  = 6
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{4,48}[a-zA-Z0-9]$"
    }
    point_to_site_vpn_gateway = {
      name        = substr(join("-", compact([local.prefix, "vpngw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vpngw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vpngw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    portal_dashboard = {
      name        = substr(join("-", compact([local.prefix, "dsb", local.suffix])), 0, 160)
      name_unique = substr(join("-", compact([local.prefix, "dsb", local.suffix_unique])), 0, 160)
      dashes      = true
      slug        = "dsb"
      min_length  = 3
      max_length  = 160
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-]{3,160}$"
    }
    postgresql_database = {
      name        = substr(join("-", compact([local.prefix, "psqldb", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "psqldb", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "psqldb"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    postgresql_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "psqlfw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "psqlfw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "psqlfw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,128}$"
    }
    postgresql_flexible_server = {
      name        = substr(join("-", compact([local.prefix, "psqlf", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "psqlf", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "psqlf"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    postgresql_flexible_server_database = {
      name        = substr(join("-", compact([local.prefix, "psqlfdb", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "psqlfdb", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "psqlfdb"
      min_length  = 1
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,63}$"
    }
    postgresql_flexible_server_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "psqlffw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "psqlffw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "psqlffw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,128}$"
    }
    postgresql_server = {
      name        = substr(join("-", compact([local.prefix, "psql", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "psql", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "psql"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-za-z0-9-]{1,61}[a-z0-9]$"
    }
    postgresql_virtual_network_rule = {
      name        = substr(join("-", compact([local.prefix, "psqlvn", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "psqlvn", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "psqlvn"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z0-9_-]{1,128}$"
    }
    powerbi_embedded = {
      name        = substr(join("-", compact([local.prefix, "pbi", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "pbi", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "pbi"
      min_length  = 3
      max_length  = 63
      scope       = "region"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]$"
    }
    private_dns_a_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_aaaa_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_cname_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_mx_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_ptr_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_resolver = {
      name        = substr(join("-", compact([local.prefix, "dnspr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnspr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnspr"
      min_length  = 3
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{1,78}[a-zA-Z0-9_]$"
    }
    private_dns_resolver_dns_forwarding_ruleset = {
      name        = substr(join("-", compact([local.prefix, "dnsfwrs", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsfwrs", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsfwrs"
      min_length  = 2
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z][a-zA-Z0-9_-]{0,78}[a-zA-Z0-9]$"
    }
    private_dns_resolver_forwarding_rule = {
      name        = substr(join("-", compact([local.prefix, "dnsfwr", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsfwr", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsfwr"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9]([a-zA-Z0-9_-]{0,78}[a-zA-Z0-9])?$"
    }
    private_dns_resolver_inbound_endpoint = {
      name        = substr(join("-", compact([local.prefix, "dnsprie", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsprie", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsprie"
      min_length  = 3
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z][a-zA-Z0-9_-]{1,78}[a-zA-Z0-9]$"
    }
    private_dns_resolver_outbound_endpoint = {
      name        = substr(join("-", compact([local.prefix, "dnsproe", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsproe", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsproe"
      min_length  = 3
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z][a-zA-Z0-9_-]{1,78}[a-zA-Z0-9]$"
    }
    private_dns_resolver_virtual_network_link = {
      name        = substr(join("-", compact([local.prefix, "dnsfwrsvnetl", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "dnsfwrsvnetl", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "dnsfwrsvnetl"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9]([a-zA-Z0-9_-]{0,78}[a-zA-Z0-9])?$"
    }
    private_dns_srv_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_txt_record = {
      name        = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnsrec", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnsrec"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_dns_zone = {
      name        = substr(join("-", compact([local.prefix, "pdns", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "pdns", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "pdns"
      min_length  = 1
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,61}[a-zA-Z0-9_]$"
    }
    private_dns_zone_group = {
      name        = substr(join("-", compact([local.prefix, "pdnszg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pdnszg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pdnszg"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_endpoint = {
      name        = substr(join("-", compact([local.prefix, "pe", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "pe", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "pe"
      min_length  = 2
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,62}[a-zA-Z0-9_]$"
    }
    private_link_service = {
      name        = substr(join("-", compact([local.prefix, "pls", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pls", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pls"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    private_service_connection = {
      name        = substr(join("-", compact([local.prefix, "psc", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "psc", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "psc"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\-._]{0,78}[a-zA-Z0-9_]$"
    }
    proximity_placement_group = {
      name        = substr(join("-", compact([local.prefix, "ppg", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "ppg", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "ppg"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    public_ip = {
      name        = substr(join("-", compact([local.prefix, "pip", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pip", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pip"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    public_ip_prefix = {
      name        = substr(join("-", compact([local.prefix, "pippf", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "pippf", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "pippf"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    purview_account = {
      name        = substr(join("-", compact([local.prefix, "purv", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "purv", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "purv"
      min_length  = 3
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9_-]$"
    }
    recovery_services_vault = {
      name        = substr(join("-", compact([local.prefix, "rsv", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "rsv", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "rsv"
      min_length  = 2
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{1,48}[a-zA-Z0-9]$"
    }
    recovery_services_vault_backup_policy = {
      name        = substr(join("-", compact([local.prefix, "rsvbp", local.suffix])), 0, 150)
      name_unique = substr(join("-", compact([local.prefix, "rsvbp", local.suffix_unique])), 0, 150)
      dashes      = true
      slug        = "rsvbp"
      min_length  = 3
      max_length  = 150
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{1,148}[a-zA-Z0-9]$"
    }
    redhat_openshift_cluster = {
      name        = substr(join("", compact([local.prefix_safe, "aroc", local.suffix_safe])), 0, 30)
      name_unique = substr(join("", compact([local.prefix_safe, "aroc", local.suffix_unique_safe])), 0, 30)
      dashes      = false
      slug        = "aroc"
      min_length  = 1
      max_length  = 30
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]{1,30}$"
    }
    redhat_openshift_domain = {
      name        = substr(join("", compact([local.prefix_safe, "arod", local.suffix_safe])), 0, 30)
      name_unique = substr(join("", compact([local.prefix_safe, "arod", local.suffix_unique_safe])), 0, 30)
      dashes      = false
      slug        = "arod"
      min_length  = 1
      max_length  = 30
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9]{1,30}$"
    }
    redis_cache = {
      name        = substr(join("-", compact([local.prefix, "redis", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "redis", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "redis"
      min_length  = 1
      max_length  = 63
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]$"
    }
    redis_firewall_rule = {
      name        = substr(join("", compact([local.prefix_safe, "redisfw", local.suffix_safe])), 0, 256)
      name_unique = substr(join("", compact([local.prefix_safe, "redisfw", local.suffix_unique_safe])), 0, 256)
      dashes      = false
      slug        = "redisfw"
      min_length  = 1
      max_length  = 256
      scope       = "parent"
      regex       = "^[a-zA-Z0-9]{1,256}$"
    }
    relay_hybrid_connection = {
      name        = substr(join("-", compact([local.prefix, "rlhc", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "rlhc", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "rlhc"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,258}[a-zA-Z0-9]$"
    }
    relay_namespace = {
      name        = substr(join("-", compact([local.prefix, "rln", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "rln", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "rln"
      min_length  = 6
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{4,48}[a-zA-Z0-9]$"
    }
    resource_group = {
      name        = substr(join("-", compact([local.prefix, "rg", local.suffix])), 0, 90)
      name_unique = substr(join("-", compact([local.prefix, "rg", local.suffix_unique])), 0, 90)
      dashes      = true
      slug        = "rg"
      min_length  = 1
      max_length  = 90
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9-._\\(\\)]{1,89}[a-zA-Z0-9-_\\(\\)]$"
    }
    resource_group_policy_assignment = {
      name        = substr(join("-", compact([local.prefix, "argpa", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "argpa", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "argpa"
      min_length  = 1
      max_length  = 128
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\\\-\\\\._]{0,126}[a-zA-Z0-9_]$"
    }
    role_assignment = {
      name        = substr(join("-", compact([local.prefix, "ra", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "ra", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "ra"
      min_length  = 1
      max_length  = 64
      scope       = "assignment"
      regex       = "^[^%]+[^ %.]$"
    }
    role_definition = {
      name        = substr(join("-", compact([local.prefix, "rd", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "rd", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "rd"
      min_length  = 1
      max_length  = 64
      scope       = "definition"
      regex       = "^[^%]+[^ %.]$"
    }
    route = {
      name        = substr(join("-", compact([local.prefix, "rt", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "rt", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "rt"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    route_table = {
      name        = substr(join("-", compact([local.prefix, "route", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "route", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "route"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    search_service = {
      name        = substr(join("-", compact([local.prefix, "srch", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "srch", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "srch"
      min_length  = 2
      max_length  = 64
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,62}[a-zA-Z0-9]$"
    }
    service_fabric_cluster = {
      name        = substr(join("-", compact([local.prefix, "sf", local.suffix])), 0, 23)
      name_unique = substr(join("-", compact([local.prefix, "sf", local.suffix_unique])), 0, 23)
      dashes      = true
      slug        = "sf"
      min_length  = 4
      max_length  = 23
      scope       = "region"
      regex       = "^[a-z][a-z0-9-]{2,21}[a-z0-9]$"
    }
    servicebus_namespace = {
      name        = substr(join("-", compact([local.prefix, "sb", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sb", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sb"
      min_length  = 6
      max_length  = 50
      scope       = "global"
      regex       = "^[a-zA-Z][a-zA-Z0-9-]{4,48}[a-zA-Z0-9]$"
    }
    servicebus_namespace_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "sbar", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sbar", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sbar"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    servicebus_queue = {
      name        = substr(join("-", compact([local.prefix, "sbq", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "sbq", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "sbq"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,258}[a-zA-Z0-9_]$"
    }
    servicebus_queue_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "sbqar", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sbqar", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sbqar"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    servicebus_subscription = {
      name        = substr(join("-", compact([local.prefix, "sbs", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sbs", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sbs"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    servicebus_subscription_rule = {
      name        = substr(join("-", compact([local.prefix, "sbsr", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sbsr", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sbsr"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    servicebus_topic = {
      name        = substr(join("-", compact([local.prefix, "sbt", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "sbt", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "sbt"
      min_length  = 1
      max_length  = 260
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,258}[a-zA-Z0-9]$"
    }
    servicebus_topic_authorization_rule = {
      name        = substr(join("-", compact([local.prefix, "sbtar", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "sbtar", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "sbtar"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9]$"
    }
    shared_image = {
      name        = substr(join("-", compact([local.prefix, "si", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "si", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "si"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9]$"
    }
    shared_image_gallery = {
      name        = substr(join("", compact([local.prefix_safe, "sig", local.suffix_safe])), 0, 80)
      name_unique = substr(join("", compact([local.prefix_safe, "sig", local.suffix_unique_safe])), 0, 80)
      dashes      = false
      slug        = "sig"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9.]{0,78}[a-zA-Z0-9]$"
    }
    signalr_service = {
      name        = substr(join("-", compact([local.prefix, "sgnlr", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sgnlr", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sgnlr"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]$"
    }
    snapshots = {
      name        = substr(join("-", compact([local.prefix, "snap", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "snap", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "snap"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    sql_elasticpool = {
      name        = substr(join("-", compact([local.prefix, "sqlep", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "sqlep", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "sqlep"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:.?\\\\+\\\\/]+[^<>*%:.?\\\\+\\\\/ ]$"
    }
    sql_failover_group = {
      name        = substr(join("-", compact([local.prefix, "sqlfg", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sqlfg", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sqlfg"
      min_length  = 1
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{0,61}[a-z0-9]$"
    }
    sql_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "sqlfw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "sqlfw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "sqlfw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:?\\\\+\\\\/]+[^<>*%:.?\\\\+\\\\/]$"
    }
    sql_server = {
      name        = substr(join("-", compact([local.prefix, "sql", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sql", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sql"
      min_length  = 1
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-z0-9-]{0,61}[a-z0-9]$"
    }
    storage_account = {
      name        = substr(join("", compact([local.prefix_safe, "st", local.suffix_safe])), 0, 24)
      name_unique = substr(join("", compact([local.prefix_safe, "st", local.suffix_unique_safe])), 0, 24)
      dashes      = false
      slug        = "st"
      min_length  = 3
      max_length  = 24
      scope       = "global"
      regex       = "^[a-z0-9]{3,24}$"
    }
    storage_blob = {
      name        = substr(join("-", compact([local.prefix, "blob", local.suffix])), 0, 1024)
      name_unique = substr(join("-", compact([local.prefix, "blob", local.suffix_unique])), 0, 1024)
      dashes      = true
      slug        = "blob"
      min_length  = 1
      max_length  = 1024
      scope       = "parent"
      regex       = "^[^\\\\/\\\\\\\\<>:\"|?*]+$"
    }
    storage_container = {
      name        = substr(join("-", compact([local.prefix, "stct", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "stct", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "stct"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    storage_data_lake_gen2_filesystem = {
      name        = substr(join("-", compact([local.prefix, "stdl", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "stdl", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "stdl"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    storage_queue = {
      name        = substr(join("-", compact([local.prefix, "stq", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "stq", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "stq"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    storage_share = {
      name        = substr(join("-", compact([local.prefix, "sts", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sts", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sts"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    storage_share_directory = {
      name        = substr(join("-", compact([local.prefix, "sts", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "sts", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "sts"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    storage_sync = {
      name        = substr(join("-", compact([local.prefix, "stsy", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "stsy", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "stsy"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{0,259}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    storage_sync_group = {
      name        = substr(join("-", compact([local.prefix, "stsg", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "stsg", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "stsg"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{0,259}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    storage_table = {
      name        = substr(join("-", compact([local.prefix, "stt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "stt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "stt"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-z0-9][a-z0-9-]{1,61}[a-z0-9]$"
    }
    stream_analytics_function_javascript_udf = {
      name        = substr(join("-", compact([local.prefix, "asafunc", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asafunc", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asafunc"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_job = {
      name        = substr(join("-", compact([local.prefix, "asa", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asa", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asa"
      min_length  = 3
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_output_blob = {
      name        = substr(join("-", compact([local.prefix, "asaoblob", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaoblob", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaoblob"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_output_eventhub = {
      name        = substr(join("-", compact([local.prefix, "asaoeh", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaoeh", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaoeh"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_output_mssql = {
      name        = substr(join("-", compact([local.prefix, "asaomssql", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaomssql", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaomssql"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_output_servicebus_queue = {
      name        = substr(join("-", compact([local.prefix, "asaosbq", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaosbq", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaosbq"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_output_servicebus_topic = {
      name        = substr(join("-", compact([local.prefix, "asaosbt", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaosbt", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaosbt"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_reference_input_blob = {
      name        = substr(join("-", compact([local.prefix, "asarblob", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asarblob", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asarblob"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_stream_input_blob = {
      name        = substr(join("-", compact([local.prefix, "asaiblob", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaiblob", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaiblob"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_stream_input_eventhub = {
      name        = substr(join("-", compact([local.prefix, "asaieh", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaieh", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaieh"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    stream_analytics_stream_input_iothub = {
      name        = substr(join("-", compact([local.prefix, "asaiiot", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "asaiiot", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "asaiiot"
      min_length  = 3
      max_length  = 63
      scope       = "parent"
      regex       = "^[a-zA-Z0-9-_]{3,63}$"
    }
    subnet = {
      name        = substr(join("-", compact([local.prefix, "snet", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "snet", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "snet"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    subscription_policy_assignment = {
      name        = substr(join("-", compact([local.prefix, "aspa", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "aspa", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "aspa"
      min_length  = 1
      max_length  = 128
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9\\\\-\\\\._]{0,126}[a-zA-Z0-9_]$"
    }
    synapse_firewall_rule = {
      name        = substr(join("-", compact([local.prefix, "syfw", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "syfw", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "syfw"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[^<>*%:?\\\\+\\\\/]{1,127}[^<>*%:.?\\\\+\\\\/]$"
    }
    synapse_integration_runtime_azure = {
      name        = substr(join("-", compact([local.prefix, "synira", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "synira", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "synira"
      min_length  = 3
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9_-]$"
    }
    synapse_integration_runtime_self_hosted = {
      name        = substr(join("-", compact([local.prefix, "synirsh", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "synirsh", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "synirsh"
      min_length  = 3
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9_-]$"
    }
    synapse_linked_service = {
      name        = substr(join("", compact([local.prefix_safe, "synls", local.suffix_safe])), 0, 140)
      name_unique = substr(join("", compact([local.prefix_safe, "synls", local.suffix_unique_safe])), 0, 140)
      dashes      = false
      slug        = "synls"
      min_length  = 1
      max_length  = 140
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9_]{1,140}$"
    }
    synapse_managed_private_endpoint = {
      name        = substr(join("-", compact([local.prefix, "synmpe", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "synmpe", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "synmpe"
      min_length  = 3
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9_.-]{1,61}[a-zA-Z0-9_]$"
    }
    synapse_private_link_hub = {
      name        = substr(join("", compact([local.prefix_safe, "synplh", local.suffix_safe])), 0, 45)
      name_unique = substr(join("", compact([local.prefix_safe, "synplh", local.suffix_unique_safe])), 0, 45)
      dashes      = false
      slug        = "synplh"
      min_length  = 1
      max_length  = 45
      scope       = "subscription"
      regex       = "^[a-z0-9]{1,45}$"
    }
    synapse_spark_pool = {
      name        = substr(join("", compact([local.prefix_safe, "sysp", local.suffix_safe])), 0, 15)
      name_unique = substr(join("", compact([local.prefix_safe, "sysp", local.suffix_unique_safe])), 0, 15)
      dashes      = false
      slug        = "sysp"
      min_length  = 1
      max_length  = 15
      scope       = "parent"
      regex       = "^[0-9a-zA-Z]{1,15}$"
    }
    synapse_sql_pool = {
      name        = substr(join("", compact([local.prefix_safe, "sysql", local.suffix_safe])), 0, 15)
      name_unique = substr(join("", compact([local.prefix_safe, "sysql", local.suffix_unique_safe])), 0, 15)
      dashes      = false
      slug        = "sysql"
      min_length  = 1
      max_length  = 15
      scope       = "parent"
      regex       = "^[0-9a-zA-Z]{1,15}$"
    }
    synapse_sql_pool_vulnerability_assessment_baseline = {
      name        = substr(join("", compact([local.prefix_safe, "synspvab", local.suffix_safe])), 0, 63)
      name_unique = substr(join("", compact([local.prefix_safe, "synspvab", local.suffix_unique_safe])), 0, 63)
      dashes      = false
      slug        = "synspvab"
      min_length  = 3
      max_length  = 63
      scope       = "subscription"
      regex       = "^[a-zA-Z0-9]{1,63}$"
    }
    synapse_sql_pool_workload_classifier = {
      name        = substr(join("-", compact([local.prefix, "synspwc", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "synspwc", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "synspwc"
      min_length  = 1
      max_length  = 128
      scope       = "subscription"
      regex       = "^[^<>*%:?\\\\+\\\\/]{1,127}[^<>*%:.?\\\\+\\\\/]$"
    }
    synapse_sql_pool_workload_group = {
      name        = substr(join("-", compact([local.prefix, "synspwg", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "synspwg", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "synspwg"
      min_length  = 1
      max_length  = 128
      scope       = "subscription"
      regex       = "^[^<>*%:.?\\\\+\\\\/]{0,127}[^<>*%:.?\\\\+\\\\/ ]$"
    }
    synapse_workspace = {
      name        = substr(join("", compact([local.prefix_safe, "syws", local.suffix_safe])), 0, 45)
      name_unique = substr(join("", compact([local.prefix_safe, "syws", local.suffix_unique_safe])), 0, 45)
      dashes      = false
      slug        = "syws"
      min_length  = 1
      max_length  = 45
      scope       = "resourceGroup"
      regex       = "[a-zA-Z0-9-]{1,50}$"
    }
    template_deployment = {
      name        = substr(join("-", compact([local.prefix, "deploy", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "deploy", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "deploy"
      min_length  = 1
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-._\\\\(\\\\)]{1,64}$"
    }
    traffic_manager_profile = {
      name        = substr(join("-", compact([local.prefix, "traf", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "traf", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "traf"
      min_length  = 1
      max_length  = 63
      scope       = "global"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-.]{0,61}[a-zA-Z0-9_]$"
    }
    user_assigned_identity = {
      name        = substr(join("-", compact([local.prefix, "uai", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "uai", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "uai"
      min_length  = 3
      max_length  = 128
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9-_]{3,128}$"
    }
    virtual_desktop_application_group = {
      name        = substr(join("-", compact([local.prefix, "dag", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "dag", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "dag"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9 ][a-zA-Z0-9-._ ]{0,258}[a-zA-Z0-9_]$"
    }
    virtual_desktop_host_pool = {
      name        = substr(join("-", compact([local.prefix, "hpool", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "hpool", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "hpool"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9 ][a-zA-Z0-9-._ ]{0,258}[a-zA-Z0-9_]$"
    }
    virtual_desktop_workspace = {
      name        = substr(join("-", compact([local.prefix, "wvdws", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "wvdws", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "wvdws"
      min_length  = 1
      max_length  = 260
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9 ][a-zA-Z0-9-._ ]{0,258}[a-zA-Z0-9_]$"
    }
    virtual_hub = {
      name        = substr(join("-", compact([local.prefix, "vhub", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "vhub", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "vhub"
      min_length  = 1
      max_length  = 50
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,48}[a-zA-Z0-9_]$"
    }
    virtual_hub_connection = {
      name        = substr(join("-", compact([local.prefix, "vhcon", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vhcon", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vhcon"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_machine = {
      name        = substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 15)
      name_unique = substr(join("-", compact([local.prefix, "vm", local.suffix_unique])), 0, 15)
      dashes      = true
      slug        = "vm"
      min_length  = 1
      max_length  = 15
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,13}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
    virtual_machine_extension = {
      name        = substr(join("-", compact([local.prefix, "vmx", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vmx", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vmx"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_machine_scale_set = {
      name        = substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 15)
      name_unique = substr(join("-", compact([local.prefix, "vmss", local.suffix_unique])), 0, 15)
      dashes      = true
      slug        = "vmss"
      min_length  = 1
      max_length  = 15
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,13}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
    virtual_machine_scale_set_extension = {
      name        = substr(join("-", compact([local.prefix, "vmssx", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vmssx", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vmssx"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_network = {
      name        = substr(join("-", compact([local.prefix, "vnet", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "vnet", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "vnet"
      min_length  = 2
      max_length  = 64
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,62}[a-zA-Z0-9_]$"
    }
    virtual_network_gateway = {
      name        = substr(join("-", compact([local.prefix, "vgw", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vgw", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vgw"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_network_gateway_connection = {
      name        = substr(join("-", compact([local.prefix, "vcn", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vcn", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vcn"
      min_length  = 1
      max_length  = 80
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_network_peering = {
      name        = substr(join("-", compact([local.prefix, "vpeer", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vpeer", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vpeer"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    virtual_wan = {
      name        = substr(join("-", compact([local.prefix, "vwan", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vwan", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vwan"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    vpn_gateway_connection = {
      name        = substr(join("-", compact([local.prefix, "vcn", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vcn", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vcn"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    vpn_site = {
      name        = substr(join("-", compact([local.prefix, "vst", local.suffix])), 0, 80)
      name_unique = substr(join("-", compact([local.prefix, "vst", local.suffix_unique])), 0, 80)
      dashes      = true
      slug        = "vst"
      min_length  = 1
      max_length  = 80
      scope       = "parent"
      regex       = "^[a-zA-Z0-9][a-zA-Z0-9-._]{0,78}[a-zA-Z0-9_]$"
    }
    web_pubsub = {
      name        = substr(join("-", compact([local.prefix, "ps", local.suffix])), 0, 63)
      name_unique = substr(join("-", compact([local.prefix, "ps", local.suffix_unique])), 0, 63)
      dashes      = true
      slug        = "ps"
      min_length  = 3
      max_length  = 63
      scope       = "resourceGroup"
      regex       = "^[a-zA-Z][-a-zA-Z0-9]{1,61}[a-zA-Z0-9]$"
    }
    web_pubsub_hub = {
      name        = substr(join("", compact([local.prefix_safe, "pshub", local.suffix_safe])), 0, 128)
      name_unique = substr(join("", compact([local.prefix_safe, "pshub", local.suffix_unique_safe])), 0, 128)
      dashes      = false
      slug        = "pshub"
      min_length  = 1
      max_length  = 128
      scope       = "parent"
      regex       = "^[a-zA-Z][a-zA-Z0-9_`,.\\\\[\\\\]]{0,127}$"
    }
    windows_virtual_machine = {
      name        = substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 15)
      name_unique = substr(join("-", compact([local.prefix, "vm", local.suffix_unique])), 0, 15)
      dashes      = true
      slug        = "vm"
      min_length  = 1
      max_length  = 15
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,13}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
    windows_virtual_machine_scale_set = {
      name        = substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 15)
      name_unique = substr(join("-", compact([local.prefix, "vmss", local.suffix_unique])), 0, 15)
      dashes      = true
      slug        = "vmss"
      min_length  = 1
      max_length  = 15
      scope       = "resourceGroup"
      regex       = "^[^\\\\/\"[\\]:|<>+=;,?*@&_][^\\\\/\"[\\]:|<>+=;,?*@&]{0,13}[^\\\\/\"[\\]:|<>+=;,?*@&.-]$"
    }
  }
  validation = {
    aadb2c_directory = {
      valid_name        = length(regexall(local.az.aadb2c_directory.regex, local.az.aadb2c_directory.name)) > 0 && length(local.az.aadb2c_directory.name) > local.az.aadb2c_directory.min_length
      valid_name_unique = length(regexall(local.az.aadb2c_directory.regex, local.az.aadb2c_directory.name_unique)) > 0
    }
    aks_node_pool_linux = {
      valid_name        = length(regexall(local.az.aks_node_pool_linux.regex, local.az.aks_node_pool_linux.name)) > 0 && length(local.az.aks_node_pool_linux.name) > local.az.aks_node_pool_linux.min_length
      valid_name_unique = length(regexall(local.az.aks_node_pool_linux.regex, local.az.aks_node_pool_linux.name_unique)) > 0
    }
    aks_node_pool_windows = {
      valid_name        = length(regexall(local.az.aks_node_pool_windows.regex, local.az.aks_node_pool_windows.name)) > 0 && length(local.az.aks_node_pool_windows.name) > local.az.aks_node_pool_windows.min_length
      valid_name_unique = length(regexall(local.az.aks_node_pool_windows.regex, local.az.aks_node_pool_windows.name_unique)) > 0
    }
    analysis_services_server = {
      valid_name        = length(regexall(local.az.analysis_services_server.regex, local.az.analysis_services_server.name)) > 0 && length(local.az.analysis_services_server.name) > local.az.analysis_services_server.min_length
      valid_name_unique = length(regexall(local.az.analysis_services_server.regex, local.az.analysis_services_server.name_unique)) > 0
    }
    api_management = {
      valid_name        = length(regexall(local.az.api_management.regex, local.az.api_management.name)) > 0 && length(local.az.api_management.name) > local.az.api_management.min_length
      valid_name_unique = length(regexall(local.az.api_management.regex, local.az.api_management.name_unique)) > 0
    }
    api_management_api = {
      valid_name        = length(regexall(local.az.api_management_api.regex, local.az.api_management_api.name)) > 0 && length(local.az.api_management_api.name) > local.az.api_management_api.min_length
      valid_name_unique = length(regexall(local.az.api_management_api.regex, local.az.api_management_api.name_unique)) > 0
    }
    api_management_api_operation_tag = {
      valid_name        = length(regexall(local.az.api_management_api_operation_tag.regex, local.az.api_management_api_operation_tag.name)) > 0 && length(local.az.api_management_api_operation_tag.name) > local.az.api_management_api_operation_tag.min_length
      valid_name_unique = length(regexall(local.az.api_management_api_operation_tag.regex, local.az.api_management_api_operation_tag.name_unique)) > 0
    }
    api_management_backend = {
      valid_name        = length(regexall(local.az.api_management_backend.regex, local.az.api_management_backend.name)) > 0 && length(local.az.api_management_backend.name) > local.az.api_management_backend.min_length
      valid_name_unique = length(regexall(local.az.api_management_backend.regex, local.az.api_management_backend.name_unique)) > 0
    }
    api_management_certificate = {
      valid_name        = length(regexall(local.az.api_management_certificate.regex, local.az.api_management_certificate.name)) > 0 && length(local.az.api_management_certificate.name) > local.az.api_management_certificate.min_length
      valid_name_unique = length(regexall(local.az.api_management_certificate.regex, local.az.api_management_certificate.name_unique)) > 0
    }
    api_management_gateway = {
      valid_name        = length(regexall(local.az.api_management_gateway.regex, local.az.api_management_gateway.name)) > 0 && length(local.az.api_management_gateway.name) > local.az.api_management_gateway.min_length
      valid_name_unique = length(regexall(local.az.api_management_gateway.regex, local.az.api_management_gateway.name_unique)) > 0
    }
    api_management_group = {
      valid_name        = length(regexall(local.az.api_management_group.regex, local.az.api_management_group.name)) > 0 && length(local.az.api_management_group.name) > local.az.api_management_group.min_length
      valid_name_unique = length(regexall(local.az.api_management_group.regex, local.az.api_management_group.name_unique)) > 0
    }
    api_management_logger = {
      valid_name        = length(regexall(local.az.api_management_logger.regex, local.az.api_management_logger.name)) > 0 && length(local.az.api_management_logger.name) > local.az.api_management_logger.min_length
      valid_name_unique = length(regexall(local.az.api_management_logger.regex, local.az.api_management_logger.name_unique)) > 0
    }
    app_configuration = {
      valid_name        = length(regexall(local.az.app_configuration.regex, local.az.app_configuration.name)) > 0 && length(local.az.app_configuration.name) > local.az.app_configuration.min_length
      valid_name_unique = length(regexall(local.az.app_configuration.regex, local.az.app_configuration.name_unique)) > 0
    }
    app_service = {
      valid_name        = length(regexall(local.az.app_service.regex, local.az.app_service.name)) > 0 && length(local.az.app_service.name) > local.az.app_service.min_length
      valid_name_unique = length(regexall(local.az.app_service.regex, local.az.app_service.name_unique)) > 0
    }
    app_service_environment = {
      valid_name        = length(regexall(local.az.app_service_environment.regex, local.az.app_service_environment.name)) > 0 && length(local.az.app_service_environment.name) > local.az.app_service_environment.min_length
      valid_name_unique = length(regexall(local.az.app_service_environment.regex, local.az.app_service_environment.name_unique)) > 0
    }
    app_service_plan = {
      valid_name        = length(regexall(local.az.app_service_plan.regex, local.az.app_service_plan.name)) > 0 && length(local.az.app_service_plan.name) > local.az.app_service_plan.min_length
      valid_name_unique = length(regexall(local.az.app_service_plan.regex, local.az.app_service_plan.name_unique)) > 0
    }
    application_gateway = {
      valid_name        = length(regexall(local.az.application_gateway.regex, local.az.application_gateway.name)) > 0 && length(local.az.application_gateway.name) > local.az.application_gateway.min_length
      valid_name_unique = length(regexall(local.az.application_gateway.regex, local.az.application_gateway.name_unique)) > 0
    }
    application_insights = {
      valid_name        = length(regexall(local.az.application_insights.regex, local.az.application_insights.name)) > 0 && length(local.az.application_insights.name) > local.az.application_insights.min_length
      valid_name_unique = length(regexall(local.az.application_insights.regex, local.az.application_insights.name_unique)) > 0
    }
    application_insights_web_test = {
      valid_name        = length(regexall(local.az.application_insights_web_test.regex, local.az.application_insights_web_test.name)) > 0 && length(local.az.application_insights_web_test.name) > local.az.application_insights_web_test.min_length
      valid_name_unique = length(regexall(local.az.application_insights_web_test.regex, local.az.application_insights_web_test.name_unique)) > 0
    }
    application_security_group = {
      valid_name        = length(regexall(local.az.application_security_group.regex, local.az.application_security_group.name)) > 0 && length(local.az.application_security_group.name) > local.az.application_security_group.min_length
      valid_name_unique = length(regexall(local.az.application_security_group.regex, local.az.application_security_group.name_unique)) > 0
    }
    automation_account = {
      valid_name        = length(regexall(local.az.automation_account.regex, local.az.automation_account.name)) > 0 && length(local.az.automation_account.name) > local.az.automation_account.min_length
      valid_name_unique = length(regexall(local.az.automation_account.regex, local.az.automation_account.name_unique)) > 0
    }
    automation_certificate = {
      valid_name        = length(regexall(local.az.automation_certificate.regex, local.az.automation_certificate.name)) > 0 && length(local.az.automation_certificate.name) > local.az.automation_certificate.min_length
      valid_name_unique = length(regexall(local.az.automation_certificate.regex, local.az.automation_certificate.name_unique)) > 0
    }
    automation_credential = {
      valid_name        = length(regexall(local.az.automation_credential.regex, local.az.automation_credential.name)) > 0 && length(local.az.automation_credential.name) > local.az.automation_credential.min_length
      valid_name_unique = length(regexall(local.az.automation_credential.regex, local.az.automation_credential.name_unique)) > 0
    }
    automation_job_schedule = {
      valid_name        = length(regexall(local.az.automation_job_schedule.regex, local.az.automation_job_schedule.name)) > 0 && length(local.az.automation_job_schedule.name) > local.az.automation_job_schedule.min_length
      valid_name_unique = length(regexall(local.az.automation_job_schedule.regex, local.az.automation_job_schedule.name_unique)) > 0
    }
    automation_runbook = {
      valid_name        = length(regexall(local.az.automation_runbook.regex, local.az.automation_runbook.name)) > 0 && length(local.az.automation_runbook.name) > local.az.automation_runbook.min_length
      valid_name_unique = length(regexall(local.az.automation_runbook.regex, local.az.automation_runbook.name_unique)) > 0
    }
    automation_schedule = {
      valid_name        = length(regexall(local.az.automation_schedule.regex, local.az.automation_schedule.name)) > 0 && length(local.az.automation_schedule.name) > local.az.automation_schedule.min_length
      valid_name_unique = length(regexall(local.az.automation_schedule.regex, local.az.automation_schedule.name_unique)) > 0
    }
    automation_variable = {
      valid_name        = length(regexall(local.az.automation_variable.regex, local.az.automation_variable.name)) > 0 && length(local.az.automation_variable.name) > local.az.automation_variable.min_length
      valid_name_unique = length(regexall(local.az.automation_variable.regex, local.az.automation_variable.name_unique)) > 0
    }
    availability_set = {
      valid_name        = length(regexall(local.az.availability_set.regex, local.az.availability_set.name)) > 0 && length(local.az.availability_set.name) > local.az.availability_set.min_length
      valid_name_unique = length(regexall(local.az.availability_set.regex, local.az.availability_set.name_unique)) > 0
    }
    bastion_host = {
      valid_name        = length(regexall(local.az.bastion_host.regex, local.az.bastion_host.name)) > 0 && length(local.az.bastion_host.name) > local.az.bastion_host.min_length
      valid_name_unique = length(regexall(local.az.bastion_host.regex, local.az.bastion_host.name_unique)) > 0
    }
    batch_account = {
      valid_name        = length(regexall(local.az.batch_account.regex, local.az.batch_account.name)) > 0 && length(local.az.batch_account.name) > local.az.batch_account.min_length
      valid_name_unique = length(regexall(local.az.batch_account.regex, local.az.batch_account.name_unique)) > 0
    }
    batch_application = {
      valid_name        = length(regexall(local.az.batch_application.regex, local.az.batch_application.name)) > 0 && length(local.az.batch_application.name) > local.az.batch_application.min_length
      valid_name_unique = length(regexall(local.az.batch_application.regex, local.az.batch_application.name_unique)) > 0
    }
    batch_certificate = {
      valid_name        = length(regexall(local.az.batch_certificate.regex, local.az.batch_certificate.name)) > 0 && length(local.az.batch_certificate.name) > local.az.batch_certificate.min_length
      valid_name_unique = length(regexall(local.az.batch_certificate.regex, local.az.batch_certificate.name_unique)) > 0
    }
    batch_pool = {
      valid_name        = length(regexall(local.az.batch_pool.regex, local.az.batch_pool.name)) > 0 && length(local.az.batch_pool.name) > local.az.batch_pool.min_length
      valid_name_unique = length(regexall(local.az.batch_pool.regex, local.az.batch_pool.name_unique)) > 0
    }
    bot_channel_directline = {
      valid_name        = length(regexall(local.az.bot_channel_directline.regex, local.az.bot_channel_directline.name)) > 0 && length(local.az.bot_channel_directline.name) > local.az.bot_channel_directline.min_length
      valid_name_unique = length(regexall(local.az.bot_channel_directline.regex, local.az.bot_channel_directline.name_unique)) > 0
    }
    bot_channel_email = {
      valid_name        = length(regexall(local.az.bot_channel_email.regex, local.az.bot_channel_email.name)) > 0 && length(local.az.bot_channel_email.name) > local.az.bot_channel_email.min_length
      valid_name_unique = length(regexall(local.az.bot_channel_email.regex, local.az.bot_channel_email.name_unique)) > 0
    }
    bot_channel_ms_teams = {
      valid_name        = length(regexall(local.az.bot_channel_ms_teams.regex, local.az.bot_channel_ms_teams.name)) > 0 && length(local.az.bot_channel_ms_teams.name) > local.az.bot_channel_ms_teams.min_length
      valid_name_unique = length(regexall(local.az.bot_channel_ms_teams.regex, local.az.bot_channel_ms_teams.name_unique)) > 0
    }
    bot_channel_slack = {
      valid_name        = length(regexall(local.az.bot_channel_slack.regex, local.az.bot_channel_slack.name)) > 0 && length(local.az.bot_channel_slack.name) > local.az.bot_channel_slack.min_length
      valid_name_unique = length(regexall(local.az.bot_channel_slack.regex, local.az.bot_channel_slack.name_unique)) > 0
    }
    bot_channels_registration = {
      valid_name        = length(regexall(local.az.bot_channels_registration.regex, local.az.bot_channels_registration.name)) > 0 && length(local.az.bot_channels_registration.name) > local.az.bot_channels_registration.min_length
      valid_name_unique = length(regexall(local.az.bot_channels_registration.regex, local.az.bot_channels_registration.name_unique)) > 0
    }
    bot_connection = {
      valid_name        = length(regexall(local.az.bot_connection.regex, local.az.bot_connection.name)) > 0 && length(local.az.bot_connection.name) > local.az.bot_connection.min_length
      valid_name_unique = length(regexall(local.az.bot_connection.regex, local.az.bot_connection.name_unique)) > 0
    }
    bot_web_app = {
      valid_name        = length(regexall(local.az.bot_web_app.regex, local.az.bot_web_app.name)) > 0 && length(local.az.bot_web_app.name) > local.az.bot_web_app.min_length
      valid_name_unique = length(regexall(local.az.bot_web_app.regex, local.az.bot_web_app.name_unique)) > 0
    }
    cdn_endpoint = {
      valid_name        = length(regexall(local.az.cdn_endpoint.regex, local.az.cdn_endpoint.name)) > 0 && length(local.az.cdn_endpoint.name) > local.az.cdn_endpoint.min_length
      valid_name_unique = length(regexall(local.az.cdn_endpoint.regex, local.az.cdn_endpoint.name_unique)) > 0
    }
    cdn_profile = {
      valid_name        = length(regexall(local.az.cdn_profile.regex, local.az.cdn_profile.name)) > 0 && length(local.az.cdn_profile.name) > local.az.cdn_profile.min_length
      valid_name_unique = length(regexall(local.az.cdn_profile.regex, local.az.cdn_profile.name_unique)) > 0
    }
    cognitive_account = {
      valid_name        = length(regexall(local.az.cognitive_account.regex, local.az.cognitive_account.name)) > 0 && length(local.az.cognitive_account.name) > local.az.cognitive_account.min_length
      valid_name_unique = length(regexall(local.az.cognitive_account.regex, local.az.cognitive_account.name_unique)) > 0
    }
    cognitive_deployment = {
      valid_name        = length(regexall(local.az.cognitive_deployment.regex, local.az.cognitive_deployment.name)) > 0 && length(local.az.cognitive_deployment.name) > local.az.cognitive_deployment.min_length
      valid_name_unique = length(regexall(local.az.cognitive_deployment.regex, local.az.cognitive_deployment.name_unique)) > 0
    }
    communication_service = {
      valid_name        = length(regexall(local.az.communication_service.regex, local.az.communication_service.name)) > 0 && length(local.az.communication_service.name) > local.az.communication_service.min_length
      valid_name_unique = length(regexall(local.az.communication_service.regex, local.az.communication_service.name_unique)) > 0
    }
    consumption_budget_resource_group = {
      valid_name        = length(regexall(local.az.consumption_budget_resource_group.regex, local.az.consumption_budget_resource_group.name)) > 0 && length(local.az.consumption_budget_resource_group.name) > local.az.consumption_budget_resource_group.min_length
      valid_name_unique = length(regexall(local.az.consumption_budget_resource_group.regex, local.az.consumption_budget_resource_group.name_unique)) > 0
    }
    consumption_budget_subscription = {
      valid_name        = length(regexall(local.az.consumption_budget_subscription.regex, local.az.consumption_budget_subscription.name)) > 0 && length(local.az.consumption_budget_subscription.name) > local.az.consumption_budget_subscription.min_length
      valid_name_unique = length(regexall(local.az.consumption_budget_subscription.regex, local.az.consumption_budget_subscription.name_unique)) > 0
    }
    containerGroups = {
      valid_name        = length(regexall(local.az.containerGroups.regex, local.az.containerGroups.name)) > 0 && length(local.az.containerGroups.name) > local.az.containerGroups.min_length
      valid_name_unique = length(regexall(local.az.containerGroups.regex, local.az.containerGroups.name_unique)) > 0
    }
    container_app = {
      valid_name        = length(regexall(local.az.container_app.regex, local.az.container_app.name)) > 0 && length(local.az.container_app.name) > local.az.container_app.min_length
      valid_name_unique = length(regexall(local.az.container_app.regex, local.az.container_app.name_unique)) > 0
    }
    container_app_environment = {
      valid_name        = length(regexall(local.az.container_app_environment.regex, local.az.container_app_environment.name)) > 0 && length(local.az.container_app_environment.name) > local.az.container_app_environment.min_length
      valid_name_unique = length(regexall(local.az.container_app_environment.regex, local.az.container_app_environment.name_unique)) > 0
    }
    container_app_job = {
      valid_name        = length(regexall(local.az.container_app_job.regex, local.az.container_app_job.name)) > 0 && length(local.az.container_app_job.name) > local.az.container_app_job.min_length
      valid_name_unique = length(regexall(local.az.container_app_job.regex, local.az.container_app_job.name_unique)) > 0
    }
    container_group = {
      valid_name        = length(regexall(local.az.container_group.regex, local.az.container_group.name)) > 0 && length(local.az.container_group.name) > local.az.container_group.min_length
      valid_name_unique = length(regexall(local.az.container_group.regex, local.az.container_group.name_unique)) > 0
    }
    container_registry = {
      valid_name        = length(regexall(local.az.container_registry.regex, local.az.container_registry.name)) > 0 && length(local.az.container_registry.name) > local.az.container_registry.min_length
      valid_name_unique = length(regexall(local.az.container_registry.regex, local.az.container_registry.name_unique)) > 0
    }
    container_registry_webhook = {
      valid_name        = length(regexall(local.az.container_registry_webhook.regex, local.az.container_registry_webhook.name)) > 0 && length(local.az.container_registry_webhook.name) > local.az.container_registry_webhook.min_length
      valid_name_unique = length(regexall(local.az.container_registry_webhook.regex, local.az.container_registry_webhook.name_unique)) > 0
    }
    cosmosdb_account = {
      valid_name        = length(regexall(local.az.cosmosdb_account.regex, local.az.cosmosdb_account.name)) > 0 && length(local.az.cosmosdb_account.name) > local.az.cosmosdb_account.min_length
      valid_name_unique = length(regexall(local.az.cosmosdb_account.regex, local.az.cosmosdb_account.name_unique)) > 0
    }
    cosmosdb_cassandra_cluster = {
      valid_name        = length(regexall(local.az.cosmosdb_cassandra_cluster.regex, local.az.cosmosdb_cassandra_cluster.name)) > 0 && length(local.az.cosmosdb_cassandra_cluster.name) > local.az.cosmosdb_cassandra_cluster.min_length
      valid_name_unique = length(regexall(local.az.cosmosdb_cassandra_cluster.regex, local.az.cosmosdb_cassandra_cluster.name_unique)) > 0
    }
    cosmosdb_cassandra_datacenter = {
      valid_name        = length(regexall(local.az.cosmosdb_cassandra_datacenter.regex, local.az.cosmosdb_cassandra_datacenter.name)) > 0 && length(local.az.cosmosdb_cassandra_datacenter.name) > local.az.cosmosdb_cassandra_datacenter.min_length
      valid_name_unique = length(regexall(local.az.cosmosdb_cassandra_datacenter.regex, local.az.cosmosdb_cassandra_datacenter.name_unique)) > 0
    }
    cosmosdb_postgres = {
      valid_name        = length(regexall(local.az.cosmosdb_postgres.regex, local.az.cosmosdb_postgres.name)) > 0 && length(local.az.cosmosdb_postgres.name) > local.az.cosmosdb_postgres.min_length
      valid_name_unique = length(regexall(local.az.cosmosdb_postgres.regex, local.az.cosmosdb_postgres.name_unique)) > 0
    }
    custom_provider = {
      valid_name        = length(regexall(local.az.custom_provider.regex, local.az.custom_provider.name)) > 0 && length(local.az.custom_provider.name) > local.az.custom_provider.min_length
      valid_name_unique = length(regexall(local.az.custom_provider.regex, local.az.custom_provider.name_unique)) > 0
    }
    dashboard = {
      valid_name        = length(regexall(local.az.dashboard.regex, local.az.dashboard.name)) > 0 && length(local.az.dashboard.name) > local.az.dashboard.min_length
      valid_name_unique = length(regexall(local.az.dashboard.regex, local.az.dashboard.name_unique)) > 0
    }
    data_collection_endpoint = {
      valid_name        = length(regexall(local.az.data_collection_endpoint.regex, local.az.data_collection_endpoint.name)) > 0 && length(local.az.data_collection_endpoint.name) > local.az.data_collection_endpoint.min_length
      valid_name_unique = length(regexall(local.az.data_collection_endpoint.regex, local.az.data_collection_endpoint.name_unique)) > 0
    }
    data_collection_rule = {
      valid_name        = length(regexall(local.az.data_collection_rule.regex, local.az.data_collection_rule.name)) > 0 && length(local.az.data_collection_rule.name) > local.az.data_collection_rule.min_length
      valid_name_unique = length(regexall(local.az.data_collection_rule.regex, local.az.data_collection_rule.name_unique)) > 0
    }
    data_factory = {
      valid_name        = length(regexall(local.az.data_factory.regex, local.az.data_factory.name)) > 0 && length(local.az.data_factory.name) > local.az.data_factory.min_length
      valid_name_unique = length(regexall(local.az.data_factory.regex, local.az.data_factory.name_unique)) > 0
    }
    data_factory_dataset_mysql = {
      valid_name        = length(regexall(local.az.data_factory_dataset_mysql.regex, local.az.data_factory_dataset_mysql.name)) > 0 && length(local.az.data_factory_dataset_mysql.name) > local.az.data_factory_dataset_mysql.min_length
      valid_name_unique = length(regexall(local.az.data_factory_dataset_mysql.regex, local.az.data_factory_dataset_mysql.name_unique)) > 0
    }
    data_factory_dataset_postgresql = {
      valid_name        = length(regexall(local.az.data_factory_dataset_postgresql.regex, local.az.data_factory_dataset_postgresql.name)) > 0 && length(local.az.data_factory_dataset_postgresql.name) > local.az.data_factory_dataset_postgresql.min_length
      valid_name_unique = length(regexall(local.az.data_factory_dataset_postgresql.regex, local.az.data_factory_dataset_postgresql.name_unique)) > 0
    }
    data_factory_dataset_sql_server_table = {
      valid_name        = length(regexall(local.az.data_factory_dataset_sql_server_table.regex, local.az.data_factory_dataset_sql_server_table.name)) > 0 && length(local.az.data_factory_dataset_sql_server_table.name) > local.az.data_factory_dataset_sql_server_table.min_length
      valid_name_unique = length(regexall(local.az.data_factory_dataset_sql_server_table.regex, local.az.data_factory_dataset_sql_server_table.name_unique)) > 0
    }
    data_factory_integration_runtime_managed = {
      valid_name        = length(regexall(local.az.data_factory_integration_runtime_managed.regex, local.az.data_factory_integration_runtime_managed.name)) > 0 && length(local.az.data_factory_integration_runtime_managed.name) > local.az.data_factory_integration_runtime_managed.min_length
      valid_name_unique = length(regexall(local.az.data_factory_integration_runtime_managed.regex, local.az.data_factory_integration_runtime_managed.name_unique)) > 0
    }
    data_factory_linked_service_data_lake_storage_gen2 = {
      valid_name        = length(regexall(local.az.data_factory_linked_service_data_lake_storage_gen2.regex, local.az.data_factory_linked_service_data_lake_storage_gen2.name)) > 0 && length(local.az.data_factory_linked_service_data_lake_storage_gen2.name) > local.az.data_factory_linked_service_data_lake_storage_gen2.min_length
      valid_name_unique = length(regexall(local.az.data_factory_linked_service_data_lake_storage_gen2.regex, local.az.data_factory_linked_service_data_lake_storage_gen2.name_unique)) > 0
    }
    data_factory_linked_service_key_vault = {
      valid_name        = length(regexall(local.az.data_factory_linked_service_key_vault.regex, local.az.data_factory_linked_service_key_vault.name)) > 0 && length(local.az.data_factory_linked_service_key_vault.name) > local.az.data_factory_linked_service_key_vault.min_length
      valid_name_unique = length(regexall(local.az.data_factory_linked_service_key_vault.regex, local.az.data_factory_linked_service_key_vault.name_unique)) > 0
    }
    data_factory_linked_service_mysql = {
      valid_name        = length(regexall(local.az.data_factory_linked_service_mysql.regex, local.az.data_factory_linked_service_mysql.name)) > 0 && length(local.az.data_factory_linked_service_mysql.name) > local.az.data_factory_linked_service_mysql.min_length
      valid_name_unique = length(regexall(local.az.data_factory_linked_service_mysql.regex, local.az.data_factory_linked_service_mysql.name_unique)) > 0
    }
    data_factory_linked_service_postgresql = {
      valid_name        = length(regexall(local.az.data_factory_linked_service_postgresql.regex, local.az.data_factory_linked_service_postgresql.name)) > 0 && length(local.az.data_factory_linked_service_postgresql.name) > local.az.data_factory_linked_service_postgresql.min_length
      valid_name_unique = length(regexall(local.az.data_factory_linked_service_postgresql.regex, local.az.data_factory_linked_service_postgresql.name_unique)) > 0
    }
    data_factory_linked_service_sql_server = {
      valid_name        = length(regexall(local.az.data_factory_linked_service_sql_server.regex, local.az.data_factory_linked_service_sql_server.name)) > 0 && length(local.az.data_factory_linked_service_sql_server.name) > local.az.data_factory_linked_service_sql_server.min_length
      valid_name_unique = length(regexall(local.az.data_factory_linked_service_sql_server.regex, local.az.data_factory_linked_service_sql_server.name_unique)) > 0
    }
    data_factory_pipeline = {
      valid_name        = length(regexall(local.az.data_factory_pipeline.regex, local.az.data_factory_pipeline.name)) > 0 && length(local.az.data_factory_pipeline.name) > local.az.data_factory_pipeline.min_length
      valid_name_unique = length(regexall(local.az.data_factory_pipeline.regex, local.az.data_factory_pipeline.name_unique)) > 0
    }
    data_factory_trigger_schedule = {
      valid_name        = length(regexall(local.az.data_factory_trigger_schedule.regex, local.az.data_factory_trigger_schedule.name)) > 0 && length(local.az.data_factory_trigger_schedule.name) > local.az.data_factory_trigger_schedule.min_length
      valid_name_unique = length(regexall(local.az.data_factory_trigger_schedule.regex, local.az.data_factory_trigger_schedule.name_unique)) > 0
    }
    data_lake_analytics_account = {
      valid_name        = length(regexall(local.az.data_lake_analytics_account.regex, local.az.data_lake_analytics_account.name)) > 0 && length(local.az.data_lake_analytics_account.name) > local.az.data_lake_analytics_account.min_length
      valid_name_unique = length(regexall(local.az.data_lake_analytics_account.regex, local.az.data_lake_analytics_account.name_unique)) > 0
    }
    data_lake_analytics_firewall_rule = {
      valid_name        = length(regexall(local.az.data_lake_analytics_firewall_rule.regex, local.az.data_lake_analytics_firewall_rule.name)) > 0 && length(local.az.data_lake_analytics_firewall_rule.name) > local.az.data_lake_analytics_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.data_lake_analytics_firewall_rule.regex, local.az.data_lake_analytics_firewall_rule.name_unique)) > 0
    }
    data_lake_store = {
      valid_name        = length(regexall(local.az.data_lake_store.regex, local.az.data_lake_store.name)) > 0 && length(local.az.data_lake_store.name) > local.az.data_lake_store.min_length
      valid_name_unique = length(regexall(local.az.data_lake_store.regex, local.az.data_lake_store.name_unique)) > 0
    }
    data_lake_store_firewall_rule = {
      valid_name        = length(regexall(local.az.data_lake_store_firewall_rule.regex, local.az.data_lake_store_firewall_rule.name)) > 0 && length(local.az.data_lake_store_firewall_rule.name) > local.az.data_lake_store_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.data_lake_store_firewall_rule.regex, local.az.data_lake_store_firewall_rule.name_unique)) > 0
    }
    database_migration_project = {
      valid_name        = length(regexall(local.az.database_migration_project.regex, local.az.database_migration_project.name)) > 0 && length(local.az.database_migration_project.name) > local.az.database_migration_project.min_length
      valid_name_unique = length(regexall(local.az.database_migration_project.regex, local.az.database_migration_project.name_unique)) > 0
    }
    database_migration_service = {
      valid_name        = length(regexall(local.az.database_migration_service.regex, local.az.database_migration_service.name)) > 0 && length(local.az.database_migration_service.name) > local.az.database_migration_service.min_length
      valid_name_unique = length(regexall(local.az.database_migration_service.regex, local.az.database_migration_service.name_unique)) > 0
    }
    databricks_cluster = {
      valid_name        = length(regexall(local.az.databricks_cluster.regex, local.az.databricks_cluster.name)) > 0 && length(local.az.databricks_cluster.name) > local.az.databricks_cluster.min_length
      valid_name_unique = length(regexall(local.az.databricks_cluster.regex, local.az.databricks_cluster.name_unique)) > 0
    }
    databricks_high_concurrency_cluster = {
      valid_name        = length(regexall(local.az.databricks_high_concurrency_cluster.regex, local.az.databricks_high_concurrency_cluster.name)) > 0 && length(local.az.databricks_high_concurrency_cluster.name) > local.az.databricks_high_concurrency_cluster.min_length
      valid_name_unique = length(regexall(local.az.databricks_high_concurrency_cluster.regex, local.az.databricks_high_concurrency_cluster.name_unique)) > 0
    }
    databricks_standard_cluster = {
      valid_name        = length(regexall(local.az.databricks_standard_cluster.regex, local.az.databricks_standard_cluster.name)) > 0 && length(local.az.databricks_standard_cluster.name) > local.az.databricks_standard_cluster.min_length
      valid_name_unique = length(regexall(local.az.databricks_standard_cluster.regex, local.az.databricks_standard_cluster.name_unique)) > 0
    }
    databricks_workspace = {
      valid_name        = length(regexall(local.az.databricks_workspace.regex, local.az.databricks_workspace.name)) > 0 && length(local.az.databricks_workspace.name) > local.az.databricks_workspace.min_length
      valid_name_unique = length(regexall(local.az.databricks_workspace.regex, local.az.databricks_workspace.name_unique)) > 0
    }
    dev_test_lab = {
      valid_name        = length(regexall(local.az.dev_test_lab.regex, local.az.dev_test_lab.name)) > 0 && length(local.az.dev_test_lab.name) > local.az.dev_test_lab.min_length
      valid_name_unique = length(regexall(local.az.dev_test_lab.regex, local.az.dev_test_lab.name_unique)) > 0
    }
    dev_test_linux_virtual_machine = {
      valid_name        = length(regexall(local.az.dev_test_linux_virtual_machine.regex, local.az.dev_test_linux_virtual_machine.name)) > 0 && length(local.az.dev_test_linux_virtual_machine.name) > local.az.dev_test_linux_virtual_machine.min_length
      valid_name_unique = length(regexall(local.az.dev_test_linux_virtual_machine.regex, local.az.dev_test_linux_virtual_machine.name_unique)) > 0
    }
    dev_test_windows_virtual_machine = {
      valid_name        = length(regexall(local.az.dev_test_windows_virtual_machine.regex, local.az.dev_test_windows_virtual_machine.name)) > 0 && length(local.az.dev_test_windows_virtual_machine.name) > local.az.dev_test_windows_virtual_machine.min_length
      valid_name_unique = length(regexall(local.az.dev_test_windows_virtual_machine.regex, local.az.dev_test_windows_virtual_machine.name_unique)) > 0
    }
    digital_twins_endpoint_eventgrid = {
      valid_name        = length(regexall(local.az.digital_twins_endpoint_eventgrid.regex, local.az.digital_twins_endpoint_eventgrid.name)) > 0 && length(local.az.digital_twins_endpoint_eventgrid.name) > local.az.digital_twins_endpoint_eventgrid.min_length
      valid_name_unique = length(regexall(local.az.digital_twins_endpoint_eventgrid.regex, local.az.digital_twins_endpoint_eventgrid.name_unique)) > 0
    }
    digital_twins_endpoint_eventhub = {
      valid_name        = length(regexall(local.az.digital_twins_endpoint_eventhub.regex, local.az.digital_twins_endpoint_eventhub.name)) > 0 && length(local.az.digital_twins_endpoint_eventhub.name) > local.az.digital_twins_endpoint_eventhub.min_length
      valid_name_unique = length(regexall(local.az.digital_twins_endpoint_eventhub.regex, local.az.digital_twins_endpoint_eventhub.name_unique)) > 0
    }
    digital_twins_endpoint_servicebus = {
      valid_name        = length(regexall(local.az.digital_twins_endpoint_servicebus.regex, local.az.digital_twins_endpoint_servicebus.name)) > 0 && length(local.az.digital_twins_endpoint_servicebus.name) > local.az.digital_twins_endpoint_servicebus.min_length
      valid_name_unique = length(regexall(local.az.digital_twins_endpoint_servicebus.regex, local.az.digital_twins_endpoint_servicebus.name_unique)) > 0
    }
    digital_twins_instance = {
      valid_name        = length(regexall(local.az.digital_twins_instance.regex, local.az.digital_twins_instance.name)) > 0 && length(local.az.digital_twins_instance.name) > local.az.digital_twins_instance.min_length
      valid_name_unique = length(regexall(local.az.digital_twins_instance.regex, local.az.digital_twins_instance.name_unique)) > 0
    }
    disk_encryption_set = {
      valid_name        = length(regexall(local.az.disk_encryption_set.regex, local.az.disk_encryption_set.name)) > 0 && length(local.az.disk_encryption_set.name) > local.az.disk_encryption_set.min_length
      valid_name_unique = length(regexall(local.az.disk_encryption_set.regex, local.az.disk_encryption_set.name_unique)) > 0
    }
    dns_a_record = {
      valid_name        = length(regexall(local.az.dns_a_record.regex, local.az.dns_a_record.name)) > 0 && length(local.az.dns_a_record.name) > local.az.dns_a_record.min_length
      valid_name_unique = length(regexall(local.az.dns_a_record.regex, local.az.dns_a_record.name_unique)) > 0
    }
    dns_aaaa_record = {
      valid_name        = length(regexall(local.az.dns_aaaa_record.regex, local.az.dns_aaaa_record.name)) > 0 && length(local.az.dns_aaaa_record.name) > local.az.dns_aaaa_record.min_length
      valid_name_unique = length(regexall(local.az.dns_aaaa_record.regex, local.az.dns_aaaa_record.name_unique)) > 0
    }
    dns_caa_record = {
      valid_name        = length(regexall(local.az.dns_caa_record.regex, local.az.dns_caa_record.name)) > 0 && length(local.az.dns_caa_record.name) > local.az.dns_caa_record.min_length
      valid_name_unique = length(regexall(local.az.dns_caa_record.regex, local.az.dns_caa_record.name_unique)) > 0
    }
    dns_cname_record = {
      valid_name        = length(regexall(local.az.dns_cname_record.regex, local.az.dns_cname_record.name)) > 0 && length(local.az.dns_cname_record.name) > local.az.dns_cname_record.min_length
      valid_name_unique = length(regexall(local.az.dns_cname_record.regex, local.az.dns_cname_record.name_unique)) > 0
    }
    dns_mx_record = {
      valid_name        = length(regexall(local.az.dns_mx_record.regex, local.az.dns_mx_record.name)) > 0 && length(local.az.dns_mx_record.name) > local.az.dns_mx_record.min_length
      valid_name_unique = length(regexall(local.az.dns_mx_record.regex, local.az.dns_mx_record.name_unique)) > 0
    }
    dns_ns_record = {
      valid_name        = length(regexall(local.az.dns_ns_record.regex, local.az.dns_ns_record.name)) > 0 && length(local.az.dns_ns_record.name) > local.az.dns_ns_record.min_length
      valid_name_unique = length(regexall(local.az.dns_ns_record.regex, local.az.dns_ns_record.name_unique)) > 0
    }
    dns_ptr_record = {
      valid_name        = length(regexall(local.az.dns_ptr_record.regex, local.az.dns_ptr_record.name)) > 0 && length(local.az.dns_ptr_record.name) > local.az.dns_ptr_record.min_length
      valid_name_unique = length(regexall(local.az.dns_ptr_record.regex, local.az.dns_ptr_record.name_unique)) > 0
    }
    dns_txt_record = {
      valid_name        = length(regexall(local.az.dns_txt_record.regex, local.az.dns_txt_record.name)) > 0 && length(local.az.dns_txt_record.name) > local.az.dns_txt_record.min_length
      valid_name_unique = length(regexall(local.az.dns_txt_record.regex, local.az.dns_txt_record.name_unique)) > 0
    }
    dns_zone = {
      valid_name        = length(regexall(local.az.dns_zone.regex, local.az.dns_zone.name)) > 0 && length(local.az.dns_zone.name) > local.az.dns_zone.min_length
      valid_name_unique = length(regexall(local.az.dns_zone.regex, local.az.dns_zone.name_unique)) > 0
    }
    eventgrid_domain = {
      valid_name        = length(regexall(local.az.eventgrid_domain.regex, local.az.eventgrid_domain.name)) > 0 && length(local.az.eventgrid_domain.name) > local.az.eventgrid_domain.min_length
      valid_name_unique = length(regexall(local.az.eventgrid_domain.regex, local.az.eventgrid_domain.name_unique)) > 0
    }
    eventgrid_domain_topic = {
      valid_name        = length(regexall(local.az.eventgrid_domain_topic.regex, local.az.eventgrid_domain_topic.name)) > 0 && length(local.az.eventgrid_domain_topic.name) > local.az.eventgrid_domain_topic.min_length
      valid_name_unique = length(regexall(local.az.eventgrid_domain_topic.regex, local.az.eventgrid_domain_topic.name_unique)) > 0
    }
    eventgrid_event_subscription = {
      valid_name        = length(regexall(local.az.eventgrid_event_subscription.regex, local.az.eventgrid_event_subscription.name)) > 0 && length(local.az.eventgrid_event_subscription.name) > local.az.eventgrid_event_subscription.min_length
      valid_name_unique = length(regexall(local.az.eventgrid_event_subscription.regex, local.az.eventgrid_event_subscription.name_unique)) > 0
    }
    eventgrid_topic = {
      valid_name        = length(regexall(local.az.eventgrid_topic.regex, local.az.eventgrid_topic.name)) > 0 && length(local.az.eventgrid_topic.name) > local.az.eventgrid_topic.min_length
      valid_name_unique = length(regexall(local.az.eventgrid_topic.regex, local.az.eventgrid_topic.name_unique)) > 0
    }
    eventhub = {
      valid_name        = length(regexall(local.az.eventhub.regex, local.az.eventhub.name)) > 0 && length(local.az.eventhub.name) > local.az.eventhub.min_length
      valid_name_unique = length(regexall(local.az.eventhub.regex, local.az.eventhub.name_unique)) > 0
    }
    eventhub_authorization_rule = {
      valid_name        = length(regexall(local.az.eventhub_authorization_rule.regex, local.az.eventhub_authorization_rule.name)) > 0 && length(local.az.eventhub_authorization_rule.name) > local.az.eventhub_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.eventhub_authorization_rule.regex, local.az.eventhub_authorization_rule.name_unique)) > 0
    }
    eventhub_consumer_group = {
      valid_name        = length(regexall(local.az.eventhub_consumer_group.regex, local.az.eventhub_consumer_group.name)) > 0 && length(local.az.eventhub_consumer_group.name) > local.az.eventhub_consumer_group.min_length
      valid_name_unique = length(regexall(local.az.eventhub_consumer_group.regex, local.az.eventhub_consumer_group.name_unique)) > 0
    }
    eventhub_namespace = {
      valid_name        = length(regexall(local.az.eventhub_namespace.regex, local.az.eventhub_namespace.name)) > 0 && length(local.az.eventhub_namespace.name) > local.az.eventhub_namespace.min_length
      valid_name_unique = length(regexall(local.az.eventhub_namespace.regex, local.az.eventhub_namespace.name_unique)) > 0
    }
    eventhub_namespace_authorization_rule = {
      valid_name        = length(regexall(local.az.eventhub_namespace_authorization_rule.regex, local.az.eventhub_namespace_authorization_rule.name)) > 0 && length(local.az.eventhub_namespace_authorization_rule.name) > local.az.eventhub_namespace_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.eventhub_namespace_authorization_rule.regex, local.az.eventhub_namespace_authorization_rule.name_unique)) > 0
    }
    eventhub_namespace_disaster_recovery_config = {
      valid_name        = length(regexall(local.az.eventhub_namespace_disaster_recovery_config.regex, local.az.eventhub_namespace_disaster_recovery_config.name)) > 0 && length(local.az.eventhub_namespace_disaster_recovery_config.name) > local.az.eventhub_namespace_disaster_recovery_config.min_length
      valid_name_unique = length(regexall(local.az.eventhub_namespace_disaster_recovery_config.regex, local.az.eventhub_namespace_disaster_recovery_config.name_unique)) > 0
    }
    express_route_circuit = {
      valid_name        = length(regexall(local.az.express_route_circuit.regex, local.az.express_route_circuit.name)) > 0 && length(local.az.express_route_circuit.name) > local.az.express_route_circuit.min_length
      valid_name_unique = length(regexall(local.az.express_route_circuit.regex, local.az.express_route_circuit.name_unique)) > 0
    }
    express_route_gateway = {
      valid_name        = length(regexall(local.az.express_route_gateway.regex, local.az.express_route_gateway.name)) > 0 && length(local.az.express_route_gateway.name) > local.az.express_route_gateway.min_length
      valid_name_unique = length(regexall(local.az.express_route_gateway.regex, local.az.express_route_gateway.name_unique)) > 0
    }
    firewall = {
      valid_name        = length(regexall(local.az.firewall.regex, local.az.firewall.name)) > 0 && length(local.az.firewall.name) > local.az.firewall.min_length
      valid_name_unique = length(regexall(local.az.firewall.regex, local.az.firewall.name_unique)) > 0
    }
    firewall_application_rule_collection = {
      valid_name        = length(regexall(local.az.firewall_application_rule_collection.regex, local.az.firewall_application_rule_collection.name)) > 0 && length(local.az.firewall_application_rule_collection.name) > local.az.firewall_application_rule_collection.min_length
      valid_name_unique = length(regexall(local.az.firewall_application_rule_collection.regex, local.az.firewall_application_rule_collection.name_unique)) > 0
    }
    firewall_ip_configuration = {
      valid_name        = length(regexall(local.az.firewall_ip_configuration.regex, local.az.firewall_ip_configuration.name)) > 0 && length(local.az.firewall_ip_configuration.name) > local.az.firewall_ip_configuration.min_length
      valid_name_unique = length(regexall(local.az.firewall_ip_configuration.regex, local.az.firewall_ip_configuration.name_unique)) > 0
    }
    firewall_nat_rule_collection = {
      valid_name        = length(regexall(local.az.firewall_nat_rule_collection.regex, local.az.firewall_nat_rule_collection.name)) > 0 && length(local.az.firewall_nat_rule_collection.name) > local.az.firewall_nat_rule_collection.min_length
      valid_name_unique = length(regexall(local.az.firewall_nat_rule_collection.regex, local.az.firewall_nat_rule_collection.name_unique)) > 0
    }
    firewall_network_rule_collection = {
      valid_name        = length(regexall(local.az.firewall_network_rule_collection.regex, local.az.firewall_network_rule_collection.name)) > 0 && length(local.az.firewall_network_rule_collection.name) > local.az.firewall_network_rule_collection.min_length
      valid_name_unique = length(regexall(local.az.firewall_network_rule_collection.regex, local.az.firewall_network_rule_collection.name_unique)) > 0
    }
    firewall_policy = {
      valid_name        = length(regexall(local.az.firewall_policy.regex, local.az.firewall_policy.name)) > 0 && length(local.az.firewall_policy.name) > local.az.firewall_policy.min_length
      valid_name_unique = length(regexall(local.az.firewall_policy.regex, local.az.firewall_policy.name_unique)) > 0
    }
    firewall_policy_rule_collection_group = {
      valid_name        = length(regexall(local.az.firewall_policy_rule_collection_group.regex, local.az.firewall_policy_rule_collection_group.name)) > 0 && length(local.az.firewall_policy_rule_collection_group.name) > local.az.firewall_policy_rule_collection_group.min_length
      valid_name_unique = length(regexall(local.az.firewall_policy_rule_collection_group.regex, local.az.firewall_policy_rule_collection_group.name_unique)) > 0
    }
    frontdoor = {
      valid_name        = length(regexall(local.az.frontdoor.regex, local.az.frontdoor.name)) > 0 && length(local.az.frontdoor.name) > local.az.frontdoor.min_length
      valid_name_unique = length(regexall(local.az.frontdoor.regex, local.az.frontdoor.name_unique)) > 0
    }
    frontdoor_firewall_policy = {
      valid_name        = length(regexall(local.az.frontdoor_firewall_policy.regex, local.az.frontdoor_firewall_policy.name)) > 0 && length(local.az.frontdoor_firewall_policy.name) > local.az.frontdoor_firewall_policy.min_length
      valid_name_unique = length(regexall(local.az.frontdoor_firewall_policy.regex, local.az.frontdoor_firewall_policy.name_unique)) > 0
    }
    function_app = {
      valid_name        = length(regexall(local.az.function_app.regex, local.az.function_app.name)) > 0 && length(local.az.function_app.name) > local.az.function_app.min_length
      valid_name_unique = length(regexall(local.az.function_app.regex, local.az.function_app.name_unique)) > 0
    }
    function_app_slot = {
      valid_name        = length(regexall(local.az.function_app_slot.regex, local.az.function_app_slot.name)) > 0 && length(local.az.function_app_slot.name) > local.az.function_app_slot.min_length
      valid_name_unique = length(regexall(local.az.function_app_slot.regex, local.az.function_app_slot.name_unique)) > 0
    }
    hdinsight_hadoop_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_hadoop_cluster.regex, local.az.hdinsight_hadoop_cluster.name)) > 0 && length(local.az.hdinsight_hadoop_cluster.name) > local.az.hdinsight_hadoop_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_hadoop_cluster.regex, local.az.hdinsight_hadoop_cluster.name_unique)) > 0
    }
    hdinsight_hbase_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_hbase_cluster.regex, local.az.hdinsight_hbase_cluster.name)) > 0 && length(local.az.hdinsight_hbase_cluster.name) > local.az.hdinsight_hbase_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_hbase_cluster.regex, local.az.hdinsight_hbase_cluster.name_unique)) > 0
    }
    hdinsight_interactive_query_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_interactive_query_cluster.regex, local.az.hdinsight_interactive_query_cluster.name)) > 0 && length(local.az.hdinsight_interactive_query_cluster.name) > local.az.hdinsight_interactive_query_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_interactive_query_cluster.regex, local.az.hdinsight_interactive_query_cluster.name_unique)) > 0
    }
    hdinsight_kafka_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_kafka_cluster.regex, local.az.hdinsight_kafka_cluster.name)) > 0 && length(local.az.hdinsight_kafka_cluster.name) > local.az.hdinsight_kafka_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_kafka_cluster.regex, local.az.hdinsight_kafka_cluster.name_unique)) > 0
    }
    hdinsight_ml_services_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_ml_services_cluster.regex, local.az.hdinsight_ml_services_cluster.name)) > 0 && length(local.az.hdinsight_ml_services_cluster.name) > local.az.hdinsight_ml_services_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_ml_services_cluster.regex, local.az.hdinsight_ml_services_cluster.name_unique)) > 0
    }
    hdinsight_rserver_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_rserver_cluster.regex, local.az.hdinsight_rserver_cluster.name)) > 0 && length(local.az.hdinsight_rserver_cluster.name) > local.az.hdinsight_rserver_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_rserver_cluster.regex, local.az.hdinsight_rserver_cluster.name_unique)) > 0
    }
    hdinsight_spark_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_spark_cluster.regex, local.az.hdinsight_spark_cluster.name)) > 0 && length(local.az.hdinsight_spark_cluster.name) > local.az.hdinsight_spark_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_spark_cluster.regex, local.az.hdinsight_spark_cluster.name_unique)) > 0
    }
    hdinsight_storm_cluster = {
      valid_name        = length(regexall(local.az.hdinsight_storm_cluster.regex, local.az.hdinsight_storm_cluster.name)) > 0 && length(local.az.hdinsight_storm_cluster.name) > local.az.hdinsight_storm_cluster.min_length
      valid_name_unique = length(regexall(local.az.hdinsight_storm_cluster.regex, local.az.hdinsight_storm_cluster.name_unique)) > 0
    }
    healthcare_dicom_service = {
      valid_name        = length(regexall(local.az.healthcare_dicom_service.regex, local.az.healthcare_dicom_service.name)) > 0 && length(local.az.healthcare_dicom_service.name) > local.az.healthcare_dicom_service.min_length
      valid_name_unique = length(regexall(local.az.healthcare_dicom_service.regex, local.az.healthcare_dicom_service.name_unique)) > 0
    }
    healthcare_fhir_service = {
      valid_name        = length(regexall(local.az.healthcare_fhir_service.regex, local.az.healthcare_fhir_service.name)) > 0 && length(local.az.healthcare_fhir_service.name) > local.az.healthcare_fhir_service.min_length
      valid_name_unique = length(regexall(local.az.healthcare_fhir_service.regex, local.az.healthcare_fhir_service.name_unique)) > 0
    }
    healthcare_medtech_service = {
      valid_name        = length(regexall(local.az.healthcare_medtech_service.regex, local.az.healthcare_medtech_service.name)) > 0 && length(local.az.healthcare_medtech_service.name) > local.az.healthcare_medtech_service.min_length
      valid_name_unique = length(regexall(local.az.healthcare_medtech_service.regex, local.az.healthcare_medtech_service.name_unique)) > 0
    }
    healthcare_service = {
      valid_name        = length(regexall(local.az.healthcare_service.regex, local.az.healthcare_service.name)) > 0 && length(local.az.healthcare_service.name) > local.az.healthcare_service.min_length
      valid_name_unique = length(regexall(local.az.healthcare_service.regex, local.az.healthcare_service.name_unique)) > 0
    }
    healthcare_workspace = {
      valid_name        = length(regexall(local.az.healthcare_workspace.regex, local.az.healthcare_workspace.name)) > 0 && length(local.az.healthcare_workspace.name) > local.az.healthcare_workspace.min_length
      valid_name_unique = length(regexall(local.az.healthcare_workspace.regex, local.az.healthcare_workspace.name_unique)) > 0
    }
    image = {
      valid_name        = length(regexall(local.az.image.regex, local.az.image.name)) > 0 && length(local.az.image.name) > local.az.image.min_length
      valid_name_unique = length(regexall(local.az.image.regex, local.az.image.name_unique)) > 0
    }
    integration_service_environment = {
      valid_name        = length(regexall(local.az.integration_service_environment.regex, local.az.integration_service_environment.name)) > 0 && length(local.az.integration_service_environment.name) > local.az.integration_service_environment.min_length
      valid_name_unique = length(regexall(local.az.integration_service_environment.regex, local.az.integration_service_environment.name_unique)) > 0
    }
    iot_security_device_group = {
      valid_name        = length(regexall(local.az.iot_security_device_group.regex, local.az.iot_security_device_group.name)) > 0 && length(local.az.iot_security_device_group.name) > local.az.iot_security_device_group.min_length
      valid_name_unique = length(regexall(local.az.iot_security_device_group.regex, local.az.iot_security_device_group.name_unique)) > 0
    }
    iot_security_solution = {
      valid_name        = length(regexall(local.az.iot_security_solution.regex, local.az.iot_security_solution.name)) > 0 && length(local.az.iot_security_solution.name) > local.az.iot_security_solution.min_length
      valid_name_unique = length(regexall(local.az.iot_security_solution.regex, local.az.iot_security_solution.name_unique)) > 0
    }
    iotcentral_application = {
      valid_name        = length(regexall(local.az.iotcentral_application.regex, local.az.iotcentral_application.name)) > 0 && length(local.az.iotcentral_application.name) > local.az.iotcentral_application.min_length
      valid_name_unique = length(regexall(local.az.iotcentral_application.regex, local.az.iotcentral_application.name_unique)) > 0
    }
    iothub = {
      valid_name        = length(regexall(local.az.iothub.regex, local.az.iothub.name)) > 0 && length(local.az.iothub.name) > local.az.iothub.min_length
      valid_name_unique = length(regexall(local.az.iothub.regex, local.az.iothub.name_unique)) > 0
    }
    iothub_consumer_group = {
      valid_name        = length(regexall(local.az.iothub_consumer_group.regex, local.az.iothub_consumer_group.name)) > 0 && length(local.az.iothub_consumer_group.name) > local.az.iothub_consumer_group.min_length
      valid_name_unique = length(regexall(local.az.iothub_consumer_group.regex, local.az.iothub_consumer_group.name_unique)) > 0
    }
    iothub_dps = {
      valid_name        = length(regexall(local.az.iothub_dps.regex, local.az.iothub_dps.name)) > 0 && length(local.az.iothub_dps.name) > local.az.iothub_dps.min_length
      valid_name_unique = length(regexall(local.az.iothub_dps.regex, local.az.iothub_dps.name_unique)) > 0
    }
    iothub_dps_certificate = {
      valid_name        = length(regexall(local.az.iothub_dps_certificate.regex, local.az.iothub_dps_certificate.name)) > 0 && length(local.az.iothub_dps_certificate.name) > local.az.iothub_dps_certificate.min_length
      valid_name_unique = length(regexall(local.az.iothub_dps_certificate.regex, local.az.iothub_dps_certificate.name_unique)) > 0
    }
    ip_group = {
      valid_name        = length(regexall(local.az.ip_group.regex, local.az.ip_group.name)) > 0 && length(local.az.ip_group.name) > local.az.ip_group.min_length
      valid_name_unique = length(regexall(local.az.ip_group.regex, local.az.ip_group.name_unique)) > 0
    }
    key_vault = {
      valid_name        = length(regexall(local.az.key_vault.regex, local.az.key_vault.name)) > 0 && length(local.az.key_vault.name) > local.az.key_vault.min_length
      valid_name_unique = length(regexall(local.az.key_vault.regex, local.az.key_vault.name_unique)) > 0
    }
    key_vault_certificate = {
      valid_name        = length(regexall(local.az.key_vault_certificate.regex, local.az.key_vault_certificate.name)) > 0 && length(local.az.key_vault_certificate.name) > local.az.key_vault_certificate.min_length
      valid_name_unique = length(regexall(local.az.key_vault_certificate.regex, local.az.key_vault_certificate.name_unique)) > 0
    }
    key_vault_key = {
      valid_name        = length(regexall(local.az.key_vault_key.regex, local.az.key_vault_key.name)) > 0 && length(local.az.key_vault_key.name) > local.az.key_vault_key.min_length
      valid_name_unique = length(regexall(local.az.key_vault_key.regex, local.az.key_vault_key.name_unique)) > 0
    }
    key_vault_secret = {
      valid_name        = length(regexall(local.az.key_vault_secret.regex, local.az.key_vault_secret.name)) > 0 && length(local.az.key_vault_secret.name) > local.az.key_vault_secret.min_length
      valid_name_unique = length(regexall(local.az.key_vault_secret.regex, local.az.key_vault_secret.name_unique)) > 0
    }
    kubernetes_cluster = {
      valid_name        = length(regexall(local.az.kubernetes_cluster.regex, local.az.kubernetes_cluster.name)) > 0 && length(local.az.kubernetes_cluster.name) > local.az.kubernetes_cluster.min_length
      valid_name_unique = length(regexall(local.az.kubernetes_cluster.regex, local.az.kubernetes_cluster.name_unique)) > 0
    }
    kubernetes_fleet_manager = {
      valid_name        = length(regexall(local.az.kubernetes_fleet_manager.regex, local.az.kubernetes_fleet_manager.name)) > 0 && length(local.az.kubernetes_fleet_manager.name) > local.az.kubernetes_fleet_manager.min_length
      valid_name_unique = length(regexall(local.az.kubernetes_fleet_manager.regex, local.az.kubernetes_fleet_manager.name_unique)) > 0
    }
    kusto_cluster = {
      valid_name        = length(regexall(local.az.kusto_cluster.regex, local.az.kusto_cluster.name)) > 0 && length(local.az.kusto_cluster.name) > local.az.kusto_cluster.min_length
      valid_name_unique = length(regexall(local.az.kusto_cluster.regex, local.az.kusto_cluster.name_unique)) > 0
    }
    kusto_database = {
      valid_name        = length(regexall(local.az.kusto_database.regex, local.az.kusto_database.name)) > 0 && length(local.az.kusto_database.name) > local.az.kusto_database.min_length
      valid_name_unique = length(regexall(local.az.kusto_database.regex, local.az.kusto_database.name_unique)) > 0
    }
    kusto_eventhub_data_connection = {
      valid_name        = length(regexall(local.az.kusto_eventhub_data_connection.regex, local.az.kusto_eventhub_data_connection.name)) > 0 && length(local.az.kusto_eventhub_data_connection.name) > local.az.kusto_eventhub_data_connection.min_length
      valid_name_unique = length(regexall(local.az.kusto_eventhub_data_connection.regex, local.az.kusto_eventhub_data_connection.name_unique)) > 0
    }
    lb = {
      valid_name        = length(regexall(local.az.lb.regex, local.az.lb.name)) > 0 && length(local.az.lb.name) > local.az.lb.min_length
      valid_name_unique = length(regexall(local.az.lb.regex, local.az.lb.name_unique)) > 0
    }
    lb_backend_address_pool = {
      valid_name        = length(regexall(local.az.lb_backend_address_pool.regex, local.az.lb_backend_address_pool.name)) > 0 && length(local.az.lb_backend_address_pool.name) > local.az.lb_backend_address_pool.min_length
      valid_name_unique = length(regexall(local.az.lb_backend_address_pool.regex, local.az.lb_backend_address_pool.name_unique)) > 0
    }
    lb_backend_pool = {
      valid_name        = length(regexall(local.az.lb_backend_pool.regex, local.az.lb_backend_pool.name)) > 0 && length(local.az.lb_backend_pool.name) > local.az.lb_backend_pool.min_length
      valid_name_unique = length(regexall(local.az.lb_backend_pool.regex, local.az.lb_backend_pool.name_unique)) > 0
    }
    lb_nat_pool = {
      valid_name        = length(regexall(local.az.lb_nat_pool.regex, local.az.lb_nat_pool.name)) > 0 && length(local.az.lb_nat_pool.name) > local.az.lb_nat_pool.min_length
      valid_name_unique = length(regexall(local.az.lb_nat_pool.regex, local.az.lb_nat_pool.name_unique)) > 0
    }
    lb_nat_rule = {
      valid_name        = length(regexall(local.az.lb_nat_rule.regex, local.az.lb_nat_rule.name)) > 0 && length(local.az.lb_nat_rule.name) > local.az.lb_nat_rule.min_length
      valid_name_unique = length(regexall(local.az.lb_nat_rule.regex, local.az.lb_nat_rule.name_unique)) > 0
    }
    lb_outbound_rule = {
      valid_name        = length(regexall(local.az.lb_outbound_rule.regex, local.az.lb_outbound_rule.name)) > 0 && length(local.az.lb_outbound_rule.name) > local.az.lb_outbound_rule.min_length
      valid_name_unique = length(regexall(local.az.lb_outbound_rule.regex, local.az.lb_outbound_rule.name_unique)) > 0
    }
    lb_probe = {
      valid_name        = length(regexall(local.az.lb_probe.regex, local.az.lb_probe.name)) > 0 && length(local.az.lb_probe.name) > local.az.lb_probe.min_length
      valid_name_unique = length(regexall(local.az.lb_probe.regex, local.az.lb_probe.name_unique)) > 0
    }
    lb_rule = {
      valid_name        = length(regexall(local.az.lb_rule.regex, local.az.lb_rule.name)) > 0 && length(local.az.lb_rule.name) > local.az.lb_rule.min_length
      valid_name_unique = length(regexall(local.az.lb_rule.regex, local.az.lb_rule.name_unique)) > 0
    }
    linux_virtual_machine = {
      valid_name        = length(regexall(local.az.linux_virtual_machine.regex, local.az.linux_virtual_machine.name)) > 0 && length(local.az.linux_virtual_machine.name) > local.az.linux_virtual_machine.min_length
      valid_name_unique = length(regexall(local.az.linux_virtual_machine.regex, local.az.linux_virtual_machine.name_unique)) > 0
    }
    linux_virtual_machine_scale_set = {
      valid_name        = length(regexall(local.az.linux_virtual_machine_scale_set.regex, local.az.linux_virtual_machine_scale_set.name)) > 0 && length(local.az.linux_virtual_machine_scale_set.name) > local.az.linux_virtual_machine_scale_set.min_length
      valid_name_unique = length(regexall(local.az.linux_virtual_machine_scale_set.regex, local.az.linux_virtual_machine_scale_set.name_unique)) > 0
    }
    load_test = {
      valid_name        = length(regexall(local.az.load_test.regex, local.az.load_test.name)) > 0 && length(local.az.load_test.name) > local.az.load_test.min_length
      valid_name_unique = length(regexall(local.az.load_test.regex, local.az.load_test.name_unique)) > 0
    }
    local_network_gateway = {
      valid_name        = length(regexall(local.az.local_network_gateway.regex, local.az.local_network_gateway.name)) > 0 && length(local.az.local_network_gateway.name) > local.az.local_network_gateway.min_length
      valid_name_unique = length(regexall(local.az.local_network_gateway.regex, local.az.local_network_gateway.name_unique)) > 0
    }
    log_analytics_cluster = {
      valid_name        = length(regexall(local.az.log_analytics_cluster.regex, local.az.log_analytics_cluster.name)) > 0 && length(local.az.log_analytics_cluster.name) > local.az.log_analytics_cluster.min_length
      valid_name_unique = length(regexall(local.az.log_analytics_cluster.regex, local.az.log_analytics_cluster.name_unique)) > 0
    }
    log_analytics_storage_insights = {
      valid_name        = length(regexall(local.az.log_analytics_storage_insights.regex, local.az.log_analytics_storage_insights.name)) > 0 && length(local.az.log_analytics_storage_insights.name) > local.az.log_analytics_storage_insights.min_length
      valid_name_unique = length(regexall(local.az.log_analytics_storage_insights.regex, local.az.log_analytics_storage_insights.name_unique)) > 0
    }
    log_analytics_workspace = {
      valid_name        = length(regexall(local.az.log_analytics_workspace.regex, local.az.log_analytics_workspace.name)) > 0 && length(local.az.log_analytics_workspace.name) > local.az.log_analytics_workspace.min_length
      valid_name_unique = length(regexall(local.az.log_analytics_workspace.regex, local.az.log_analytics_workspace.name_unique)) > 0
    }
    logic_app_action_custom = {
      valid_name        = length(regexall(local.az.logic_app_action_custom.regex, local.az.logic_app_action_custom.name)) > 0 && length(local.az.logic_app_action_custom.name) > local.az.logic_app_action_custom.min_length
      valid_name_unique = length(regexall(local.az.logic_app_action_custom.regex, local.az.logic_app_action_custom.name_unique)) > 0
    }
    logic_app_action_http = {
      valid_name        = length(regexall(local.az.logic_app_action_http.regex, local.az.logic_app_action_http.name)) > 0 && length(local.az.logic_app_action_http.name) > local.az.logic_app_action_http.min_length
      valid_name_unique = length(regexall(local.az.logic_app_action_http.regex, local.az.logic_app_action_http.name_unique)) > 0
    }
    logic_app_integration_account = {
      valid_name        = length(regexall(local.az.logic_app_integration_account.regex, local.az.logic_app_integration_account.name)) > 0 && length(local.az.logic_app_integration_account.name) > local.az.logic_app_integration_account.min_length
      valid_name_unique = length(regexall(local.az.logic_app_integration_account.regex, local.az.logic_app_integration_account.name_unique)) > 0
    }
    logic_app_trigger_custom = {
      valid_name        = length(regexall(local.az.logic_app_trigger_custom.regex, local.az.logic_app_trigger_custom.name)) > 0 && length(local.az.logic_app_trigger_custom.name) > local.az.logic_app_trigger_custom.min_length
      valid_name_unique = length(regexall(local.az.logic_app_trigger_custom.regex, local.az.logic_app_trigger_custom.name_unique)) > 0
    }
    logic_app_trigger_http_request = {
      valid_name        = length(regexall(local.az.logic_app_trigger_http_request.regex, local.az.logic_app_trigger_http_request.name)) > 0 && length(local.az.logic_app_trigger_http_request.name) > local.az.logic_app_trigger_http_request.min_length
      valid_name_unique = length(regexall(local.az.logic_app_trigger_http_request.regex, local.az.logic_app_trigger_http_request.name_unique)) > 0
    }
    logic_app_trigger_recurrence = {
      valid_name        = length(regexall(local.az.logic_app_trigger_recurrence.regex, local.az.logic_app_trigger_recurrence.name)) > 0 && length(local.az.logic_app_trigger_recurrence.name) > local.az.logic_app_trigger_recurrence.min_length
      valid_name_unique = length(regexall(local.az.logic_app_trigger_recurrence.regex, local.az.logic_app_trigger_recurrence.name_unique)) > 0
    }
    logic_app_workflow = {
      valid_name        = length(regexall(local.az.logic_app_workflow.regex, local.az.logic_app_workflow.name)) > 0 && length(local.az.logic_app_workflow.name) > local.az.logic_app_workflow.min_length
      valid_name_unique = length(regexall(local.az.logic_app_workflow.regex, local.az.logic_app_workflow.name_unique)) > 0
    }
    machine_learning_compute_instance = {
      valid_name        = length(regexall(local.az.machine_learning_compute_instance.regex, local.az.machine_learning_compute_instance.name)) > 0 && length(local.az.machine_learning_compute_instance.name) > local.az.machine_learning_compute_instance.min_length
      valid_name_unique = length(regexall(local.az.machine_learning_compute_instance.regex, local.az.machine_learning_compute_instance.name_unique)) > 0
    }
    machine_learning_workspace = {
      valid_name        = length(regexall(local.az.machine_learning_workspace.regex, local.az.machine_learning_workspace.name)) > 0 && length(local.az.machine_learning_workspace.name) > local.az.machine_learning_workspace.min_length
      valid_name_unique = length(regexall(local.az.machine_learning_workspace.regex, local.az.machine_learning_workspace.name_unique)) > 0
    }
    maintenance_configuration = {
      valid_name        = length(regexall(local.az.maintenance_configuration.regex, local.az.maintenance_configuration.name)) > 0 && length(local.az.maintenance_configuration.name) > local.az.maintenance_configuration.min_length
      valid_name_unique = length(regexall(local.az.maintenance_configuration.regex, local.az.maintenance_configuration.name_unique)) > 0
    }
    managed_disk = {
      valid_name        = length(regexall(local.az.managed_disk.regex, local.az.managed_disk.name)) > 0 && length(local.az.managed_disk.name) > local.az.managed_disk.min_length
      valid_name_unique = length(regexall(local.az.managed_disk.regex, local.az.managed_disk.name_unique)) > 0
    }
    maps_account = {
      valid_name        = length(regexall(local.az.maps_account.regex, local.az.maps_account.name)) > 0 && length(local.az.maps_account.name) > local.az.maps_account.min_length
      valid_name_unique = length(regexall(local.az.maps_account.regex, local.az.maps_account.name_unique)) > 0
    }
    mariadb_database = {
      valid_name        = length(regexall(local.az.mariadb_database.regex, local.az.mariadb_database.name)) > 0 && length(local.az.mariadb_database.name) > local.az.mariadb_database.min_length
      valid_name_unique = length(regexall(local.az.mariadb_database.regex, local.az.mariadb_database.name_unique)) > 0
    }
    mariadb_firewall_rule = {
      valid_name        = length(regexall(local.az.mariadb_firewall_rule.regex, local.az.mariadb_firewall_rule.name)) > 0 && length(local.az.mariadb_firewall_rule.name) > local.az.mariadb_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.mariadb_firewall_rule.regex, local.az.mariadb_firewall_rule.name_unique)) > 0
    }
    mariadb_server = {
      valid_name        = length(regexall(local.az.mariadb_server.regex, local.az.mariadb_server.name)) > 0 && length(local.az.mariadb_server.name) > local.az.mariadb_server.min_length
      valid_name_unique = length(regexall(local.az.mariadb_server.regex, local.az.mariadb_server.name_unique)) > 0
    }
    mariadb_virtual_network_rule = {
      valid_name        = length(regexall(local.az.mariadb_virtual_network_rule.regex, local.az.mariadb_virtual_network_rule.name)) > 0 && length(local.az.mariadb_virtual_network_rule.name) > local.az.mariadb_virtual_network_rule.min_length
      valid_name_unique = length(regexall(local.az.mariadb_virtual_network_rule.regex, local.az.mariadb_virtual_network_rule.name_unique)) > 0
    }
    monitor_action_group = {
      valid_name        = length(regexall(local.az.monitor_action_group.regex, local.az.monitor_action_group.name)) > 0 && length(local.az.monitor_action_group.name) > local.az.monitor_action_group.min_length
      valid_name_unique = length(regexall(local.az.monitor_action_group.regex, local.az.monitor_action_group.name_unique)) > 0
    }
    monitor_autoscale_setting = {
      valid_name        = length(regexall(local.az.monitor_autoscale_setting.regex, local.az.monitor_autoscale_setting.name)) > 0 && length(local.az.monitor_autoscale_setting.name) > local.az.monitor_autoscale_setting.min_length
      valid_name_unique = length(regexall(local.az.monitor_autoscale_setting.regex, local.az.monitor_autoscale_setting.name_unique)) > 0
    }
    monitor_data_collection_endpoint = {
      valid_name        = length(regexall(local.az.monitor_data_collection_endpoint.regex, local.az.monitor_data_collection_endpoint.name)) > 0 && length(local.az.monitor_data_collection_endpoint.name) > local.az.monitor_data_collection_endpoint.min_length
      valid_name_unique = length(regexall(local.az.monitor_data_collection_endpoint.regex, local.az.monitor_data_collection_endpoint.name_unique)) > 0
    }
    monitor_diagnostic_setting = {
      valid_name        = length(regexall(local.az.monitor_diagnostic_setting.regex, local.az.monitor_diagnostic_setting.name)) > 0 && length(local.az.monitor_diagnostic_setting.name) > local.az.monitor_diagnostic_setting.min_length
      valid_name_unique = length(regexall(local.az.monitor_diagnostic_setting.regex, local.az.monitor_diagnostic_setting.name_unique)) > 0
    }
    monitor_private_link_scope = {
      valid_name        = length(regexall(local.az.monitor_private_link_scope.regex, local.az.monitor_private_link_scope.name)) > 0 && length(local.az.monitor_private_link_scope.name) > local.az.monitor_private_link_scope.min_length
      valid_name_unique = length(regexall(local.az.monitor_private_link_scope.regex, local.az.monitor_private_link_scope.name_unique)) > 0
    }
    monitor_scheduled_query_rules_alert = {
      valid_name        = length(regexall(local.az.monitor_scheduled_query_rules_alert.regex, local.az.monitor_scheduled_query_rules_alert.name)) > 0 && length(local.az.monitor_scheduled_query_rules_alert.name) > local.az.monitor_scheduled_query_rules_alert.min_length
      valid_name_unique = length(regexall(local.az.monitor_scheduled_query_rules_alert.regex, local.az.monitor_scheduled_query_rules_alert.name_unique)) > 0
    }
    mssql_database = {
      valid_name        = length(regexall(local.az.mssql_database.regex, local.az.mssql_database.name)) > 0 && length(local.az.mssql_database.name) > local.az.mssql_database.min_length
      valid_name_unique = length(regexall(local.az.mssql_database.regex, local.az.mssql_database.name_unique)) > 0
    }
    mssql_elasticpool = {
      valid_name        = length(regexall(local.az.mssql_elasticpool.regex, local.az.mssql_elasticpool.name)) > 0 && length(local.az.mssql_elasticpool.name) > local.az.mssql_elasticpool.min_length
      valid_name_unique = length(regexall(local.az.mssql_elasticpool.regex, local.az.mssql_elasticpool.name_unique)) > 0
    }
    mssql_server = {
      valid_name        = length(regexall(local.az.mssql_server.regex, local.az.mssql_server.name)) > 0 && length(local.az.mssql_server.name) > local.az.mssql_server.min_length
      valid_name_unique = length(regexall(local.az.mssql_server.regex, local.az.mssql_server.name_unique)) > 0
    }
    mysql_database = {
      valid_name        = length(regexall(local.az.mysql_database.regex, local.az.mysql_database.name)) > 0 && length(local.az.mysql_database.name) > local.az.mysql_database.min_length
      valid_name_unique = length(regexall(local.az.mysql_database.regex, local.az.mysql_database.name_unique)) > 0
    }
    mysql_firewall_rule = {
      valid_name        = length(regexall(local.az.mysql_firewall_rule.regex, local.az.mysql_firewall_rule.name)) > 0 && length(local.az.mysql_firewall_rule.name) > local.az.mysql_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.mysql_firewall_rule.regex, local.az.mysql_firewall_rule.name_unique)) > 0
    }
    mysql_flexible_server = {
      valid_name        = length(regexall(local.az.mysql_flexible_server.regex, local.az.mysql_flexible_server.name)) > 0 && length(local.az.mysql_flexible_server.name) > local.az.mysql_flexible_server.min_length
      valid_name_unique = length(regexall(local.az.mysql_flexible_server.regex, local.az.mysql_flexible_server.name_unique)) > 0
    }
    mysql_flexible_server_database = {
      valid_name        = length(regexall(local.az.mysql_flexible_server_database.regex, local.az.mysql_flexible_server_database.name)) > 0 && length(local.az.mysql_flexible_server_database.name) > local.az.mysql_flexible_server_database.min_length
      valid_name_unique = length(regexall(local.az.mysql_flexible_server_database.regex, local.az.mysql_flexible_server_database.name_unique)) > 0
    }
    mysql_flexible_server_firewall_rule = {
      valid_name        = length(regexall(local.az.mysql_flexible_server_firewall_rule.regex, local.az.mysql_flexible_server_firewall_rule.name)) > 0 && length(local.az.mysql_flexible_server_firewall_rule.name) > local.az.mysql_flexible_server_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.mysql_flexible_server_firewall_rule.regex, local.az.mysql_flexible_server_firewall_rule.name_unique)) > 0
    }
    mysql_server = {
      valid_name        = length(regexall(local.az.mysql_server.regex, local.az.mysql_server.name)) > 0 && length(local.az.mysql_server.name) > local.az.mysql_server.min_length
      valid_name_unique = length(regexall(local.az.mysql_server.regex, local.az.mysql_server.name_unique)) > 0
    }
    mysql_virtual_network_rule = {
      valid_name        = length(regexall(local.az.mysql_virtual_network_rule.regex, local.az.mysql_virtual_network_rule.name)) > 0 && length(local.az.mysql_virtual_network_rule.name) > local.az.mysql_virtual_network_rule.min_length
      valid_name_unique = length(regexall(local.az.mysql_virtual_network_rule.regex, local.az.mysql_virtual_network_rule.name_unique)) > 0
    }
    netapp_account = {
      valid_name        = length(regexall(local.az.netapp_account.regex, local.az.netapp_account.name)) > 0 && length(local.az.netapp_account.name) > local.az.netapp_account.min_length
      valid_name_unique = length(regexall(local.az.netapp_account.regex, local.az.netapp_account.name_unique)) > 0
    }
    netapp_pool = {
      valid_name        = length(regexall(local.az.netapp_pool.regex, local.az.netapp_pool.name)) > 0 && length(local.az.netapp_pool.name) > local.az.netapp_pool.min_length
      valid_name_unique = length(regexall(local.az.netapp_pool.regex, local.az.netapp_pool.name_unique)) > 0
    }
    netapp_snapshot = {
      valid_name        = length(regexall(local.az.netapp_snapshot.regex, local.az.netapp_snapshot.name)) > 0 && length(local.az.netapp_snapshot.name) > local.az.netapp_snapshot.min_length
      valid_name_unique = length(regexall(local.az.netapp_snapshot.regex, local.az.netapp_snapshot.name_unique)) > 0
    }
    netapp_volume = {
      valid_name        = length(regexall(local.az.netapp_volume.regex, local.az.netapp_volume.name)) > 0 && length(local.az.netapp_volume.name) > local.az.netapp_volume.min_length
      valid_name_unique = length(regexall(local.az.netapp_volume.regex, local.az.netapp_volume.name_unique)) > 0
    }
    network_ddos_protection_plan = {
      valid_name        = length(regexall(local.az.network_ddos_protection_plan.regex, local.az.network_ddos_protection_plan.name)) > 0 && length(local.az.network_ddos_protection_plan.name) > local.az.network_ddos_protection_plan.min_length
      valid_name_unique = length(regexall(local.az.network_ddos_protection_plan.regex, local.az.network_ddos_protection_plan.name_unique)) > 0
    }
    network_interface = {
      valid_name        = length(regexall(local.az.network_interface.regex, local.az.network_interface.name)) > 0 && length(local.az.network_interface.name) > local.az.network_interface.min_length
      valid_name_unique = length(regexall(local.az.network_interface.regex, local.az.network_interface.name_unique)) > 0
    }
    network_security_group = {
      valid_name        = length(regexall(local.az.network_security_group.regex, local.az.network_security_group.name)) > 0 && length(local.az.network_security_group.name) > local.az.network_security_group.min_length
      valid_name_unique = length(regexall(local.az.network_security_group.regex, local.az.network_security_group.name_unique)) > 0
    }
    network_security_group_rule = {
      valid_name        = length(regexall(local.az.network_security_group_rule.regex, local.az.network_security_group_rule.name)) > 0 && length(local.az.network_security_group_rule.name) > local.az.network_security_group_rule.min_length
      valid_name_unique = length(regexall(local.az.network_security_group_rule.regex, local.az.network_security_group_rule.name_unique)) > 0
    }
    network_security_rule = {
      valid_name        = length(regexall(local.az.network_security_rule.regex, local.az.network_security_rule.name)) > 0 && length(local.az.network_security_rule.name) > local.az.network_security_rule.min_length
      valid_name_unique = length(regexall(local.az.network_security_rule.regex, local.az.network_security_rule.name_unique)) > 0
    }
    network_watcher = {
      valid_name        = length(regexall(local.az.network_watcher.regex, local.az.network_watcher.name)) > 0 && length(local.az.network_watcher.name) > local.az.network_watcher.min_length
      valid_name_unique = length(regexall(local.az.network_watcher.regex, local.az.network_watcher.name_unique)) > 0
    }
    network_watcher_flow_log = {
      valid_name        = length(regexall(local.az.network_watcher_flow_log.regex, local.az.network_watcher_flow_log.name)) > 0 && length(local.az.network_watcher_flow_log.name) > local.az.network_watcher_flow_log.min_length
      valid_name_unique = length(regexall(local.az.network_watcher_flow_log.regex, local.az.network_watcher_flow_log.name_unique)) > 0
    }
    nginx_deployment = {
      valid_name        = length(regexall(local.az.nginx_deployment.regex, local.az.nginx_deployment.name)) > 0 && length(local.az.nginx_deployment.name) > local.az.nginx_deployment.min_length
      valid_name_unique = length(regexall(local.az.nginx_deployment.regex, local.az.nginx_deployment.name_unique)) > 0
    }
    notification_hub = {
      valid_name        = length(regexall(local.az.notification_hub.regex, local.az.notification_hub.name)) > 0 && length(local.az.notification_hub.name) > local.az.notification_hub.min_length
      valid_name_unique = length(regexall(local.az.notification_hub.regex, local.az.notification_hub.name_unique)) > 0
    }
    notification_hub_authorization_rule = {
      valid_name        = length(regexall(local.az.notification_hub_authorization_rule.regex, local.az.notification_hub_authorization_rule.name)) > 0 && length(local.az.notification_hub_authorization_rule.name) > local.az.notification_hub_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.notification_hub_authorization_rule.regex, local.az.notification_hub_authorization_rule.name_unique)) > 0
    }
    notification_hub_namespace = {
      valid_name        = length(regexall(local.az.notification_hub_namespace.regex, local.az.notification_hub_namespace.name)) > 0 && length(local.az.notification_hub_namespace.name) > local.az.notification_hub_namespace.min_length
      valid_name_unique = length(regexall(local.az.notification_hub_namespace.regex, local.az.notification_hub_namespace.name_unique)) > 0
    }
    point_to_site_vpn_gateway = {
      valid_name        = length(regexall(local.az.point_to_site_vpn_gateway.regex, local.az.point_to_site_vpn_gateway.name)) > 0 && length(local.az.point_to_site_vpn_gateway.name) > local.az.point_to_site_vpn_gateway.min_length
      valid_name_unique = length(regexall(local.az.point_to_site_vpn_gateway.regex, local.az.point_to_site_vpn_gateway.name_unique)) > 0
    }
    portal_dashboard = {
      valid_name        = length(regexall(local.az.portal_dashboard.regex, local.az.portal_dashboard.name)) > 0 && length(local.az.portal_dashboard.name) > local.az.portal_dashboard.min_length
      valid_name_unique = length(regexall(local.az.portal_dashboard.regex, local.az.portal_dashboard.name_unique)) > 0
    }
    postgresql_database = {
      valid_name        = length(regexall(local.az.postgresql_database.regex, local.az.postgresql_database.name)) > 0 && length(local.az.postgresql_database.name) > local.az.postgresql_database.min_length
      valid_name_unique = length(regexall(local.az.postgresql_database.regex, local.az.postgresql_database.name_unique)) > 0
    }
    postgresql_firewall_rule = {
      valid_name        = length(regexall(local.az.postgresql_firewall_rule.regex, local.az.postgresql_firewall_rule.name)) > 0 && length(local.az.postgresql_firewall_rule.name) > local.az.postgresql_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.postgresql_firewall_rule.regex, local.az.postgresql_firewall_rule.name_unique)) > 0
    }
    postgresql_flexible_server = {
      valid_name        = length(regexall(local.az.postgresql_flexible_server.regex, local.az.postgresql_flexible_server.name)) > 0 && length(local.az.postgresql_flexible_server.name) > local.az.postgresql_flexible_server.min_length
      valid_name_unique = length(regexall(local.az.postgresql_flexible_server.regex, local.az.postgresql_flexible_server.name_unique)) > 0
    }
    postgresql_flexible_server_database = {
      valid_name        = length(regexall(local.az.postgresql_flexible_server_database.regex, local.az.postgresql_flexible_server_database.name)) > 0 && length(local.az.postgresql_flexible_server_database.name) > local.az.postgresql_flexible_server_database.min_length
      valid_name_unique = length(regexall(local.az.postgresql_flexible_server_database.regex, local.az.postgresql_flexible_server_database.name_unique)) > 0
    }
    postgresql_flexible_server_firewall_rule = {
      valid_name        = length(regexall(local.az.postgresql_flexible_server_firewall_rule.regex, local.az.postgresql_flexible_server_firewall_rule.name)) > 0 && length(local.az.postgresql_flexible_server_firewall_rule.name) > local.az.postgresql_flexible_server_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.postgresql_flexible_server_firewall_rule.regex, local.az.postgresql_flexible_server_firewall_rule.name_unique)) > 0
    }
    postgresql_server = {
      valid_name        = length(regexall(local.az.postgresql_server.regex, local.az.postgresql_server.name)) > 0 && length(local.az.postgresql_server.name) > local.az.postgresql_server.min_length
      valid_name_unique = length(regexall(local.az.postgresql_server.regex, local.az.postgresql_server.name_unique)) > 0
    }
    postgresql_virtual_network_rule = {
      valid_name        = length(regexall(local.az.postgresql_virtual_network_rule.regex, local.az.postgresql_virtual_network_rule.name)) > 0 && length(local.az.postgresql_virtual_network_rule.name) > local.az.postgresql_virtual_network_rule.min_length
      valid_name_unique = length(regexall(local.az.postgresql_virtual_network_rule.regex, local.az.postgresql_virtual_network_rule.name_unique)) > 0
    }
    powerbi_embedded = {
      valid_name        = length(regexall(local.az.powerbi_embedded.regex, local.az.powerbi_embedded.name)) > 0 && length(local.az.powerbi_embedded.name) > local.az.powerbi_embedded.min_length
      valid_name_unique = length(regexall(local.az.powerbi_embedded.regex, local.az.powerbi_embedded.name_unique)) > 0
    }
    private_dns_a_record = {
      valid_name        = length(regexall(local.az.private_dns_a_record.regex, local.az.private_dns_a_record.name)) > 0 && length(local.az.private_dns_a_record.name) > local.az.private_dns_a_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_a_record.regex, local.az.private_dns_a_record.name_unique)) > 0
    }
    private_dns_aaaa_record = {
      valid_name        = length(regexall(local.az.private_dns_aaaa_record.regex, local.az.private_dns_aaaa_record.name)) > 0 && length(local.az.private_dns_aaaa_record.name) > local.az.private_dns_aaaa_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_aaaa_record.regex, local.az.private_dns_aaaa_record.name_unique)) > 0
    }
    private_dns_cname_record = {
      valid_name        = length(regexall(local.az.private_dns_cname_record.regex, local.az.private_dns_cname_record.name)) > 0 && length(local.az.private_dns_cname_record.name) > local.az.private_dns_cname_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_cname_record.regex, local.az.private_dns_cname_record.name_unique)) > 0
    }
    private_dns_mx_record = {
      valid_name        = length(regexall(local.az.private_dns_mx_record.regex, local.az.private_dns_mx_record.name)) > 0 && length(local.az.private_dns_mx_record.name) > local.az.private_dns_mx_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_mx_record.regex, local.az.private_dns_mx_record.name_unique)) > 0
    }
    private_dns_ptr_record = {
      valid_name        = length(regexall(local.az.private_dns_ptr_record.regex, local.az.private_dns_ptr_record.name)) > 0 && length(local.az.private_dns_ptr_record.name) > local.az.private_dns_ptr_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_ptr_record.regex, local.az.private_dns_ptr_record.name_unique)) > 0
    }
    private_dns_resolver = {
      valid_name        = length(regexall(local.az.private_dns_resolver.regex, local.az.private_dns_resolver.name)) > 0 && length(local.az.private_dns_resolver.name) > local.az.private_dns_resolver.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver.regex, local.az.private_dns_resolver.name_unique)) > 0
    }
    private_dns_resolver_dns_forwarding_ruleset = {
      valid_name        = length(regexall(local.az.private_dns_resolver_dns_forwarding_ruleset.regex, local.az.private_dns_resolver_dns_forwarding_ruleset.name)) > 0 && length(local.az.private_dns_resolver_dns_forwarding_ruleset.name) > local.az.private_dns_resolver_dns_forwarding_ruleset.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver_dns_forwarding_ruleset.regex, local.az.private_dns_resolver_dns_forwarding_ruleset.name_unique)) > 0
    }
    private_dns_resolver_forwarding_rule = {
      valid_name        = length(regexall(local.az.private_dns_resolver_forwarding_rule.regex, local.az.private_dns_resolver_forwarding_rule.name)) > 0 && length(local.az.private_dns_resolver_forwarding_rule.name) > local.az.private_dns_resolver_forwarding_rule.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver_forwarding_rule.regex, local.az.private_dns_resolver_forwarding_rule.name_unique)) > 0
    }
    private_dns_resolver_inbound_endpoint = {
      valid_name        = length(regexall(local.az.private_dns_resolver_inbound_endpoint.regex, local.az.private_dns_resolver_inbound_endpoint.name)) > 0 && length(local.az.private_dns_resolver_inbound_endpoint.name) > local.az.private_dns_resolver_inbound_endpoint.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver_inbound_endpoint.regex, local.az.private_dns_resolver_inbound_endpoint.name_unique)) > 0
    }
    private_dns_resolver_outbound_endpoint = {
      valid_name        = length(regexall(local.az.private_dns_resolver_outbound_endpoint.regex, local.az.private_dns_resolver_outbound_endpoint.name)) > 0 && length(local.az.private_dns_resolver_outbound_endpoint.name) > local.az.private_dns_resolver_outbound_endpoint.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver_outbound_endpoint.regex, local.az.private_dns_resolver_outbound_endpoint.name_unique)) > 0
    }
    private_dns_resolver_virtual_network_link = {
      valid_name        = length(regexall(local.az.private_dns_resolver_virtual_network_link.regex, local.az.private_dns_resolver_virtual_network_link.name)) > 0 && length(local.az.private_dns_resolver_virtual_network_link.name) > local.az.private_dns_resolver_virtual_network_link.min_length
      valid_name_unique = length(regexall(local.az.private_dns_resolver_virtual_network_link.regex, local.az.private_dns_resolver_virtual_network_link.name_unique)) > 0
    }
    private_dns_srv_record = {
      valid_name        = length(regexall(local.az.private_dns_srv_record.regex, local.az.private_dns_srv_record.name)) > 0 && length(local.az.private_dns_srv_record.name) > local.az.private_dns_srv_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_srv_record.regex, local.az.private_dns_srv_record.name_unique)) > 0
    }
    private_dns_txt_record = {
      valid_name        = length(regexall(local.az.private_dns_txt_record.regex, local.az.private_dns_txt_record.name)) > 0 && length(local.az.private_dns_txt_record.name) > local.az.private_dns_txt_record.min_length
      valid_name_unique = length(regexall(local.az.private_dns_txt_record.regex, local.az.private_dns_txt_record.name_unique)) > 0
    }
    private_dns_zone = {
      valid_name        = length(regexall(local.az.private_dns_zone.regex, local.az.private_dns_zone.name)) > 0 && length(local.az.private_dns_zone.name) > local.az.private_dns_zone.min_length
      valid_name_unique = length(regexall(local.az.private_dns_zone.regex, local.az.private_dns_zone.name_unique)) > 0
    }
    private_dns_zone_group = {
      valid_name        = length(regexall(local.az.private_dns_zone_group.regex, local.az.private_dns_zone_group.name)) > 0 && length(local.az.private_dns_zone_group.name) > local.az.private_dns_zone_group.min_length
      valid_name_unique = length(regexall(local.az.private_dns_zone_group.regex, local.az.private_dns_zone_group.name_unique)) > 0
    }
    private_endpoint = {
      valid_name        = length(regexall(local.az.private_endpoint.regex, local.az.private_endpoint.name)) > 0 && length(local.az.private_endpoint.name) > local.az.private_endpoint.min_length
      valid_name_unique = length(regexall(local.az.private_endpoint.regex, local.az.private_endpoint.name_unique)) > 0
    }
    private_link_service = {
      valid_name        = length(regexall(local.az.private_link_service.regex, local.az.private_link_service.name)) > 0 && length(local.az.private_link_service.name) > local.az.private_link_service.min_length
      valid_name_unique = length(regexall(local.az.private_link_service.regex, local.az.private_link_service.name_unique)) > 0
    }
    private_service_connection = {
      valid_name        = length(regexall(local.az.private_service_connection.regex, local.az.private_service_connection.name)) > 0 && length(local.az.private_service_connection.name) > local.az.private_service_connection.min_length
      valid_name_unique = length(regexall(local.az.private_service_connection.regex, local.az.private_service_connection.name_unique)) > 0
    }
    proximity_placement_group = {
      valid_name        = length(regexall(local.az.proximity_placement_group.regex, local.az.proximity_placement_group.name)) > 0 && length(local.az.proximity_placement_group.name) > local.az.proximity_placement_group.min_length
      valid_name_unique = length(regexall(local.az.proximity_placement_group.regex, local.az.proximity_placement_group.name_unique)) > 0
    }
    public_ip = {
      valid_name        = length(regexall(local.az.public_ip.regex, local.az.public_ip.name)) > 0 && length(local.az.public_ip.name) > local.az.public_ip.min_length
      valid_name_unique = length(regexall(local.az.public_ip.regex, local.az.public_ip.name_unique)) > 0
    }
    public_ip_prefix = {
      valid_name        = length(regexall(local.az.public_ip_prefix.regex, local.az.public_ip_prefix.name)) > 0 && length(local.az.public_ip_prefix.name) > local.az.public_ip_prefix.min_length
      valid_name_unique = length(regexall(local.az.public_ip_prefix.regex, local.az.public_ip_prefix.name_unique)) > 0
    }
    purview_account = {
      valid_name        = length(regexall(local.az.purview_account.regex, local.az.purview_account.name)) > 0 && length(local.az.purview_account.name) > local.az.purview_account.min_length
      valid_name_unique = length(regexall(local.az.purview_account.regex, local.az.purview_account.name_unique)) > 0
    }
    recovery_services_vault = {
      valid_name        = length(regexall(local.az.recovery_services_vault.regex, local.az.recovery_services_vault.name)) > 0 && length(local.az.recovery_services_vault.name) > local.az.recovery_services_vault.min_length
      valid_name_unique = length(regexall(local.az.recovery_services_vault.regex, local.az.recovery_services_vault.name_unique)) > 0
    }
    recovery_services_vault_backup_policy = {
      valid_name        = length(regexall(local.az.recovery_services_vault_backup_policy.regex, local.az.recovery_services_vault_backup_policy.name)) > 0 && length(local.az.recovery_services_vault_backup_policy.name) > local.az.recovery_services_vault_backup_policy.min_length
      valid_name_unique = length(regexall(local.az.recovery_services_vault_backup_policy.regex, local.az.recovery_services_vault_backup_policy.name_unique)) > 0
    }
    redhat_openshift_cluster = {
      valid_name        = length(regexall(local.az.redhat_openshift_cluster.regex, local.az.redhat_openshift_cluster.name)) > 0 && length(local.az.redhat_openshift_cluster.name) > local.az.redhat_openshift_cluster.min_length
      valid_name_unique = length(regexall(local.az.redhat_openshift_cluster.regex, local.az.redhat_openshift_cluster.name_unique)) > 0
    }
    redhat_openshift_domain = {
      valid_name        = length(regexall(local.az.redhat_openshift_domain.regex, local.az.redhat_openshift_domain.name)) > 0 && length(local.az.redhat_openshift_domain.name) > local.az.redhat_openshift_domain.min_length
      valid_name_unique = length(regexall(local.az.redhat_openshift_domain.regex, local.az.redhat_openshift_domain.name_unique)) > 0
    }
    redis_cache = {
      valid_name        = length(regexall(local.az.redis_cache.regex, local.az.redis_cache.name)) > 0 && length(local.az.redis_cache.name) > local.az.redis_cache.min_length
      valid_name_unique = length(regexall(local.az.redis_cache.regex, local.az.redis_cache.name_unique)) > 0
    }
    redis_firewall_rule = {
      valid_name        = length(regexall(local.az.redis_firewall_rule.regex, local.az.redis_firewall_rule.name)) > 0 && length(local.az.redis_firewall_rule.name) > local.az.redis_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.redis_firewall_rule.regex, local.az.redis_firewall_rule.name_unique)) > 0
    }
    relay_hybrid_connection = {
      valid_name        = length(regexall(local.az.relay_hybrid_connection.regex, local.az.relay_hybrid_connection.name)) > 0 && length(local.az.relay_hybrid_connection.name) > local.az.relay_hybrid_connection.min_length
      valid_name_unique = length(regexall(local.az.relay_hybrid_connection.regex, local.az.relay_hybrid_connection.name_unique)) > 0
    }
    relay_namespace = {
      valid_name        = length(regexall(local.az.relay_namespace.regex, local.az.relay_namespace.name)) > 0 && length(local.az.relay_namespace.name) > local.az.relay_namespace.min_length
      valid_name_unique = length(regexall(local.az.relay_namespace.regex, local.az.relay_namespace.name_unique)) > 0
    }
    resource_group = {
      valid_name        = length(regexall(local.az.resource_group.regex, local.az.resource_group.name)) > 0 && length(local.az.resource_group.name) > local.az.resource_group.min_length
      valid_name_unique = length(regexall(local.az.resource_group.regex, local.az.resource_group.name_unique)) > 0
    }
    resource_group_policy_assignment = {
      valid_name        = length(regexall(local.az.resource_group_policy_assignment.regex, local.az.resource_group_policy_assignment.name)) > 0 && length(local.az.resource_group_policy_assignment.name) > local.az.resource_group_policy_assignment.min_length
      valid_name_unique = length(regexall(local.az.resource_group_policy_assignment.regex, local.az.resource_group_policy_assignment.name_unique)) > 0
    }
    role_assignment = {
      valid_name        = length(regexall(local.az.role_assignment.regex, local.az.role_assignment.name)) > 0 && length(local.az.role_assignment.name) > local.az.role_assignment.min_length
      valid_name_unique = length(regexall(local.az.role_assignment.regex, local.az.role_assignment.name_unique)) > 0
    }
    role_definition = {
      valid_name        = length(regexall(local.az.role_definition.regex, local.az.role_definition.name)) > 0 && length(local.az.role_definition.name) > local.az.role_definition.min_length
      valid_name_unique = length(regexall(local.az.role_definition.regex, local.az.role_definition.name_unique)) > 0
    }
    route = {
      valid_name        = length(regexall(local.az.route.regex, local.az.route.name)) > 0 && length(local.az.route.name) > local.az.route.min_length
      valid_name_unique = length(regexall(local.az.route.regex, local.az.route.name_unique)) > 0
    }
    route_table = {
      valid_name        = length(regexall(local.az.route_table.regex, local.az.route_table.name)) > 0 && length(local.az.route_table.name) > local.az.route_table.min_length
      valid_name_unique = length(regexall(local.az.route_table.regex, local.az.route_table.name_unique)) > 0
    }
    search_service = {
      valid_name        = length(regexall(local.az.search_service.regex, local.az.search_service.name)) > 0 && length(local.az.search_service.name) > local.az.search_service.min_length
      valid_name_unique = length(regexall(local.az.search_service.regex, local.az.search_service.name_unique)) > 0
    }
    service_fabric_cluster = {
      valid_name        = length(regexall(local.az.service_fabric_cluster.regex, local.az.service_fabric_cluster.name)) > 0 && length(local.az.service_fabric_cluster.name) > local.az.service_fabric_cluster.min_length
      valid_name_unique = length(regexall(local.az.service_fabric_cluster.regex, local.az.service_fabric_cluster.name_unique)) > 0
    }
    servicebus_namespace = {
      valid_name        = length(regexall(local.az.servicebus_namespace.regex, local.az.servicebus_namespace.name)) > 0 && length(local.az.servicebus_namespace.name) > local.az.servicebus_namespace.min_length
      valid_name_unique = length(regexall(local.az.servicebus_namespace.regex, local.az.servicebus_namespace.name_unique)) > 0
    }
    servicebus_namespace_authorization_rule = {
      valid_name        = length(regexall(local.az.servicebus_namespace_authorization_rule.regex, local.az.servicebus_namespace_authorization_rule.name)) > 0 && length(local.az.servicebus_namespace_authorization_rule.name) > local.az.servicebus_namespace_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.servicebus_namespace_authorization_rule.regex, local.az.servicebus_namespace_authorization_rule.name_unique)) > 0
    }
    servicebus_queue = {
      valid_name        = length(regexall(local.az.servicebus_queue.regex, local.az.servicebus_queue.name)) > 0 && length(local.az.servicebus_queue.name) > local.az.servicebus_queue.min_length
      valid_name_unique = length(regexall(local.az.servicebus_queue.regex, local.az.servicebus_queue.name_unique)) > 0
    }
    servicebus_queue_authorization_rule = {
      valid_name        = length(regexall(local.az.servicebus_queue_authorization_rule.regex, local.az.servicebus_queue_authorization_rule.name)) > 0 && length(local.az.servicebus_queue_authorization_rule.name) > local.az.servicebus_queue_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.servicebus_queue_authorization_rule.regex, local.az.servicebus_queue_authorization_rule.name_unique)) > 0
    }
    servicebus_subscription = {
      valid_name        = length(regexall(local.az.servicebus_subscription.regex, local.az.servicebus_subscription.name)) > 0 && length(local.az.servicebus_subscription.name) > local.az.servicebus_subscription.min_length
      valid_name_unique = length(regexall(local.az.servicebus_subscription.regex, local.az.servicebus_subscription.name_unique)) > 0
    }
    servicebus_subscription_rule = {
      valid_name        = length(regexall(local.az.servicebus_subscription_rule.regex, local.az.servicebus_subscription_rule.name)) > 0 && length(local.az.servicebus_subscription_rule.name) > local.az.servicebus_subscription_rule.min_length
      valid_name_unique = length(regexall(local.az.servicebus_subscription_rule.regex, local.az.servicebus_subscription_rule.name_unique)) > 0
    }
    servicebus_topic = {
      valid_name        = length(regexall(local.az.servicebus_topic.regex, local.az.servicebus_topic.name)) > 0 && length(local.az.servicebus_topic.name) > local.az.servicebus_topic.min_length
      valid_name_unique = length(regexall(local.az.servicebus_topic.regex, local.az.servicebus_topic.name_unique)) > 0
    }
    servicebus_topic_authorization_rule = {
      valid_name        = length(regexall(local.az.servicebus_topic_authorization_rule.regex, local.az.servicebus_topic_authorization_rule.name)) > 0 && length(local.az.servicebus_topic_authorization_rule.name) > local.az.servicebus_topic_authorization_rule.min_length
      valid_name_unique = length(regexall(local.az.servicebus_topic_authorization_rule.regex, local.az.servicebus_topic_authorization_rule.name_unique)) > 0
    }
    shared_image = {
      valid_name        = length(regexall(local.az.shared_image.regex, local.az.shared_image.name)) > 0 && length(local.az.shared_image.name) > local.az.shared_image.min_length
      valid_name_unique = length(regexall(local.az.shared_image.regex, local.az.shared_image.name_unique)) > 0
    }
    shared_image_gallery = {
      valid_name        = length(regexall(local.az.shared_image_gallery.regex, local.az.shared_image_gallery.name)) > 0 && length(local.az.shared_image_gallery.name) > local.az.shared_image_gallery.min_length
      valid_name_unique = length(regexall(local.az.shared_image_gallery.regex, local.az.shared_image_gallery.name_unique)) > 0
    }
    signalr_service = {
      valid_name        = length(regexall(local.az.signalr_service.regex, local.az.signalr_service.name)) > 0 && length(local.az.signalr_service.name) > local.az.signalr_service.min_length
      valid_name_unique = length(regexall(local.az.signalr_service.regex, local.az.signalr_service.name_unique)) > 0
    }
    snapshots = {
      valid_name        = length(regexall(local.az.snapshots.regex, local.az.snapshots.name)) > 0 && length(local.az.snapshots.name) > local.az.snapshots.min_length
      valid_name_unique = length(regexall(local.az.snapshots.regex, local.az.snapshots.name_unique)) > 0
    }
    sql_elasticpool = {
      valid_name        = length(regexall(local.az.sql_elasticpool.regex, local.az.sql_elasticpool.name)) > 0 && length(local.az.sql_elasticpool.name) > local.az.sql_elasticpool.min_length
      valid_name_unique = length(regexall(local.az.sql_elasticpool.regex, local.az.sql_elasticpool.name_unique)) > 0
    }
    sql_failover_group = {
      valid_name        = length(regexall(local.az.sql_failover_group.regex, local.az.sql_failover_group.name)) > 0 && length(local.az.sql_failover_group.name) > local.az.sql_failover_group.min_length
      valid_name_unique = length(regexall(local.az.sql_failover_group.regex, local.az.sql_failover_group.name_unique)) > 0
    }
    sql_firewall_rule = {
      valid_name        = length(regexall(local.az.sql_firewall_rule.regex, local.az.sql_firewall_rule.name)) > 0 && length(local.az.sql_firewall_rule.name) > local.az.sql_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.sql_firewall_rule.regex, local.az.sql_firewall_rule.name_unique)) > 0
    }
    sql_server = {
      valid_name        = length(regexall(local.az.sql_server.regex, local.az.sql_server.name)) > 0 && length(local.az.sql_server.name) > local.az.sql_server.min_length
      valid_name_unique = length(regexall(local.az.sql_server.regex, local.az.sql_server.name_unique)) > 0
    }
    storage_account = {
      valid_name        = length(regexall(local.az.storage_account.regex, local.az.storage_account.name)) > 0 && length(local.az.storage_account.name) > local.az.storage_account.min_length
      valid_name_unique = length(regexall(local.az.storage_account.regex, local.az.storage_account.name_unique)) > 0
    }
    storage_blob = {
      valid_name        = length(regexall(local.az.storage_blob.regex, local.az.storage_blob.name)) > 0 && length(local.az.storage_blob.name) > local.az.storage_blob.min_length
      valid_name_unique = length(regexall(local.az.storage_blob.regex, local.az.storage_blob.name_unique)) > 0
    }
    storage_container = {
      valid_name        = length(regexall(local.az.storage_container.regex, local.az.storage_container.name)) > 0 && length(local.az.storage_container.name) > local.az.storage_container.min_length
      valid_name_unique = length(regexall(local.az.storage_container.regex, local.az.storage_container.name_unique)) > 0
    }
    storage_data_lake_gen2_filesystem = {
      valid_name        = length(regexall(local.az.storage_data_lake_gen2_filesystem.regex, local.az.storage_data_lake_gen2_filesystem.name)) > 0 && length(local.az.storage_data_lake_gen2_filesystem.name) > local.az.storage_data_lake_gen2_filesystem.min_length
      valid_name_unique = length(regexall(local.az.storage_data_lake_gen2_filesystem.regex, local.az.storage_data_lake_gen2_filesystem.name_unique)) > 0
    }
    storage_queue = {
      valid_name        = length(regexall(local.az.storage_queue.regex, local.az.storage_queue.name)) > 0 && length(local.az.storage_queue.name) > local.az.storage_queue.min_length
      valid_name_unique = length(regexall(local.az.storage_queue.regex, local.az.storage_queue.name_unique)) > 0
    }
    storage_share = {
      valid_name        = length(regexall(local.az.storage_share.regex, local.az.storage_share.name)) > 0 && length(local.az.storage_share.name) > local.az.storage_share.min_length
      valid_name_unique = length(regexall(local.az.storage_share.regex, local.az.storage_share.name_unique)) > 0
    }
    storage_share_directory = {
      valid_name        = length(regexall(local.az.storage_share_directory.regex, local.az.storage_share_directory.name)) > 0 && length(local.az.storage_share_directory.name) > local.az.storage_share_directory.min_length
      valid_name_unique = length(regexall(local.az.storage_share_directory.regex, local.az.storage_share_directory.name_unique)) > 0
    }
    storage_sync = {
      valid_name        = length(regexall(local.az.storage_sync.regex, local.az.storage_sync.name)) > 0 && length(local.az.storage_sync.name) > local.az.storage_sync.min_length
      valid_name_unique = length(regexall(local.az.storage_sync.regex, local.az.storage_sync.name_unique)) > 0
    }
    storage_sync_group = {
      valid_name        = length(regexall(local.az.storage_sync_group.regex, local.az.storage_sync_group.name)) > 0 && length(local.az.storage_sync_group.name) > local.az.storage_sync_group.min_length
      valid_name_unique = length(regexall(local.az.storage_sync_group.regex, local.az.storage_sync_group.name_unique)) > 0
    }
    storage_table = {
      valid_name        = length(regexall(local.az.storage_table.regex, local.az.storage_table.name)) > 0 && length(local.az.storage_table.name) > local.az.storage_table.min_length
      valid_name_unique = length(regexall(local.az.storage_table.regex, local.az.storage_table.name_unique)) > 0
    }
    stream_analytics_function_javascript_udf = {
      valid_name        = length(regexall(local.az.stream_analytics_function_javascript_udf.regex, local.az.stream_analytics_function_javascript_udf.name)) > 0 && length(local.az.stream_analytics_function_javascript_udf.name) > local.az.stream_analytics_function_javascript_udf.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_function_javascript_udf.regex, local.az.stream_analytics_function_javascript_udf.name_unique)) > 0
    }
    stream_analytics_job = {
      valid_name        = length(regexall(local.az.stream_analytics_job.regex, local.az.stream_analytics_job.name)) > 0 && length(local.az.stream_analytics_job.name) > local.az.stream_analytics_job.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_job.regex, local.az.stream_analytics_job.name_unique)) > 0
    }
    stream_analytics_output_blob = {
      valid_name        = length(regexall(local.az.stream_analytics_output_blob.regex, local.az.stream_analytics_output_blob.name)) > 0 && length(local.az.stream_analytics_output_blob.name) > local.az.stream_analytics_output_blob.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_output_blob.regex, local.az.stream_analytics_output_blob.name_unique)) > 0
    }
    stream_analytics_output_eventhub = {
      valid_name        = length(regexall(local.az.stream_analytics_output_eventhub.regex, local.az.stream_analytics_output_eventhub.name)) > 0 && length(local.az.stream_analytics_output_eventhub.name) > local.az.stream_analytics_output_eventhub.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_output_eventhub.regex, local.az.stream_analytics_output_eventhub.name_unique)) > 0
    }
    stream_analytics_output_mssql = {
      valid_name        = length(regexall(local.az.stream_analytics_output_mssql.regex, local.az.stream_analytics_output_mssql.name)) > 0 && length(local.az.stream_analytics_output_mssql.name) > local.az.stream_analytics_output_mssql.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_output_mssql.regex, local.az.stream_analytics_output_mssql.name_unique)) > 0
    }
    stream_analytics_output_servicebus_queue = {
      valid_name        = length(regexall(local.az.stream_analytics_output_servicebus_queue.regex, local.az.stream_analytics_output_servicebus_queue.name)) > 0 && length(local.az.stream_analytics_output_servicebus_queue.name) > local.az.stream_analytics_output_servicebus_queue.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_output_servicebus_queue.regex, local.az.stream_analytics_output_servicebus_queue.name_unique)) > 0
    }
    stream_analytics_output_servicebus_topic = {
      valid_name        = length(regexall(local.az.stream_analytics_output_servicebus_topic.regex, local.az.stream_analytics_output_servicebus_topic.name)) > 0 && length(local.az.stream_analytics_output_servicebus_topic.name) > local.az.stream_analytics_output_servicebus_topic.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_output_servicebus_topic.regex, local.az.stream_analytics_output_servicebus_topic.name_unique)) > 0
    }
    stream_analytics_reference_input_blob = {
      valid_name        = length(regexall(local.az.stream_analytics_reference_input_blob.regex, local.az.stream_analytics_reference_input_blob.name)) > 0 && length(local.az.stream_analytics_reference_input_blob.name) > local.az.stream_analytics_reference_input_blob.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_reference_input_blob.regex, local.az.stream_analytics_reference_input_blob.name_unique)) > 0
    }
    stream_analytics_stream_input_blob = {
      valid_name        = length(regexall(local.az.stream_analytics_stream_input_blob.regex, local.az.stream_analytics_stream_input_blob.name)) > 0 && length(local.az.stream_analytics_stream_input_blob.name) > local.az.stream_analytics_stream_input_blob.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_stream_input_blob.regex, local.az.stream_analytics_stream_input_blob.name_unique)) > 0
    }
    stream_analytics_stream_input_eventhub = {
      valid_name        = length(regexall(local.az.stream_analytics_stream_input_eventhub.regex, local.az.stream_analytics_stream_input_eventhub.name)) > 0 && length(local.az.stream_analytics_stream_input_eventhub.name) > local.az.stream_analytics_stream_input_eventhub.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_stream_input_eventhub.regex, local.az.stream_analytics_stream_input_eventhub.name_unique)) > 0
    }
    stream_analytics_stream_input_iothub = {
      valid_name        = length(regexall(local.az.stream_analytics_stream_input_iothub.regex, local.az.stream_analytics_stream_input_iothub.name)) > 0 && length(local.az.stream_analytics_stream_input_iothub.name) > local.az.stream_analytics_stream_input_iothub.min_length
      valid_name_unique = length(regexall(local.az.stream_analytics_stream_input_iothub.regex, local.az.stream_analytics_stream_input_iothub.name_unique)) > 0
    }
    subnet = {
      valid_name        = length(regexall(local.az.subnet.regex, local.az.subnet.name)) > 0 && length(local.az.subnet.name) > local.az.subnet.min_length
      valid_name_unique = length(regexall(local.az.subnet.regex, local.az.subnet.name_unique)) > 0
    }
    subscription_policy_assignment = {
      valid_name        = length(regexall(local.az.subscription_policy_assignment.regex, local.az.subscription_policy_assignment.name)) > 0 && length(local.az.subscription_policy_assignment.name) > local.az.subscription_policy_assignment.min_length
      valid_name_unique = length(regexall(local.az.subscription_policy_assignment.regex, local.az.subscription_policy_assignment.name_unique)) > 0
    }
    synapse_firewall_rule = {
      valid_name        = length(regexall(local.az.synapse_firewall_rule.regex, local.az.synapse_firewall_rule.name)) > 0 && length(local.az.synapse_firewall_rule.name) > local.az.synapse_firewall_rule.min_length
      valid_name_unique = length(regexall(local.az.synapse_firewall_rule.regex, local.az.synapse_firewall_rule.name_unique)) > 0
    }
    synapse_integration_runtime_azure = {
      valid_name        = length(regexall(local.az.synapse_integration_runtime_azure.regex, local.az.synapse_integration_runtime_azure.name)) > 0 && length(local.az.synapse_integration_runtime_azure.name) > local.az.synapse_integration_runtime_azure.min_length
      valid_name_unique = length(regexall(local.az.synapse_integration_runtime_azure.regex, local.az.synapse_integration_runtime_azure.name_unique)) > 0
    }
    synapse_integration_runtime_self_hosted = {
      valid_name        = length(regexall(local.az.synapse_integration_runtime_self_hosted.regex, local.az.synapse_integration_runtime_self_hosted.name)) > 0 && length(local.az.synapse_integration_runtime_self_hosted.name) > local.az.synapse_integration_runtime_self_hosted.min_length
      valid_name_unique = length(regexall(local.az.synapse_integration_runtime_self_hosted.regex, local.az.synapse_integration_runtime_self_hosted.name_unique)) > 0
    }
    synapse_linked_service = {
      valid_name        = length(regexall(local.az.synapse_linked_service.regex, local.az.synapse_linked_service.name)) > 0 && length(local.az.synapse_linked_service.name) > local.az.synapse_linked_service.min_length
      valid_name_unique = length(regexall(local.az.synapse_linked_service.regex, local.az.synapse_linked_service.name_unique)) > 0
    }
    synapse_managed_private_endpoint = {
      valid_name        = length(regexall(local.az.synapse_managed_private_endpoint.regex, local.az.synapse_managed_private_endpoint.name)) > 0 && length(local.az.synapse_managed_private_endpoint.name) > local.az.synapse_managed_private_endpoint.min_length
      valid_name_unique = length(regexall(local.az.synapse_managed_private_endpoint.regex, local.az.synapse_managed_private_endpoint.name_unique)) > 0
    }
    synapse_private_link_hub = {
      valid_name        = length(regexall(local.az.synapse_private_link_hub.regex, local.az.synapse_private_link_hub.name)) > 0 && length(local.az.synapse_private_link_hub.name) > local.az.synapse_private_link_hub.min_length
      valid_name_unique = length(regexall(local.az.synapse_private_link_hub.regex, local.az.synapse_private_link_hub.name_unique)) > 0
    }
    synapse_spark_pool = {
      valid_name        = length(regexall(local.az.synapse_spark_pool.regex, local.az.synapse_spark_pool.name)) > 0 && length(local.az.synapse_spark_pool.name) > local.az.synapse_spark_pool.min_length
      valid_name_unique = length(regexall(local.az.synapse_spark_pool.regex, local.az.synapse_spark_pool.name_unique)) > 0
    }
    synapse_sql_pool = {
      valid_name        = length(regexall(local.az.synapse_sql_pool.regex, local.az.synapse_sql_pool.name)) > 0 && length(local.az.synapse_sql_pool.name) > local.az.synapse_sql_pool.min_length
      valid_name_unique = length(regexall(local.az.synapse_sql_pool.regex, local.az.synapse_sql_pool.name_unique)) > 0
    }
    synapse_sql_pool_vulnerability_assessment_baseline = {
      valid_name        = length(regexall(local.az.synapse_sql_pool_vulnerability_assessment_baseline.regex, local.az.synapse_sql_pool_vulnerability_assessment_baseline.name)) > 0 && length(local.az.synapse_sql_pool_vulnerability_assessment_baseline.name) > local.az.synapse_sql_pool_vulnerability_assessment_baseline.min_length
      valid_name_unique = length(regexall(local.az.synapse_sql_pool_vulnerability_assessment_baseline.regex, local.az.synapse_sql_pool_vulnerability_assessment_baseline.name_unique)) > 0
    }
    synapse_sql_pool_workload_classifier = {
      valid_name        = length(regexall(local.az.synapse_sql_pool_workload_classifier.regex, local.az.synapse_sql_pool_workload_classifier.name)) > 0 && length(local.az.synapse_sql_pool_workload_classifier.name) > local.az.synapse_sql_pool_workload_classifier.min_length
      valid_name_unique = length(regexall(local.az.synapse_sql_pool_workload_classifier.regex, local.az.synapse_sql_pool_workload_classifier.name_unique)) > 0
    }
    synapse_sql_pool_workload_group = {
      valid_name        = length(regexall(local.az.synapse_sql_pool_workload_group.regex, local.az.synapse_sql_pool_workload_group.name)) > 0 && length(local.az.synapse_sql_pool_workload_group.name) > local.az.synapse_sql_pool_workload_group.min_length
      valid_name_unique = length(regexall(local.az.synapse_sql_pool_workload_group.regex, local.az.synapse_sql_pool_workload_group.name_unique)) > 0
    }
    synapse_workspace = {
      valid_name        = length(regexall(local.az.synapse_workspace.regex, local.az.synapse_workspace.name)) > 0 && length(local.az.synapse_workspace.name) > local.az.synapse_workspace.min_length
      valid_name_unique = length(regexall(local.az.synapse_workspace.regex, local.az.synapse_workspace.name_unique)) > 0
    }
    template_deployment = {
      valid_name        = length(regexall(local.az.template_deployment.regex, local.az.template_deployment.name)) > 0 && length(local.az.template_deployment.name) > local.az.template_deployment.min_length
      valid_name_unique = length(regexall(local.az.template_deployment.regex, local.az.template_deployment.name_unique)) > 0
    }
    traffic_manager_profile = {
      valid_name        = length(regexall(local.az.traffic_manager_profile.regex, local.az.traffic_manager_profile.name)) > 0 && length(local.az.traffic_manager_profile.name) > local.az.traffic_manager_profile.min_length
      valid_name_unique = length(regexall(local.az.traffic_manager_profile.regex, local.az.traffic_manager_profile.name_unique)) > 0
    }
    user_assigned_identity = {
      valid_name        = length(regexall(local.az.user_assigned_identity.regex, local.az.user_assigned_identity.name)) > 0 && length(local.az.user_assigned_identity.name) > local.az.user_assigned_identity.min_length
      valid_name_unique = length(regexall(local.az.user_assigned_identity.regex, local.az.user_assigned_identity.name_unique)) > 0
    }
    virtual_desktop_application_group = {
      valid_name        = length(regexall(local.az.virtual_desktop_application_group.regex, local.az.virtual_desktop_application_group.name)) > 0 && length(local.az.virtual_desktop_application_group.name) > local.az.virtual_desktop_application_group.min_length
      valid_name_unique = length(regexall(local.az.virtual_desktop_application_group.regex, local.az.virtual_desktop_application_group.name_unique)) > 0
    }
    virtual_desktop_host_pool = {
      valid_name        = length(regexall(local.az.virtual_desktop_host_pool.regex, local.az.virtual_desktop_host_pool.name)) > 0 && length(local.az.virtual_desktop_host_pool.name) > local.az.virtual_desktop_host_pool.min_length
      valid_name_unique = length(regexall(local.az.virtual_desktop_host_pool.regex, local.az.virtual_desktop_host_pool.name_unique)) > 0
    }
    virtual_desktop_workspace = {
      valid_name        = length(regexall(local.az.virtual_desktop_workspace.regex, local.az.virtual_desktop_workspace.name)) > 0 && length(local.az.virtual_desktop_workspace.name) > local.az.virtual_desktop_workspace.min_length
      valid_name_unique = length(regexall(local.az.virtual_desktop_workspace.regex, local.az.virtual_desktop_workspace.name_unique)) > 0
    }
    virtual_hub = {
      valid_name        = length(regexall(local.az.virtual_hub.regex, local.az.virtual_hub.name)) > 0 && length(local.az.virtual_hub.name) > local.az.virtual_hub.min_length
      valid_name_unique = length(regexall(local.az.virtual_hub.regex, local.az.virtual_hub.name_unique)) > 0
    }
    virtual_hub_connection = {
      valid_name        = length(regexall(local.az.virtual_hub_connection.regex, local.az.virtual_hub_connection.name)) > 0 && length(local.az.virtual_hub_connection.name) > local.az.virtual_hub_connection.min_length
      valid_name_unique = length(regexall(local.az.virtual_hub_connection.regex, local.az.virtual_hub_connection.name_unique)) > 0
    }
    virtual_machine = {
      valid_name        = length(regexall(local.az.virtual_machine.regex, local.az.virtual_machine.name)) > 0 && length(local.az.virtual_machine.name) > local.az.virtual_machine.min_length
      valid_name_unique = length(regexall(local.az.virtual_machine.regex, local.az.virtual_machine.name_unique)) > 0
    }
    virtual_machine_extension = {
      valid_name        = length(regexall(local.az.virtual_machine_extension.regex, local.az.virtual_machine_extension.name)) > 0 && length(local.az.virtual_machine_extension.name) > local.az.virtual_machine_extension.min_length
      valid_name_unique = length(regexall(local.az.virtual_machine_extension.regex, local.az.virtual_machine_extension.name_unique)) > 0
    }
    virtual_machine_scale_set = {
      valid_name        = length(regexall(local.az.virtual_machine_scale_set.regex, local.az.virtual_machine_scale_set.name)) > 0 && length(local.az.virtual_machine_scale_set.name) > local.az.virtual_machine_scale_set.min_length
      valid_name_unique = length(regexall(local.az.virtual_machine_scale_set.regex, local.az.virtual_machine_scale_set.name_unique)) > 0
    }
    virtual_machine_scale_set_extension = {
      valid_name        = length(regexall(local.az.virtual_machine_scale_set_extension.regex, local.az.virtual_machine_scale_set_extension.name)) > 0 && length(local.az.virtual_machine_scale_set_extension.name) > local.az.virtual_machine_scale_set_extension.min_length
      valid_name_unique = length(regexall(local.az.virtual_machine_scale_set_extension.regex, local.az.virtual_machine_scale_set_extension.name_unique)) > 0
    }
    virtual_network = {
      valid_name        = length(regexall(local.az.virtual_network.regex, local.az.virtual_network.name)) > 0 && length(local.az.virtual_network.name) > local.az.virtual_network.min_length
      valid_name_unique = length(regexall(local.az.virtual_network.regex, local.az.virtual_network.name_unique)) > 0
    }
    virtual_network_gateway = {
      valid_name        = length(regexall(local.az.virtual_network_gateway.regex, local.az.virtual_network_gateway.name)) > 0 && length(local.az.virtual_network_gateway.name) > local.az.virtual_network_gateway.min_length
      valid_name_unique = length(regexall(local.az.virtual_network_gateway.regex, local.az.virtual_network_gateway.name_unique)) > 0
    }
    virtual_network_gateway_connection = {
      valid_name        = length(regexall(local.az.virtual_network_gateway_connection.regex, local.az.virtual_network_gateway_connection.name)) > 0 && length(local.az.virtual_network_gateway_connection.name) > local.az.virtual_network_gateway_connection.min_length
      valid_name_unique = length(regexall(local.az.virtual_network_gateway_connection.regex, local.az.virtual_network_gateway_connection.name_unique)) > 0
    }
    virtual_network_peering = {
      valid_name        = length(regexall(local.az.virtual_network_peering.regex, local.az.virtual_network_peering.name)) > 0 && length(local.az.virtual_network_peering.name) > local.az.virtual_network_peering.min_length
      valid_name_unique = length(regexall(local.az.virtual_network_peering.regex, local.az.virtual_network_peering.name_unique)) > 0
    }
    virtual_wan = {
      valid_name        = length(regexall(local.az.virtual_wan.regex, local.az.virtual_wan.name)) > 0 && length(local.az.virtual_wan.name) > local.az.virtual_wan.min_length
      valid_name_unique = length(regexall(local.az.virtual_wan.regex, local.az.virtual_wan.name_unique)) > 0
    }
    vpn_gateway_connection = {
      valid_name        = length(regexall(local.az.vpn_gateway_connection.regex, local.az.vpn_gateway_connection.name)) > 0 && length(local.az.vpn_gateway_connection.name) > local.az.vpn_gateway_connection.min_length
      valid_name_unique = length(regexall(local.az.vpn_gateway_connection.regex, local.az.vpn_gateway_connection.name_unique)) > 0
    }
    vpn_site = {
      valid_name        = length(regexall(local.az.vpn_site.regex, local.az.vpn_site.name)) > 0 && length(local.az.vpn_site.name) > local.az.vpn_site.min_length
      valid_name_unique = length(regexall(local.az.vpn_site.regex, local.az.vpn_site.name_unique)) > 0
    }
    web_pubsub = {
      valid_name        = length(regexall(local.az.web_pubsub.regex, local.az.web_pubsub.name)) > 0 && length(local.az.web_pubsub.name) > local.az.web_pubsub.min_length
      valid_name_unique = length(regexall(local.az.web_pubsub.regex, local.az.web_pubsub.name_unique)) > 0
    }
    web_pubsub_hub = {
      valid_name        = length(regexall(local.az.web_pubsub_hub.regex, local.az.web_pubsub_hub.name)) > 0 && length(local.az.web_pubsub_hub.name) > local.az.web_pubsub_hub.min_length
      valid_name_unique = length(regexall(local.az.web_pubsub_hub.regex, local.az.web_pubsub_hub.name_unique)) > 0
    }
    windows_virtual_machine = {
      valid_name        = length(regexall(local.az.windows_virtual_machine.regex, local.az.windows_virtual_machine.name)) > 0 && length(local.az.windows_virtual_machine.name) > local.az.windows_virtual_machine.min_length
      valid_name_unique = length(regexall(local.az.windows_virtual_machine.regex, local.az.windows_virtual_machine.name_unique)) > 0
    }
    windows_virtual_machine_scale_set = {
      valid_name        = length(regexall(local.az.windows_virtual_machine_scale_set.regex, local.az.windows_virtual_machine_scale_set.name)) > 0 && length(local.az.windows_virtual_machine_scale_set.name) > local.az.windows_virtual_machine_scale_set.min_length
      valid_name_unique = length(regexall(local.az.windows_virtual_machine_scale_set.regex, local.az.windows_virtual_machine_scale_set.name_unique)) > 0
    }
  }
}
