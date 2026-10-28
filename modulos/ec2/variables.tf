variable "instance_count" { type = number }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "subnet_ids" { type = list(string) }