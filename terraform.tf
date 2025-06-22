provider.tf

provider "aws" {
  region = "us-east-1"   # Change as per your need
}

main.tf

resource "aws_instance" "example" {
  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI in us-east-1
  instance_type          = "t2.micro"              # Free tier eligible
  key_name               = "my-key"               # Replace with your key pair name

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}


variables.tf

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}


output.tf

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}


terraform init     # Initialize Terraform
terraform plan     # Show what will be created
terraform apply    # Apply the configuration