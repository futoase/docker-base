FROM ubuntu

MAINTAINER Keiji Matsuzaki <futoase@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install language-pack-en-base language-pack-ja
RUN update-locale en_US.UTF-8
RUN apt-get -yqq install git build-essential

ADD locale /etc/default/locale

RUN locale-gen en_US.utf8 && dpkg-reconfigure locales
