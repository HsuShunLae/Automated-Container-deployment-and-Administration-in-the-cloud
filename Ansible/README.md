# Automating Server Configuration: Installing and Configuring Docker on Boot with Ansible

This doument describes how Ansible is applied to automatically install and configure Docker on an earlier-provisioned EC2 host. Ensure it is installed, runs on boot, and allows the ec2-user to perform Docker commands without using `sudo`.

## Workflow

When the Ansible playbook runs, it follows these steps:

### Connect to the EC2 Server

The hosts file contains the authentication details for connecting to the EC2 instance.
Ansible uses SSH to connect and authenticate with the instance before executing tasks.

```
[ec2-server]

54.78.57.103 ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/ec2_private
```
### Update System Packages

The playbook first updates all system packages to ensure the latest dependencies are installed.
This helps maintain security and compatibility before installing Docker.

### Install Docker

Since the instance runs Amazon Linux, Docker is installed via the yum package manager.
Amazon Linux has Docker available in its default repositories, so no additional repositories are required.

### Start Docker Service

The playbook ensures the Docker service is started immediately after installation.
Add ec2-user to the Docker Group

By default, Docker requires root privileges.
To improve security and allow non-root users to run Docker commands, ec2-user is added to the docker group.
Enable Docker on Boot

Configures Docker to start automatically on system boot.
This ensures that Docker remains operational after system reboots.

### Verify Docker Installation

The playbook runs the `docker --version` command to confirm a successful installation.
The output is displayed to validate that the installation and configuration worked as expected.
This ensures that the EC2 instance is fully set up with Docker and ready for containerized applications.

## Requirement

Operating System: Ubuntu 20.04 / 22.04 (or any Linux distribution)

<<<<<In my case, I am using WSL (Windows Subsystem for Linux)>>>>>

SSH access to the target machine

Python Version: Python 3.12+

Ansible Version: Ansible 2.16.3+

### Ansible installation on Ubuntu
```
sudo apt update && sudo apt install -y ansible python3-pip
```
## Usage

Run Ansible Command

```
ansible-playbook -i hosts docker_install.yml
```
## Output

Docker on EC2 instance

![image](https://github.com/user-attachments/assets/69b4b08e-d1ab-46fd-b415-447481cbc3ac)

## Reference

https://docs.ansible.com/

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html

## Precaution

Ensure EC2 is up and running

In hosts file, it must be configured your EC2's ssh credentials, user and public ip before running Ansible Playbook.

## Author

Hsu Shun Lae

Github : https://github.com/20056371HsuShunLae

