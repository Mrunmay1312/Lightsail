variable "instance_count" {
    description = "Number of instances to create"
    type = number
    default = 2
}

variable "instance_name" {
  description = "Name of lightsail instances"
  type = string
}

variable "availability_zones" {
  description = "Availability zone for the environment"
  type = string
}

variable "bundle_id" {
  description = "Bundle id for lightsail instances"
  type = string
  default = "micro_2_0"
}

variable "blueprint_id" {
  description = "Blueprint id for lightsail instances"
  type = string
  default = "ubuntu_20_04"
}

variable "lb_name" {
  description = "Name for lightsail loadbalancer"
  type = string
}
