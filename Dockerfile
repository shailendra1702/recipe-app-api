FROM python:3.8-alpine
LABEL maintainer: "Shailendra kumar"

ENV PYTHONUNPBUFFERED 1

COPY ./requirements.txt ./requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .temp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .temp-build-deps

RUN mkdir /ap p
WORKDIR /app
COPY ./app /app

RUN adduser -D user 
# D allows us to create user to run our application
USER user
