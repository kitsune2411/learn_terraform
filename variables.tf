variable "access_key" {
  description = "access key"
  sensitive   = true
}

variable "secret_key" {
  description = "secret key"
  sensitive   = true
}

variable "region" {
  description = "region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "app_vpc"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "app_subnet"

}

variable "igw_name" {
  description = "Name of the internet gateway"
  type        = string
  default     = "app_igw"
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
  default     = "app_route_table"
}

variable "ami" {
  description = "AMI to use for the instance"
  default     = "ami-0cd59ecaf368e5ccf" // aws us-east-1 Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2024-02-28
}

variable "instance_type" {
  description = "Type of instance"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "app_server"

}

variable "keypair_name" {
  description = "Name of the key pair"
  type        = string
  default     = "deployer-key"

}

variable "cpu_credits" {
  description = "CPU credits for the instance"
  type        = string
  validation {
    condition     = anytrue([var.cpu_credits == "standard", var.cpu_credits == "unlimited"])
    error_message = "CPU credits must be either standard or unlimited"
  }
  default = "standard"

}

variable "ebs_block_device_name" {
  description = "Name of the EBS block device"
  type        = string
  default     = "/dev/sda1"
}

variable "ebs_block_device_size" {
  description = "Size of the EBS block device"
  type        = number
  default     = 20
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-app-s3-bucket"

}

