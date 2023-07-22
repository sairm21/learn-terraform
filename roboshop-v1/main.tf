module "Cart" {
  source = "./ec2"
  name= "Cart"
}

module "Catalogue" {
  source = "./ec2"
  name= "Catalogue"
}

module "Common" {
  source = "./ec2"
  name= "Common"
}

module "Frontend" {
  source = "./ec2"
  name= "Frontend"
}

module "MongoDB" {
  source = "./ec2"
  name= "MongoDB"
}

module "MySQL" {
  source = "./ec2"
  name= "MySQL"
}

module "Payment" {
  source = "./ec2"
  name= "Payment"
}

module "RabbitMQ" {
  source = "./ec2"
  name= "RabbitMQ"
}

module "Redis" {
  source = "./ec2"
  name= "Redis"
}

module "Shipping" {
  source = "./ec2"
  name= "Shipping"
}

module "User" {
  source = "./ec2"
  name= "User"
}
