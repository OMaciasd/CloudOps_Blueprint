output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.web.public_ip
}

output "availability_zone" {
  description = "Zona de disponibilidad de la instancia"
  value       = aws_instance.web.availability_zone
}
