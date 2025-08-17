# random string get value


resource "random_string" "example" {
  length  = 12
  upper   = false
  special = false
}
# key-pay creation for ec2 instance
resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key-terra"
  public_key = file("ec2-key.pub")

}
resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  vpc_id      = aws_default_vpc.default.id # this is called interpolation
  description = "this is for learning purpose"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open port"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    description = "open to all port and subnets"
  }
  tags = {
    learn = "terraromf"
  }
}
resource "aws_instance" "my-ec2" {
  for_each = tomap({
    my_ec2_micro  = "t2.micro",
    my_ec2_medium = "t2.medium"
  })
  key_name        = aws_key_pair.ec2-key.key_name
  security_groups = [aws_security_group.ec2-sg.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = "gp3"
  }
  tags = {
    Name = each.key
  }
  associate_public_ip_address = true
  #count                       = var.instance_count

}
