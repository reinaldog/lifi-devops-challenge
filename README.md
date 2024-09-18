# Bird Application

This is the bird Application! It gives us birds!!!

The app is written in Golang and contains 2 APIs:
- the bird API
- the birdImage API

An additional frontend component has been added to fetch data from the bird API.

# Detailed Process Documentation
[Assignment Documentation](https://app.affine.pro/share/95eda79d-0d58-4b26-9dc4-934a9a7b7b91/sUjLw2RJmM8aIcRYymcJK)

# Installation & How To run it

## Locally:
### Prerequisites
1. Golang
### Build & Run
3. Clone Repository
4. Build and run APIs:
```
# Inside the bird directory
go build -o getBird && ./getBird
# Inside the birdImage directory
go build -o getBirdImage && ./getBirdImage
```

## Using Docker
### Prerequisites
1. Docker
2. Docker Compose
### Build & Run
In the `app` directory run: `docker-compose up --build`

## Using Terraform
### Prerequisites
1. AWS Account
2. Terraform
### Set, Build & Run
1. Create IAM User and save the key-pair
2. Create ssh key to connect to the EC2 instance: `ssh-keygen -f tf-key -t rsa -b 4096`
3. Export env variables:
```
export TF_VAR_aws_access_key=<aws-access-key>
export TF_VAR_aws_secret_key=<aws-secret-key>
export TF_VAR_custom_cidr=<personal-ip/32>
```
4. Go to the terraform folder `cd infrastructure/terraform` and run the terraform commands:
```
terraform init
terraform validate
terraform plan
terraform apply
```

A EC2 instance will be deployed together with a VPC a Security Group and other network resources, then an ansible playbook will be executed installing Minikube, kubectl and all the necessary dependencies, then deploying the app with a helm chart.

# Challenges

- [x] Install and run the app
- [x] Dockerize it (create dockerfile for each API)
- [x] Create an infra on AWS (VPC, SG, instances) using IaC
- [x] Install a small version of kubernetes on the instances (no EKS)
- [x] Build the manifests to run the 2 APIs on k8s 
- [x] Bonus points: observability, helm, scaling
