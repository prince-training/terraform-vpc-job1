variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "vpc region"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "sub1-private_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "private sub cidr"
}


variable "sub1-public_cidr"{
  type        = string
  default     = "10.0.2.0/24"
  description = "public cidr"
}


variable "tag_pub-sub1" {
  type        = string
  default     = "public-sub1"
  description = "tag name for public subnet"
}
