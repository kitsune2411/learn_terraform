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
