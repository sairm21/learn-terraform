variable "class" {
  default = "devops"
}
## print the same in capital letters
output "class" {
  value = upper(var.class)
}

variable "fruits" {
  default = ["apple", "bannana", "orange"]
}
## print the same in capital letters
output "fruits_count" {
  value = length(var.fruits)
}

variable "classes" {
  default = {
    devops={
      name="devops"
      topics=["jenkins", "docker"]
    }
    aws={
      name="aws"
    }
  }
}

output "devops_topics" {
  value = var.classes["devops"]["topics"]
}

output "aws_topics" {
  value = lookup(lookup(var.classes, "aws", null), "topics", "no topic so far")
}