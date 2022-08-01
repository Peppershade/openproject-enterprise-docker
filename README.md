# openproject-enterprise-docker

Openproject container with all features. This is for community/educational use. Please do not use this for your enterprise deployment.

## Building from source (Possible to add plugins)

Clone this repo, add plugins to gemfile and build using docker build or docker buildx
```docker buildx build -t peppershade/openproject-enterprise:latest .```

## Running prebuild container from dockerhub (Not possible to add plugins)

Run the following commands for a quick setup of a "secure educational/homelab use"
```
sudo mkdir -p /var/lib/openproject/{pgdata,assets} 

docker run -d -p 8080:80 --name openproject \
  -e SERVER_HOSTNAME=openproject.example.com \ # The public facing host name
  -e SECRET_KEY_BASE=secret \ # The secret key base used for cookies
  -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
  -v /var/lib/openproject/assets:/var/openproject/assets \
  peppershade/openproject-enterprise:12
```

Image works exactly like the official one, check out their documentation for all options https://www.openproject.org/docs/installation-and-operations/installation/docker/
