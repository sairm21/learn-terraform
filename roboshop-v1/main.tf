module "instances" {
  for_each = var.instances
  source = "./ec2"
  name= each.key
}

variable "instances" {
  default={
    Frontend={}
    MongoDB={}
    Catalogue={}
    Redis={}
    User={}
    Cart={}
    MySQL={}
    Shipping={}
    RabbitMQ={}
    Payment={}
    Dispatch={}
  }
}

