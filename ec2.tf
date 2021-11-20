resource "aws_instance" "web" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t2.micro"
  key_name      = "Nov"

  tags = {
    Name = "Test01"
    env  = "dev"
  }
}
resource "aws_ebs_volume" "vol" {
  availability_zone = "us-east-1a"
  size              = 2

  tags = {
    Name = "Testvol"
  }
}