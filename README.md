# Tideways-Daemon Dockerized

This repo contains the Dockerfile required to build an image that runs the [Tideways](https://www.tideways.com/) 
Daemon. This image can be used if you want to run Tideways in a container world. 

Note: we closely follow [what Tideways advises you to do](https://support.tideways.com/documentation/setup/installation/docker-with-compose.html#tideways-daemon-dockerized).  

## Usage

Can be used for example in a docker-compose context in the following way:

```
tideways:
  image: jouwweb/tideways-daemon:v1.6.32
```

And can than configure a client to send data by configuring the client with:

```
tideways.connection = tcp://tideways:9135
```

## Publishing a new version

Follow these steps to publish a new version of the Tideways daemon image to our Docker repository.

1. Rebuild the image with `--no-cache` to make sure that the latest Tideways version is installed:

   ```sh
   docker build --tag jouwweb/tideways-daemon --no-cache .
   ```

2. Get the Tideways version from the new image:

   ```sh
   TIDEWAYS_VERSION=$(docker run jouwweb/tideways-daemon -version)
   ```
   
3. Tag the generated image with the new version:

   ```sh
   docker image tag jouwweb/tideways-daemon jouwweb/tideways-daemon:${TIDEWAYS_VERSION}
   ```
   
4. Now we push the newly generated image:

   ```sh
   docker image push jouwweb/tideways-daemon:${TIDEWAYS_VERSION}
   ```
