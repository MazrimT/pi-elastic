# pi-elastic
setup for elasticsearch+kibana on raspberry pi 5


will set up elasticsearch and kibana on a raspberry pi 5

# setup
make sure the kibana-entrypoint.sh is executable
```chmod +x kibana-entrypoint.sh```

copy the .env-example file and rename it .env
fill in a root username and password

run this command 3 times: ```openssl rand -hex 16```
Put each key as the generated keys for Kibana in the .env file

# run
run the command ```docker-compose up -d```

# check that it's running
```docker ps```

# check kibana logs
```docker-compose logs -f kibana```