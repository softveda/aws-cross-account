terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }
  }

  required_version = ">= 0.15"
}
provider "aws" {
  region  = var.region

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/${var.role}"
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.queue_name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
  }
}

output "SQS-URL" {
	value = aws_sqs_queue.terraform_queue.id
}
