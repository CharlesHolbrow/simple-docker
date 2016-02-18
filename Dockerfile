FROM ubuntu:14.04

MAINTAINER Charles Holbrow <charlesholbrow@gmail.com>

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  emacs \
  curl \
  wget

# Optionally we can add this below for a simple password:
# , "-p", "$1$/1JrxCL5$7rGtAryIHSja6zl65FkY21"
RUN ["useradd", "-m", "-s", "/bin/bash", "charles"] 

# I want my .bash_custom handy
ADD https://raw.githubusercontent.com/CharlesHolbrow/bash/master/.bash_custom /home/charles/

RUN echo "source ~/.bash_custom" >> "/home/charles/.bashrc" && \
  chown charles /home/charles/.bash_custom && \
  chmod +r /home/charles/.bash_custom && \
  adduser charles sudo

EXPOSE 80 3000 3333 8000 8888
