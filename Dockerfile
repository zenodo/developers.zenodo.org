FROM ruby:2.6.10-alpine

WORKDIR /usr/src/app

# Install system dependencies
RUN apk add --no-cache nodejs npm build-base

# Copy application files
COPY . .

# Install bundler and gems
RUN gem install bundler:1.17.2 && \
    BUNDLE_FORCE_RUBY_PLATFORM=true bundle install

VOLUME /usr/src/app/source
EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--bind-address=0.0.0.0", "--watcher-force-polling"]