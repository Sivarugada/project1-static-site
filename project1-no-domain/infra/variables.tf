variable "aws_region" {
  description = "AWS region for S3 bucket"
  type        = string
  default     = "ap-south-1" # Mumbai — closest to Hyderabad
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name — use something like yourname-portfolio-2026"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters."
  }
}
