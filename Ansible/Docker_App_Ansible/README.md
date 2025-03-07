# Automatic Docker Container Deployment

This document outlines the configuration and automatic deployment of a Docker container using Ansible. It provides details on the Dockerfile setup, the Ansible playbook, required dependencies, and precautionary steps to ensure smooth deployment.

## Workflow

### Application Setup

A simple Flask web application is initially configured. The Dockerfile is then created to run this Flask web application on port 80. Finally, Ansible is set up to deploy this Dockerfile automatically.

### Ansible Workflow

The playbook starts by connecting to the target EC2 instance using the pre-configured hosts file. This file contains the EC2 SSH credentials, public IP, and user information.
Then, it builds the Docker image using: `docker build -t <name> .` After that it removes any existing Docker container with the same name as the one being deployed.
Finally, it deploys the Docker image by docker command: `docker run -d -p 80:80 --name <name> <name of built image>`

## Requirements

A system with Ansible installed

Docker Engine installed on the target machine

Docker file and application file must be uploaded to the target EC2 machine

```
scp -i ~/.ssh/ec2_private dockerfile my_web.py requirements.txt ec2-user@<public-ip>:~/
```

SSH access to the target machine (EC2 instance)

Werkzeug==2.0.3

Flask==2.0.3

## Usage

Run the ansible playbook:

```
ansible-playbook -i ../hosts containerized_docker_app.yml
```

## Output

![image](https://github.com/user-attachments/assets/109f4509-33b8-467b-88a9-e69b6a38206c)

##  Precaution

Ensure your hosts file path when running playbook.

Ensure your target EC2 is up and running

Ensure your hosts file is configured by your EC2's ssh credentials, user and public ip.

Ensure firewall and security groups allow necessary connections.

Validate the Dockerfile to avoid build errors.

## Reference

https://docs.docker.com/get-started/workshop/02_our_app/

## Author 

Hsu Shun Lae

Github: https://github.com/20056371HsuShunLae


