FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get install -y postgresql-client

RUN mkdir /erp

WORKDIR /erp

ADD Gemfile /erp/Gemfile
ADD Gemfile.lock /erp/Gemfile.lock
RUN bundle install
ADD . /erp
