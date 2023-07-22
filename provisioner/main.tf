data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami                   = data.aws_ami.example.id
  instance_type         = "t3.micro"
  vpc_security_group_ids = ["sg-07010737da7cff878"]

  tags = {
    Name = "hello world"
  }

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/sairm21/roboshop-ansible main.yml -e role_name=Frontend",
    ]
  }
}