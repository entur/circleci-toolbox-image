FROM maven:3.5.4-jdk-8

# Using the same tools for installing in the docker image and for creating this very image
COPY tools /tools
RUN chmod u+x /tools/*sh

# Install gcloud
RUN /tools/gcloud_install.sh
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install docker client
RUN /tools/docker_install.sh

# Install xmlstarlet from apt
RUN apt-get -y update && apt-get -y install xmlstarlet

# Install node using apt
RUN apt-get update && \
    apt-get install nodejs npm && \
    nodejs -v