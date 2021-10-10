FROM python:3.8-alpine
LABEL maintainer: "Shailendra kumar"

ENV PYTHONUNPBUFFERED 1

COPY ./requirements.txt ./requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user 
# D allows us to create user to run our application
USER user
