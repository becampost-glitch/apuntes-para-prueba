variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }
variable "public_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }