# Tideways-Daemon Dockerized

This repo contains the Dockerfile required to build an image that runs the [Tideways](https://www.tideways.com/) 
Daemon. This image can be used if you want to run Tideways in a container world. 

Note: we closely follow [what Tideways advises you to do](https://support.tideways.com/documentation/setup/installation/docker-with-compose.html#tideways-daemon-dockerized).  

## Usage

Can be used for example in a docker-compose context in the following way:

```
tideways:
  image: jouwweb/tideways-daemon:v1.6.24
```

And can than configure a client to send data by configuring the client with:

```
tideways.connection = tcp://tideways:9135
```

## Build a new image?

1. Make a new build. This will report a container sha like `0c4790456ad8`. Remember this hash.

   `docker build .`

2. Find out what Tideways version your build is on using the following. For example `v1.6.24`:

   `docker run [image] tideways-daemon`
   
3. Tag the generated image with a new version. Using the image and version found in the steps above here:

   `docker image tag [image] jouwweb/tideways-daemon:[version]`
   
4. Now we push the newly generated image:

   `docker image push jouwweb/tideways-daemon:[version]`
