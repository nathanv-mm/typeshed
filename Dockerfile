FROM python:3.6

WORKDIR /usr/src/app

COPY . .

RUN wget -O - http://packages.couchbase.com/ubuntu/couchbase.key | apt-key add -
RUN echo "deb http://packages.couchbase.com/ubuntu bionic bionic/main" | tee /etc/apt/sources.list.d/couchbase.list

RUN apt-get update \
    # CB dependencies
    && apt-get install -y libcouchbase-dev libcouchbase2-bin libgeoip-dev libxml2-dev libxslt1-dev libssl-dev libsqlite3-dev zlib1g-dev \
    # cleaning up unused files
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

# need the resolver from the older version of pip for now
RUN pip install pip==20.2.3
RUN pip install -r cb_requirements.txt
RUN pip install mypy
RUN pip install django-stubs

CMD mypy /cb-dev --custom-typeshed-dir .
