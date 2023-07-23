data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  count = length(var.instances)
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "hello"
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
      instance_type="t3.nano"
    }

  }
}

