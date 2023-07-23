data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  for_each = var.instances
  ami           = data.aws_ami.example.id
  instance_type = lookup(each.value, "instance_type", "t3.small")

  tags = {
    Name = each.key
  }
}

variable "instances" {
  default = {

    frontend={
      name="frontend"
      instance_type="t3.micro"
    }
    catalogue={
      name="catalogue"
      instance_type="t3.small"
    }
    cart={
      name="cart"
      }

  }
}

