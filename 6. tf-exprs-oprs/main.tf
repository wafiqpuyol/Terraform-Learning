terraform {}

variable "number_list" {
  type    = list(number)
  default = [6, 9, 23, 7]
}

variable "person_map" {
  type = list(map(string))
  default = [{
    name = "John Doe"
    age  = "42"
    },
    {
      name = "Wafiq hossain"
      age  = "69"
  }]
}

variable "instance_object" {
  type = map(map(string))
  default = {
    web_server = {
      instance_type = "t2.micro"
      os            = "windows",
      description   = "web server"
    },
    db_server = {
      instance_type = "t2.micro"
      os            = "linux"
      description   = "db server"
    }
  }
}

locals {
  doubledList        = [for val in var.number_list : val * 2]
  newListOfPersonMap = [{ for person in var.person_map : person.name => person.age }]
  filterByAge = [
    for person in var.person_map : person if person.age == "69"
  ]
  newMapWithFilteredAge = { for person in local.filterByAge : person.name => person.age }

}

output "print_number_list" {
  value = local.doubledList
}
output "print_newList_PersonMap" {
  value = local.newListOfPersonMap
}
output "filter_By_Age" {
  value = local.filterByAge
}
output "new_Map_With_Filtered_Age" {
  value = local.newMapWithFilteredAge
}
