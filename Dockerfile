FROM maven:3.5.4-jdk-8

# Install gcloud
RUN VER="218.0.0-linux-x86_64" && \
      wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${VER}.tar.gz && \
      tar -xvzf google-cloud-sdk-${VER}.tar.gz && \
      ./google-cloud-sdk/install.sh -q && \
      ./google-cloud-sdk/bin/gcloud components update && \
      rm google-cloud-sdk-${VER}.tar.gz;
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install docker client
RUN VER="18.03.1-ce" && \
      curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
      tar -xz -C /tmp -f /tmp/docker-$VER.tgz && \
      mv /tmp/docker/* /usr/bin;

# Install xmlstarlet from apt
RUN apt-get -y update && apt-get -y install xmlstarlet

COPY tools /tools
RUN chmod u+x /tools/*sh