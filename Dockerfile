####
# This Dockerfile is used in order to build a container that runs the Quarkus application in native (no JVM) mode.
# It uses a micro base image, tuned for Quarkus native executables.
# It reduces the size of the resulting container image.
# Check https://quarkus.io/guides/quarkus-runtime-base-image for further information about this image.
#
# Before building the container image run:
#
# ./mvnw package -Dnative
#
# Then, build the image with:
#
# docker build -f src/main/docker/Dockerfile.native-micro -t quarkus/fj-daogen-quarkus-demo .
#
# Then run the container using:
#
# docker run -i --rm -p 8080:8080 quarkus/fj-daogen-quarkus-demo
#
###
FROM ubuntu:latest
WORKDIR /work/
RUN chown 1001 /work \
    && chmod "g+rwX" /work \
    && chown 1001:root /work
COPY --chown=1001:root helloworld /work/application

ENTRYPOINT ["./application"]
