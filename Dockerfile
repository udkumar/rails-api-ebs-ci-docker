FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 

RUN mkdir /railsapp
WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock

RUN gem install bundler && bundle install

ADD . /railsapp

EXPOSE 3000

CMD ["/bin/bash", "/railsapp/bin/run_app"]