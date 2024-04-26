output "dev_lb_dns" {
  description = "DNS name of the load balancer for the development environment"
  value       = module.dev_env.lightsail_load_balancer_dns
}

output "test_lb_dns" {
  description = "DNS name of the load balancer for the test environment"
  value       = module.test_env.lightsail_load_balancer_dns
}

output "prod_lb_dns" {
  description = "DNS name of the load balancer for the production environment"
  value       = module.prod_env.lightsail_load_balancer_dns
}
