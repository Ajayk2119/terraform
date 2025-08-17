variable "ec2_type" {
  default     = "t2.micro"
  description = "type of ec2 instance"
  type        = string

}
variable "ec2_volume_size" {
  default     = 8
  type        = number
  description = "size of root volume"
}
variable "ec2_ami_id" {
  default     = "ami-0006460c3ae9e3f07"
  type        = string
  description = "image name for ec2 instance"

}
variable "instance_count" {
  default     = 1
  type        = number
  description = "no. of ec2 instance provisioned"

}