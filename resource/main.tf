data "aws_ami" "example4" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example4.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

