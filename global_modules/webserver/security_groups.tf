# Security Group for Bastion 
resource "aws_security_group" "sg_bastion_server" {
  name        = "Allow_ssh-${var.env}"
  description = "Allow ssh from anywhere"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.prefix_all}-sg_bastion_server"
    }
  )
}

# Security Group For Web_Servers  
resource "aws_security_group" "sg_webserver" {
  name        = "Allow_ssh_http-${var.env}"
  description = "Allow HTTP and SSH anywhere"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  # addition of HTTPS
    ingress {
    description      = "HTTPS from everywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups  = [aws_security_group.sg_bastion_server.id]
    ipv6_cidr_blocks = ["::/0"]
  }
  
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.prefix_all}-sg_webserver-${var.env}"
    }
  )
}