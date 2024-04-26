variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "dev_instance_name" {
  description = "Name of the instances for the development environment"
  type        = string
  default     = "Development-instance"
}

variable "dev_availability_zone" {
  description = "Availability zone for the development environment"
  type        = string
  default     = "eu-central-1a"
}

variable "dev_lb_name" {
  description = "Name of the load balancer for the development environment"
  type        = string
  default     = "Development-Loadbalancer"
}

variable "test_instance_name" {
  description = "Name of the instances for the test environment"
  type        = string
  default     = "Testing-instance"
}

variable "test_availability_zone" {
  description = "Availability zone for the test environment"
  type        = string
  default     = "eu-central-1b"
}

variable "test_lb_name" {
  description = "Name of the load balancer for the test environment"
  type        = string
  default     = "Testing-Loadbalancer"
}

variable "prod_instance_name" {
  description = "Name of the instances for the production environment"
  type        = string
  default     = "Production-instance"
}

variable "prod_availability_zone" {
  description = "Availability zone for the production environment"
  type        = string
  default     = "eu-central-1c"
}

variable "prod_lb_name" {
  description = "Name of the load balancer for the production environment"
  type        = string
  default     = "Production-Loadbalancer"
}
