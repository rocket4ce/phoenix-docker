# Extend from the official Elixir image
FROM elixir:latest

# Create app directory and copy the Elixir projects into it
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs build-essential

WORKDIR /app/hello
ADD . /app/hello

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

# Compile the project
RUN mix do compile --force

CMD "/app/hello/entrypoint.sh"