# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster


USER root


COPY . /app

RUN pip install --upgrade -r /app/requirements.txt # pythonのライブラリはrequirements.txtに記述します。

RUN apt-get update # ffmpegをビルド済みバイナリでinstallします。
RUN apt-get install -y ffmpeg
WORKDIR /app

RUN apt-get update
RUN apt-get install -y git

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "organizerbot.py"]



