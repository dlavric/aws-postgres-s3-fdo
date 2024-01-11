terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# import {
#   to = aws_db_instance.daniela-db
#   id = "daniela-db1"
# }


resource "aws_s3_bucket" "s3bucket" {
  bucket = var.storage_bucket

  tags = {
    Name        = "Daniela FDO Storage"
    Environment = "Dev"
  }
}


resource "aws_db_instance" "daniela-db" {
  allocated_storage    = 400
  identifier           = "daniela-db-docker"
  db_name              = "danieladb"
  engine               = "postgres"
  engine_version       = "14.9"
  instance_class       = "db.m5.xlarge"
  username             = "postgres"
  password             = "dbpassword"
  parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true
}