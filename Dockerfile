FROM ruby:2.2.3-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

ENV RAILS_ROOT /var/www/dockerized-rails-app

RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile

COPY Gemile.lock Gemfile.lock

RUN gem install bundler

RUN bundle install

COPY . .

CMD [ "config/containers/app_cmd.sh" ]

