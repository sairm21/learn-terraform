variable "sample" {
  default = 100
}

variable "sample1" {
  default = "output in quotes"
}

output "sample" {
  value = var.sample
}

output "sample1" {
  value = var.sample1
}

# variable/any other reference need to be accessed with some other string then need to be accessed through ${}

output "sample_ext" {
  value = "value of sample and sample1 are ${var.sample} and ${var.sample1}"
}

# variable datatypes in terraform
# 1. string
# 2. number
# 3. boolean

# variable types in terraform
# 1. plain
# 2. list
# 3. map

# plain
variable "course" {
  default = "DevOps training"
}

# List
variable "courses" {
  default = [
    "DevOps",
    "AWS",
    "Ansible",
    "Terraform"
  ]
}

# Map
variable "course_details" {
  default = {
    DevOps = {
      name = "DevOps"
      timming = "7:30 AM"
      duration = "90 days"
    }
    AWS = {
      name = "AWS"
      timming = "8:30 AM"
      duration = "90 days"
    }
  }
}

output "course" {
  value = var.course
}

output "courses" {
  value = var.courses[2]
}

output "course_details" {
  value = var.course_details["AWS"]
}