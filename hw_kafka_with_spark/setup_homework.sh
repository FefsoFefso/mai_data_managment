############################
# RUN VIA ADMINISTRATOR
############################

#!/bin/bash

docker compose up -d --build
python3 init_topics.py

cd producer_setup
docker compose up -d --build
cd ..

# go jupyter-notebook
