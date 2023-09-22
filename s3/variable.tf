variable "region" {
  default = "ap-south-1"
}

# aws provider block

provider "aws" {
  region = var.region
}