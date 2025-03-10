# Ubuntu NoVNC Desktop

An Ubuntu 18.04 Desktop in a Docker container, running

* Xfce4
* Chromium
* Firefox
* Terminal


## build image
`docker build -t <image-name> .`
## Run the Container

`docker run -d -p 8080:8080 u1ih/ubuntu-novnc`
## Run the Container with volume
`docker run \`
 ` -v /home/audaxis/Desktop/workspace/doctorat/ROS:/home/user/workdir \ `
 ` -p 8082:8080 \ `
 ` no-vnc-gz`


## Access via Web Browser

[http://localhost:8080?password=insecure](http://localhost:8080?password=insecure)

![](desktop1.png)

## Use a different Password

Make sure the password is 8 characters or less. VNC does not seem to like password that are too simple.

`docker run -d -p 8080:8080 -e vncpassword=hello123 u1ih/ubuntu-novnc`

## Can I get 'classic VNC' as well?

Yes.

`docker run -d -p 5901:5901 u1ih/ubuntu-novnc`

## Image on Docker Hub

[https://hub.docker.com/r/u1ih/ubuntu-novnc](https://hub.docker.com/r/u1ih/ubuntu-novnc)

## gazebo-ros2 projet
[gitlab](https://gitlab.informatik.uni-bremen.de/tom_sch/mulecar_simulation/-/tree/master?ref_type=heads)

