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


# Install ruby2.0 jekyll

RUN apt-get -y update
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
RUN cd /tmp
RUN wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
RUN tar -xvzf ruby-2.0.0-p481.tar.gz
RUN cd ruby-2.0.0-p481/
RUN chmod +x configure
RUN ./configure --prefix=/usr/local
RUN make
RUN make install


RUN gem install jekyll bundler \
 && gem install jekyll-asciidoc

RUN  npm install -g @2fd/graphdoc@2.4.0 \
 && npm install -g graphql-docs@0.2.0

