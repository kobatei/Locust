FROM python:3.6-slim

RUN set -ex \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
        libxml2-dev \
        libpq-dev \
        poppler-data \
        poppler-utils \
        build-essential

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt

#RUN mkdir /locust
WORKDIR /locust
ADD ./src/locustfile.py /locust/locustfile.py

EXPOSE 5557 5558 8089

ENTRYPOINT ["/usr/local/bin/locust", "-f", "/locust/locustfile.py"]