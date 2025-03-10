variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment variable used as a prefix"
  default     = "dev"
}

variable "business_division" {
  description = "Business division in the large organization this infrastructure belongs"
  type        = string
  default     = "SAP"
}