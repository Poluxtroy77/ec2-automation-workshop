#-------------------------------------------------------------------------
# Data sources permiten recuperar o computar los datos para usarlos en 
# cualquier otra parte de la configuración de Terraform. 
# El uso de "data sources" permite que una configuración de Terraform 
# se base en información definida fuera de Terraform, o definida por otra 
# configuración separada de Terraform.
#-------------------------------------------------------------------------
data "aws_ami" "web" {
  most_recent = true

  owners = ["self"]

  filter {
    name   = "name"
    values = ["webapp*"]
  }
}

output "aws_ami_web_id" {
  value = "${data.aws_ami.web.id}"
}
