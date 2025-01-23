resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow Traffic to exposed port"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_traffic" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.cidr_block
  from_port         = var.port
  ip_protocol       = "tcp"
  to_port           = var.port
}