#data "aws_ec2_instance_spot_price" "example" {
#  instance_type     = "t3.medium"
#  availability_zone = "us-west-2a"
#
#  filter {
#    name   = "product-description"
#    values = ["Linux/UNIX"]
#  }
#}
#
#output "price" {
#  value = data.aws_ec2_instance_spot_price.example.spot_price
#}

data "aws_security_group" "selected" {
  name = "allow-all"
}

output "sg" {
  value = data.aws_security_group.selected.id
}

output "sg1" {
  value = data.aws_security_group.selected.vpc_id
}