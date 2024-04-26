output "lightsail_load_balancer_dns" {
    description = "The DNS name of the lightsail load balancer"
    value = aws_lightsail_lb.lb.dns_name
}