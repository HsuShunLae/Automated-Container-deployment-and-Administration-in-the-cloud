# CI/CD Pipeline for Automated Docker Build and Deployment to AWS EC2 Using GitHub Action

This document outlines how GitHub Action CI/CD Pipeline will automatically build and deploy Docker image on AWS EC2 whenver code is pushed from GitHub.

## Workflow

### Preconfiguration

Before running the pipeline, all necessary variables for logging into Docker Hub and accessing EC2 via SSH must be configured and stored as repository secrets.

![image](https://github.com/user-attachments/assets/bd5043e4-b475-43cd-a131-aa6b5738fdc9)

### Pipeline Workflow

The pipeline is triggered whenever code is pushed to GitHub. It consists of two main jobs: Building the Docker Image and Deploying the Docker Image.

#### Building the Docker Image

The pipeline executes in the virtual ubuntu latest environment and pulls the repository code.

A pre-configured Dockerfile is used to build the image. The built image is then pushed to Docker Hub.

Configured Dockerfile will be built into the Docker Hub after logging in to the docker hub which is a cloud-based container registry.

The built image is then saved in that docker hub by pushing it to that.

#### Deploying the Docker Image

The pipeline establishes an SSH connection to the EC2 instance using the pre-configured SSH credentials.

Before deploying, it first removes any existing Docker containers with the same name to avoid conflicts.

The deployment step runs `docker run` commands to start the container on the EC2 instance.

## Usage

Simply push or commit code to GitHub to trigger the pipeline.

Alternatively, manually trigger the pipeline from GitHub Action.

![image](https://github.com/user-attachments/assets/8569ed49-8365-4aad-bab9-1308bbccd1c2)

## Output

Verify the output by requesting the web page

```
curl -i http://<public ip>
```
OR
In the EC2 instance,
```
dockr ps
```

## Requirement

AWS EC2 instance with Docker installed.

A valid Docker Hub account.

A valid Dockerfile in the repository.

SSH connection to the target AWS EC2 instance configured in GitHub secrets.

AWS EC2 instance's security group must allow port 22 (SSH) and port 80 (HTTP).

## Precaution

Ensure the target EC2 instance is up and running with all required configurations installed.

Update SSH connection credentials and the public IP of the target EC2 instance as needed.

Ensure all the requirements configured

## Reference

https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action

https://docs.docker.com/get-started/introduction/build-and-push-first-image/

## Author

Hsu Shun Lae

Github: https://github.com/20056371HsuShunLae
