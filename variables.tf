variable "queue_name" {
  type        = string
  description = "The name of the SQS queue."
}

variable "account_id" {
  type        = string
  description = "The ARN of target AWS account."
}

variable "role" {
  type        = string
  description = "The role name in target AWS account."
}

variable "region" {
  type        = string
  type        = "us-east-1"
  description = "The region to deploy in target AWS account."
}
