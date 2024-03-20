variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "automatic_channel_upgrade" {
  type        = string
  default     = null
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are `patch`, `rapid`, `node-image` and `stable`. By default automatic-upgrades are turned off.

  validation {
    condition = var.automatic_channel_upgrade == null ? true : contains([
      "patch", "stable", "rapid", "node-image"
    ], var.automatic_channel_upgrade)
    error_message = "`automatic_channel_upgrade`'s possible values are `patch`, `stable`, `rapid` or `node-image`."
  }
}

variable "azure_policy_enabled" {
  type        = bool
  default     = false
  description = "Enable Azure Policy Addon."
}

variable "disk_encryption_set_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created."
}

variable "prefix" {
  type        = string
  default     = ""
  description = "(Optional) The prefix for the resources created in the specified Azure Resource Group. Omitting this variable requires both `var.cluster_log_analytics_workspace_name` and `var.cluster_name` have been set."
  nullable    = false
}

variable "image_cleaner_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether Image Cleaner is enabled."
}

variable "image_cleaner_interval_hours" {
  type        = number
  default     = 48
  description = "(Optional) Specifies the interval in hours when images should be cleaned up. Defaults to `48`."
}

variable "kubernetes_version" {
  type        = string
  default     = null
  description = "Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region"
}

variable "local_account_disabled" {
  type        = bool
  default     = null
  description = "(Optional) - If `true` local accounts will be disabled. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information."
}

variable "node_os_channel_upgrade" {
  type        = string
  default     = null
  description = " (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are `Unmanaged`, `SecurityPatch`, `NodeImage` and `None`."
}

variable "node_resource_group" {
  type        = string
  default     = null
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. Changing this forces a new resource to be created."
}

variable "oidc_issuer_enabled" {
  type        = bool
  default     = false
  description = "Enable or Disable the OIDC issuer URL. Defaults to false."
}

variable "open_service_mesh_enabled" {
  type        = bool
  default     = null
  description = "Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about)."
}

variable "private_cluster_enabled" {
  type        = bool
  default     = false
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
}

variable "private_cluster_public_fqdn_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`."
}

variable "private_dns_zone_id" {
  type        = string
  default     = null
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning. Changing this forces a new resource to be created."
}

variable "role_based_access_control_enabled" {
  type        = bool
  default     = false
  description = "Enable Role Based Access Control."
  nullable    = false
}

variable "run_command_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether to enable run command for the cluster or not."
}

variable "sku_tier" {
  type        = string
  default     = "Free"
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free`, `Standard` and `Premium`"

  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.sku_tier)
    error_message = "The SKU Tier must be either `Free`, `Standard` or `Premium`. `Paid` is no longer supported since AzureRM provider v3.51.0."
  }
}

variable "support_plan" {
  type        = string
  default     = "KubernetesOfficial"
  description = "The support plan which should be used for this Kubernetes Cluster. Possible values are `KubernetesOfficial` and `AKSLongTermSupport`."

  validation {
    condition     = contains(["KubernetesOfficial", "AKSLongTermSupport"], var.support_plan)
    error_message = "The support plan must be either `KubernetesOfficial` or `AKSLongTermSupport`."
  }
}
