FROM ruby:2.0.0

RUN mkdir /gem

RUN touch ~/.gemrc && echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

WORKDIR /gem

ADD . /gem/

RUN bin/setup

VOLUME .:/gem/

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
