terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6" # which means any version equal & above
    }
  }

  backend "s3" {
    bucket         = "leesjoseph-terraform-state-bucket"
    key            = "terraform/state"
    region         = "ap-northeast-2"
    dynamodb_table = "leesjoseph-terraform-lock-table"
  }

  required_version = ">= 0.13"
}

provider "aws" {
  region = var.region
}