# Use official Ruby image as a base image
FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  sqlite3 \
  postgresql-client \
  build-essential \
  libpq-dev

# Set the working directory inside the container
WORKDIR /app

ENV RAILS_ENV=test

# Install Rails dependencies
COPY Gemfile ./
RUN bundle install

# Add the rest of the app files
COPY . .

# Expose the port that Rails will run on
EXPOSE 3000

# Run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
