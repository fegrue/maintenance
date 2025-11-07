FROM ubuntu:20.04

RUN apt-get update && apt-get install -y sudo

RUN useradd -m demo && echo 'demo:password' | chpasswd && usermod -aG sudo demo

RUN echo 'demo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER demo

