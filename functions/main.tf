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

