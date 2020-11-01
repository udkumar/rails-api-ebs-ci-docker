FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 

RUN mkdir /railsapp
WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock
RUN apt-get install ruby-dev -y
RUN gem install bundler && bundle config build.nokogiri --use-system-libraries && gem install ffi -v '1.13.1' --source 'https://rubygems.org/' && \
gem install nokogiri -v '1.10.10' --source 'https://rubygems.org/' && gem install nio4r -v '2.5.4' --source 'https://rubygems.org/' && \
bundle update && bundle install

ADD . /railsapp

EXPOSE 3000

CMD ["/bin/bash", "/railsapp/bin/run_app"]
