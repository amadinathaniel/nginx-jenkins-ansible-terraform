variable "profile" {
    default = "DevOpsUser"
    description = "The profile used to auth to AWS"
}

variable "region" {
    default = "eu-west-2"
    description= "The region our instance will be in (i.e. us-east-1)"
}

variable "name" {
    default = "hello"
    description= "The name of the instance we are creating"
}

variable "group" {
    default = "web"
    description= "the name of the group we will be using for Ansible purposes"
}