FROM elixir:1.14.2

WORKDIR /opt/spacial_probe

RUN apt-get update -qq \
    && apt-get install inotify-tools -y

COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get
RUN mix deps.compile
