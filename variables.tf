
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "storage_bucket" {
  description = "The name of the S3 Bucket to save all the TFE data to"
}