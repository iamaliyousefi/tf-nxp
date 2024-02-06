variable "RESOURCE_GROUP" {
  type        = string
  description = "This is the rg name"
  default = "nxp-ay-rg"
}

variable "VNET" {
  type        = string
  description = "This is the vnet name"
  default = "nxp-ay-vnet"
}

variable "VNET_SUBNET" {
  type        = string
  description = "This is the subnet name"
  default = "nxp-ay-subnet"
}

#variable "VNET_ADDRESS_PREFIX" {
#  type        = list(string)
#  description = "This is the vnet address prefix"
#  default = ["10.0.0.0/8"]
#}

#variable "VNET_SUBNET_PREFIX" {
#  type        = list(string)
#  description = "This is the subnet address prefix"
#  default = ["10.240.0.0/24"]
#}

