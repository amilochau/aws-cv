terraform {
  backend "s3" {
    bucket = "mil-management-shd-bucket-iac"
    region = "eu-west-3"
    key    = "terraform.tfstate"

    workspace_key_prefix = "cv" # To adapt for new projects
    dynamodb_table       = "mil-management-shd-table-iac-locks"
    
    assume_role = {
      role_arn = "arn:aws:iam::654654257484:role/administrator-access"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.6.3, < 2.0.0"
}

provider "aws" {
  alias = "workloads"
  region = var.aws_provider_settings.region

  assume_role {
    role_arn = var.assume_roles.workloads
  }

  default_tags {
    tags = {
      organization = var.conventions.organization_name
      application = var.conventions.application_name
      host        = var.conventions.host_name
    }
  }
}

provider "aws" {
  alias = "workloads-us-east-1"
  region = "us-east-1"

  assume_role {
    role_arn = var.assume_roles.workloads
  }

  default_tags {
    tags = {
      organization = var.conventions.organization_name
      application = var.conventions.application_name
      host        = var.conventions.host_name
    }
  }
}

provider "aws" {
  alias  = "infrastructure"
  region = "us-east-1"

  assume_role {
    role_arn = var.assume_roles.infrastructure
  }

  default_tags {
    tags = {
      organization = var.conventions.organization_name
      application = var.conventions.application_name
      host        = var.conventions.host_name
    }
  }
}

module "checks" {
  source      = "git::https://github.com/amilochau/tf-modules.git//shared/checks?ref=v1"
  conventions = var.conventions
}

module "client_app" {
  source      = "git::https://github.com/amilochau/tf-modules.git//aws/static-web-app?ref=v1"
  conventions = var.conventions

  client_settings = {
    package_source_file   = var.client_settings.package_source_file
    s3_bucket_name_suffix = var.client_settings.s3_bucket_name_suffix
    domains               = var.client_settings.domains
  }

  providers = {
    aws.infrastructure = aws.infrastructure
    aws.workloads = aws.workloads
    aws.workloads-us-east = aws.workloads-us-east-1
  }
}
