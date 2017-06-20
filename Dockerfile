FROM ruby:2.4.1

COPY ./Gemfile /app/build/Gemfile
COPY ./Gemfile.lock /app/build/Gemfile.lock
WORKDIR /app/build

RUN \
  apt-get update \
  && apt-get install -y openssh-server \
  && mkdir /var/run/sshd \
  && mkdir /app/shared \
  && gem install bundler \
  && bundler \
  && useradd app \
  && mkdir /home/app \
  && chown app:app /home/app \
  && chown app:app /app \
  && chown app:app /app/shared \
