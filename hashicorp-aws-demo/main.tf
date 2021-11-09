# The Terraform block contains providers and settings.
# Providers can be found in the Terraform registry.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

# The provider block configures the specified provider.
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

# The resource block configures components of infrastructure.
# The first string is the type. The second string is the name. Together, they form a unique ID for this resource.
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
