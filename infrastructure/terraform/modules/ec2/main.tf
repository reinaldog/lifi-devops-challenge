resource "aws_key_pair" "tf-deploy" {
  key_name = var.key_name
  public_key = file("~/.ssh/tf-key.pub")
}

resource "aws_instance" "minikube" {
  ami           = var.ami
  instance_type = "t3.medium"
  associate_public_ip_address = true
  key_name = aws_key_pair.tf-deploy.key_name

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

#  provisioner "remote-exec" {
#    inline = [
#      "sudo apt update -y",
#      "sudo apt install -y curl docker",
#      "sudo apt-get update && sudo apt-get install docker.io -y",
#      "sudo groupadd docker",
#      "sudo usermod -aG docker $USER",
#      "newgrp docker",
#    ]
#  connection {
#    type        = "ssh"
#    user        = "ubuntu"
#    private_key = file("~/.ssh/tf-key")
#    host        = self.public_ip
#  }

#  }
  tags = {
    Name = "Minikube-Instance"
  }
}
