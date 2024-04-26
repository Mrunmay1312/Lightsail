# Initializing terraform and specifying required provider and its version
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.14.0"
    }
  }
}

# Configuring aws provider
provider "aws" {
  region = var.region
}

# Defining Lightsail module for dev environment
module "dev_env" {
  source             = "./modules/lightsail"
  instance_name      = var.dev_instance_name
  availability_zones = var.dev_availability_zone
  lb_name            = var.dev_lb_name
}

# Defining Lightsail module for test environment
module "test_env" {
  source             = "./modules/lightsail"
  instance_name      = var.test_instance_name
  availability_zones = var.test_availability_zone
  lb_name            = var.test_lb_name
}

# Defining Lightsail module for prod environment
module "prod_env" {
  source             = "./modules/lightsail"
  instance_name       = var.prod_instance_name
  availability_zones = var.prod_availability_zone
  lb_name            = var.prod_lb_name
}