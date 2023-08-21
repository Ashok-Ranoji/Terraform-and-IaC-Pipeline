### Terraform-and-IaC-Pipeline
This repo is to show that how we can use Terraform template and with the use of Github action to deploy the IaC pipeline for Resource creations.

The below steps to Build Docker Image using Dockerfile

1. Create a file named Dockerfile.
2. Add instructions in Dockerfile.
3. Build dockerfile to create image.
4. Run image to create container.

### Commands to create image and create/start container, also to upload the image to DockerHub registry

1. docker build -t dockerlab .    (dockerlab is the name of the Image which would be created)
2. docker run -it --name testcontainer dockerlab     (Using Image name - dockerlab, creating container name - testcontainer)
3. docker ps -a     (To see all the running containers)
4. docker image tag dockerlab USER/trtest:latest   (dockerlab is the name of image and USER is your Docker Hub username)
5. docker image push USER/dockerlab:latest   (dockerlab is the name of image and USER is your Docker Hub username)
