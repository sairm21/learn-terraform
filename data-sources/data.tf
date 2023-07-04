data "aws_ec2_instance_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-west-2a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "price" {
  value = data.aws_ec2_instance_spot_price.example.spot_price
}

output "price" {
  value = data.aws_ec2_instance_spot_price.example.id
}