provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "linux2" {
  most_recent = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.linux2.id}"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = "${aws_network_interface.foo.id}"
    device_index         = 0
  }
  
  tags = {
    Name = "P1_EC2"
  }
}