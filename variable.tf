variable "name" {
    description = "Nombre del cluster kind"
    type = string
    default = "kindcluster"
    
}
variable "kind_image" {
    description = "Imagen Docker a usar para ejecutar cluster kind k8s"
    type = string
    default = "kindest/node:v1.23.4"
}
variable "registry_mirrors" {
    description = "Url o ip del registry docker"
    type = string
    default = "ip:puerto"
}
variable "insecure_skip_verify" { default = "true" }