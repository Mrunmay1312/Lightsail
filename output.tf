output "dev_lb_dns" {
  description = "DNS name of the load balancer for the development environment"
  value       = module.dev_env.lb_dns_name
}

output "test_lb_dns" {
  description = "DNS name of the load balancer for the test environment"
  value       = module.test_env.lb_dns_name
}

output "prod_lb_dns" {
  description = "DNS name of the load balancer for the production environment"
  value       = module.prod_env.lb_dns_name
}
