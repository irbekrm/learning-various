module "tls" {
    source = "../modules/tls"
}

resource "aws_vpc" "bosh_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "Bosh-VPC"
    }
}

resource "aws_subnet" "bosh_public_subnet" {
  vpc_id = aws_vpc.bosh_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.default_az
  tags = {
      Name = "Bosh-VPC-public"
  }
}

resource "aws_eip" "static_ip" {
}

resource "aws_key_pair" "bosh_key_pair" {
  key_name = "bosh"
  public_key = module.tls.ssh_public_key
}

resource "aws_security_group" "bosh" {
  name = "bosh_security_group"
  description = "Security group for BOSH VMs"
  vpc_id = aws_vpc.bosh_vpc.id
}

resource "aws_security_group_rule" "self_access" {
  type = "ingress"
  protocol = "tcp"
  from_port = 0
  to_port = 65535
  security_group_id = aws_security_group.bosh.id
  self = true
}

resource "aws_security_group_rule" "outside_ssh_access" {
  count = length(var.source_ips)
  type = "ingress"
  protocol = "tcp"
  cidr_blocks = "${element(var.source_ips, count.index)}/32"
  from_port = 22
  to_port = 22
  security_group_id = aws_security_group.bosh.id
}

resource "aws_security_group_rule" "bosh_agent_1" {
  count = length(var.source_ips)
  type = "ingress"
  protocol = "tcp"
  cidr_blocks = "[${element(var.source_ips, count.index)}/32]"
  from_port = 6868
  to_port = 6868
  security_group_id = aws_security_group.bosh.id
}

resource "aws_security_group_rule" "bosh_agent_2" {
  count = length(var.source_ips)
  type = "ingress"
  protocol = "tcp"
  cidr_blocks = "[${element(var.source_ips, count.index)}/32]"
  from_port = 25555
  to_port = 25555
  security_group_id = aws_security_group.bosh.id
}






