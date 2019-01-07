FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /accounts-service
WORKDIR /accounts-service

COPY Gemfile /accounts-service/Gemfile
COPY Gemfile.lock /accounts-service/Gemfile.lock

RUN bundle install

COPY . /accounts-service