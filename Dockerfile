ARG ruby_version=2.7.1

FROM ruby:${ruby_version}
LABEL maintainer="info@coditramuntana.com"

ARG decidim_version=0.23.1

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV PORT 3000
ENV TZ=Europe/Lisbon
WORKDIR /code

RUN apt-get install -y git imagemagick wget \
  && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean

RUN npm install -g npm@6.3.0

RUN gem install bundler --version '>= 2.1.4' \
  && gem install decidim:${decidim_version} --no-document

COPY ./config/imagetragick-policy.xml /etc/ImageMagick-6/policy.xml

CMD ["decidim"]

ENTRYPOINT []
