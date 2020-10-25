FROM ruby:2.7.2-slim

RUN groupadd -r app -g 1000
RUN useradd -u 1000 -r -g app -m -s /sbin/nologin app

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY --chown=app:app Gemfile Gemfile.lock /code/

USER app
RUN bundle install

USER root
RUN apt-get purge -y --auto-remove build-essential
USER app

COPY --chown=app:app . /code/

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["run"]

