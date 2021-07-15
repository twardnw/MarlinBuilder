FROM ubuntu:latest

ARG MARLIN_RELEASE=2.0.7.2
ARG MACHINE=V1CNC_SkrTurbo_Dual_2209
ENV MACHINE=${MACHINE}

RUN apt-get update
RUN apt-get install -y python3 python3-pip python3-virtualenv git bash

WORKDIR /app

RUN virtualenv -p python3 .venv
RUN . .venv/bin/activate
RUN pip install platformio
RUN git clone https://github.com/MarlinFirmware/Marlin.git Marlin -b ${MARLIN_RELEASE} --depth 1

CMD /app/build.sh
