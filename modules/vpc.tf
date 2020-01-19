data "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16"
  id = "${var.vpc_id}"
  
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "${data.aws_vpc.my_vpc.id}"
  cidr_block        = "172.31.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = "${aws_subnet.my_subnet.id}"
  private_ips = ["172.31.10.100"]

  tags = {
    Name = "P1_Interface"
  }
}