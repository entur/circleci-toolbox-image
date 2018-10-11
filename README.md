# circleci-toolbox-image
Docker image for building with CircleCI, sharing scripts and installed tools amongst different builds

## Some of the tools provided:
* npm
* * jest
* java
* maven
* gcloud

## Some of the scripts provided
* docker authentication
* docker build and push
* gcloud authentication
* trigger "downstream" builds using the CircleCI API
* notifying other build systems, using jenkins-like json format
See the tools folder for details. Add more common tools here to avoid duplication in CircleCI config in x number of projects.

## Reused scripts for building this very image
The Circle CI config for this project uses some of the same scripts for building itself as the produced docker image. This means that issues can be picked up at an earlier stage.
It uses shellcheck to ensure some degree of quality assurance.

## License
See the LICENSE.txt file.
