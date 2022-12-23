# configurations for launching the Ec2 instances
resource "aws_launch_configuration" "launch_configuration" {
  name          = "${local.prefix_all}-launch_config-${var.env}"
  image_id      = data.aws_ami.ami_latest.id
  instance_type = var.instance_type
  security_groups    = [aws_security_group.sg_webserver.id]
  key_name      = aws_key_pair.ssh_key.key_name
  iam_instance_profile = "LabInstanceProfile" //using the default lab IAM

  user_data = templatefile("../../../global_modules/webserver/install_httpd.sh.tpl",
      {
      env    = var.env
    }
    )
  lifecycle{
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "auto_scaling_group" {
  name                  = "${local.prefix_all}-AutoScalingGroup${var.env}"
  desired_capacity      = var.desired_size
  max_size              = var.maximum_size
  min_size              = var.minimum_size
  launch_configuration  = aws_launch_configuration.launch_configuration.name
  vpc_zone_identifier   = data.terraform_remote_state.network.outputs.private_subnet_ids[*]
  depends_on            = [aws_lb.application_load_balancer]
  target_group_arns     = [aws_lb_target_group.targetgroup.arn]
  health_check_type     = "ELB"
  
  tags = [
    {
      key                 = "Name"
      value               = "AutoScaledEC2"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "Prod"
      propagate_at_launch = true
    },
  ]
  
}


#ScalingPolicy CPU% > 10% scale out
resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${local.prefix_all}-scale_out-${var.env}"
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 60
}

#ScalingPolicy CPU% <= 5% scale in
resource "aws_autoscaling_policy" "scale_in" {
  name                   = "${local.prefix_all}-scale_in-${var.env}"
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 60
}