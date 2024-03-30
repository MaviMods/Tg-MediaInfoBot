FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US:en TZ=Asia/Kolkata

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    libtinyxml2-9 \
    libcurl3-gnutls \
    libmms0 \
    libzen0v5 \
    libcurl4-gnutls-dev \
    libzen-dev \
    wget \
    ffmpeg \
    libsox-fmt-mp3 \
    sox \
    locales \
    megatools \
  && rm -rf /var/lib/apt/lists/*
  
RUN pip3 install -r requirements.txt

COPY . .

RUN chmod +x start

CMD ["bash", "start"]
