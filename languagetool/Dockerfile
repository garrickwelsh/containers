FROM docker.io/library/archlinux:latest

MAINTAINER "Garrick Welsh <garrick.welsh@gmail.com>"

RUN pacman -Syu --noconfirm && \
  pacman -S --noconfirm jre-openjdk-headless && \
  pacman -S --noconfirm languagetool

EXPOSE 8081

ENTRYPOINT [ "/usr/bin/languagetool" ]
CMD [ "--http" ]



