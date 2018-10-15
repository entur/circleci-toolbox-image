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
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs npm && \
    nodejs -v

# Install jest because of some node apps assumes that this is available
RUN npm install jest -g && \
    jest -v

# Install libpng-dev
RUN apt-get install -y libpng-dev

# Install build essential, required for some native node addons
RUN apt-get install -y build-essential

# Install postgres with gis support, as this is required for some builds
RUN apt-get install -y postgresql-9.6-postgis-2.3

# Install xmllint
RUN apt-get install -y libxml2-utils


# Install ruby2.3.1 jekyll

RUN apt-get intsall -y ruby-full


RUN gem install jekyll bundler \
 && gem install jekyll-asciidoc

RUN  npm install -g @2fd/graphdoc@2.4.0 \
 && npm install -g graphql-docs@0.2.0

