resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)]

  tags = { Name = "webserver-${count.index + 1}" }

  # Uso de local-exec
  provisioner "local-exec" {
    command = "echo Servidor ${self.id} creado en IP pública ${self.public_ip} >> IPs_servidores.txt"
  }
}