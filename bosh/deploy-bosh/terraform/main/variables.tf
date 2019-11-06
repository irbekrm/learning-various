variable "region" {
    type = string
    description = "AWS rewgion to create infrastructure in"
}

variable "default_az" {
    type = string
    description = "Default AWS zone in which to create infrastructure"
}

variable "source_ips" {
    type = list
    description = "IPs to be whitelisted to access BOSH VMs"
}