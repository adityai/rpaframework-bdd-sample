FROM python:3.9.16
MAINTAINER Aditya Inapurapu
WORKDIR /app

ADD . /app
RUN pip install -r requirements.txt
CMD "robot -d results/ tests/"
