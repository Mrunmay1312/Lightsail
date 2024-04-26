# Creation of lightsail instances

resource "aws_lightsail_instance" "instances" {
  count = var.instance_count
  name = "${var.instance_name}-${count.index +1}"   # Appending index + 1 to tag better
  availability_zone = var.availability_zones
  blueprint_id = var.blueprint_id
  bundle_id = var.bundle_id

  tags = {

    Name = "${var.instance_name}-instance"
  }
  user_data = file("${path.root}/user_data.sh")
}

# Creation of lightsail loadbalancer
resource "aws_lightsail_lb" "lb" {
    name = var.lb_name
    instance_port = 80
}

# Creation of lightsail loadbalancer attachment
resource "aws_lightsail_lb_attachment" "lb_attachment" {
  count = var.instance_count
  lb_name = aws_lightsail_lb.lb.name
  instance_name = aws_lightsail_instance.instances[count.index].name
}