FROM python:3.8.13-slim-bullseye

# THANKS M1 FOR THIS
RUN apt-get update && \
  apt-get install -y --no-install-recommends gcc git libssl-dev g++ make && \
  cd /tmp && git clone https://github.com/edenhill/librdkafka.git && \
  cd librdkafka && git checkout tags/v1.9.0 && \
  ./configure && make && make install && \
  cd ../ && rm -rf librdkafka


COPY . .
RUN pip install --no-cache-dir -r requirements.txt


CMD ["python", "route.py"]