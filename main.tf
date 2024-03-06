resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.app_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg_http.id, aws_security_group.app_sg_https.id, aws_security_group.app_sg_ssh.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.deployer.key_name

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  tags = {
    Name = var.instance_name
  }

}
