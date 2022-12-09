terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
  backend "s3" {
      bucket = "analytics-1032"
      key    = "1032/terraform-in-pipeline.state"
      region = "eu-west-1"
    }
} 