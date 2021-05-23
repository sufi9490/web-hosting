resource "aws_route_table" "table" {
  vpc_id = "${aws_vpc.main.id}"
 route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "MyRoute"
  }
}

