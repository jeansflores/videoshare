FROM ruby:2.5.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs libpq-dev
RUN mkdir /videoshare

WORKDIR /videoshare

COPY Gemfile /videoshare/Gemfile
COPY Gemfile.lock /videoshare/Gemfile.lock

COPY . /videoshare

EXPOSE 3000
