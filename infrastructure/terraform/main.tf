# main.tf - AWS EC2 (Free Tier)

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 LTS en us-east-1
  instance_type = "t2.micro"

  tags = {
    Name      = "WebServer"
    Project   = "cloud-cost-comparison"
    FinOps    = "true"
    Environment = "dev"
  }
}
