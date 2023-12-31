data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

data "aws_security_group" "selected" {
  name = "allow-all"
}

output "sg" {
  value = data.aws_security_group.selected.id
}

output "sg1" {
  value = data.aws_security_group.selected.vpc_id
}

data "aws_pricing_product" "example2" {
  service_code = "AmazonEC2"

  filters {
    field = "instanceType"
    value = "c5.xlarge"
  }

  filters {
    field = "operatingSystem"
    value = "Linux"
  }

  filters {
    field = "location"
    value = "US East (N. Virginia)"
  }

  filters {
    field = "preInstalledSw"
    value = "NA"
  }

  filters {
    field = "licenseModel"
    value = "No License required"
  }

  filters {
    field = "tenancy"
    value = "Shared"
  }

  filters {
    field = "capacitystatus"
    value = "Used"
  }
}

output "instance" {
  value = data.aws_pricing_product.example2.filters[2]
}

data "aws_ami" "example4" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.example4.state
}

output "ami1" {
  value = data.aws_ami.example4.owners
}