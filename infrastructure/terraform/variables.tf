variable "region" {
  description = "La región donde se desplegará la instancia"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Nombre del servidor EC2"
  type        = string
  default     = "WebServer"
}

variable "ami_id" {
  description = "AMI de Ubuntu 22.04 LTS en us-east-1"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}
