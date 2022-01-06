FROM ruby:3.1.0-slim

LABEL maintainer "Daniel Ballesteros <dbpaszser@correo.ugr.es>"

ENV PROJECT_DIR=/app/test

ENV HOME_DIR=/home/usuariostandar/

RUN adduser -D usuariostandar

RUN chown usuariostandar $GEM_HOME && chmod 751 $GEM_HOME

USER usuariostandar

COPY Gemfile $HOME_DIR

COPY Gemfile.lock $HOME_DIR

WORKDIR $HOME_DIR

RUN bundle install \
&& rm ${HOME_DIR}Gemfile && rm ${HOME_DIR}Gemfile.lock

RUN ruby -e "-p ENV"

WORKDIR $PROJECT_DIR

ENTRYPOINT ["rake", "test"]
