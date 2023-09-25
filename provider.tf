terraform {
  required_version = "1.3.7"
}

variable "region" {
  default = "us-east-1"
}

# aws provider block

provider "aws" {
  region = var.region
}