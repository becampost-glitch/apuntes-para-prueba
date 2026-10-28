output "url_load_balancer" {
  value       = module.alb.alb_dns_name
  description = "Dirección pública para probar el Load Balancer"
}