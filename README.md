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
