# Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = "ALB-${var.env}"
  internal           = false //internert facing
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_webserver.id]
  subnets            = data.terraform_remote_state.network.outputs.public_subnet_ids[*]
  enable_deletion_protection = false

  tags = merge(local.default_tags,
    {
      "Name" = "${local.prefix_all}-ALB-${var.env}"
    }
  )
}

# Target Group
resource "aws_lb_target_group" "targetgroup" {
  name     = "targetgroup-${var.env}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.network.outputs.vpc_id
  
  lifecycle { create_before_destroy = true }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 25
    interval            = 30
  }
  
  tags = merge(local.default_tags,
    {
      "Name" = "${local.prefix_all}-targetgroup-${var.env}"
    }
  )
}


# listener for ALB
resource "aws_lb_listener" "ALB_listner"{
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup.arn 
  }
}