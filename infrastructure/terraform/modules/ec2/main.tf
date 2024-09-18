resource "aws_key_pair" "tf-deploy" {
  key_name = var.key_name
  public_key = file("~/.ssh/tf-key.pub")
}

resource "aws_instance" "minikube" {
  ami           = var.ami
  instance_type = "t3.medium"
  associate_public_ip_address = true
  key_name = aws_key_pair.tf-deploy.key_name

  root_block_device {
    volume_size = 20
  }

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  user_data = <<-EOF
              #!/bin/bash
              groupadd docker || true
              usermod -aG docker ubuntu
              EOF

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/tf-key")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "${path.module}/files/ansible-playbook.yaml"
    destination = "/tmp/playbook.yaml"
  }



  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt-get update",
      "sudo apt-get install -y ansible docker.io docker-compose-v2",
      "cd /tmp/",
      "sudo ansible-playbook playbook.yaml"
    ]

  }
  tags = {
    Name = "Minikube-Instance"
  }
}
