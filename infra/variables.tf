variable "website_bucket_name"{
  description = "AWS bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "ec2_security_group_ids" {
  description = "Security group IDs for EC2 instance"
  type        = list(string)
}

variable "ec2_key_name" {
  description = "Optional key pair name for EC2"
  type        = string
  default     = null
}

variable "ec2_tags" {
  description = "Tags for EC2 instance"
  type        = map(string)
  default     = {}
}

# variable "aws_profile" {
#   description = "AWS profile"
#   type        = string
# }
