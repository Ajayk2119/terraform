output "ec2_public_ip" {
  value = aws_instance.my-ec2[*].public_ip

}
output "ec2_public_dns" {
  value = aws_instance.my-ec2[*].public_dns

}
# 13.126.163.156s