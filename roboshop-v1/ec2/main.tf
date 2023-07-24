data "aws_ami" "roboshop" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.roboshop.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
  }
}
resource "null_resource" "ansible_tasks" {
  depends_on = [aws_instance.web, aws_route53_record.www]
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/sairm21/roboshop-ansible Main.yml -e role_name=${var.name}"
    ]
  }
}


resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow all traffic"


  ingress {
    description = "all-traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name
  }
}

variable "name" {}

output "public_ip" {
  value = aws_instance.web.public_ip
}

resource "aws_route53_record" "www" {
  zone_id = "Z07064001LQWEDMH2WVFL"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.web.private_ip]
}
