FROM ubuntu:18.04
#FROM ubuntu:20.04
LABEL mantainer=azizboussehal@gmail.com
EXPOSE 8080 5901
ARG DEBIAN_FRONTEND=noninteractive
#ENV TZ=Asia/Singapore
ENV TZ=europe/london

RUN apt-get update
RUN apt-get install -y xfce4 xfce4-terminal
#RUN apt-get update \
#  && apt-get install -y ubuntu-desktop fcitx-config-gtk gnome-tweak-tool gnome-usage
RUN apt-get install -y novnc 
#python3-websockify python3-numpy
RUN apt-get install -y tightvncserver websockify
RUN apt-get install -y wget net-tools wget curl chromium-browser firefox openssh-client git
ENV USER=root
ENV VNC_RESOLUTION=1366x768
ENV DISPLAY_WIDTH=1366
ENV DISPLAY_HEIGHT=768

COPY start.sh /start.sh
RUN chmod a+x /start.sh

RUN useradd -ms /bin/bash user
RUN mkdir /.novnc
RUN chown user:user /.novnc

COPY config /home/user
RUN chown -R user:user /home/user

#WORKDIR /tmp
#RUN wget https://github.com/atom/atom/releases/download/v1.48.0/atom-amd64.deb
#RUN apt-get -y install gvfs-bin
#RUN dpkg -i atom-amd64.deb
RUN apt-get -y install gedit vim
USER user

WORKDIR /.novnc
RUN wget -qO- https://github.com/novnc/noVNC/archive/v1.0.0.tar.gz | tar xz --strip 1 -C $PWD
RUN mkdir /.novnc/utils/websockify
RUN wget -qO- https://github.com/novnc/websockify/archive/v0.6.1.tar.gz | tar xz --strip 1 -C /.novnc/utils/websockify
RUN ln -s vnc.html index.html

WORKDIR /home/user

CMD ["sh","/start.sh"]
