[![google-domains](https://upload.wikimedia.org/wikipedia/commons/4/4a/Google_Domains_logo.svg)](https://domains.google/)

This is a simple Docker container for running the [Google Domains](https://domains.google/) dynamic DNS update script. It will keep your domain.ddns.net DNS alias up-to-date as your home IP changes. 

It is heavily based on David Coppit's work (https://github.com/coppit/docker-no-ip), since Google Domains DDN API is pretty much the same as No-IP's.

The script runs every 5 minutes (by default).

## Usage

### Run

```bash
docker run --name=google-domains-ddns -d -v /etc/localtime:/etc/localtime -v /config/dir/path:/config gongarher/google-domains-ddns
```

When run for the first time, a file named google-domains-ddns.conf will be created in the config dir, and the container will exit. Edit this file, adding your username, password, and domains. Then rerun the command.

To check the status, run: `docker logs google-domains-ddns`


## docker-compose
```yaml
services:
  google-domains-ddns:
    image: gongarher/google-domains-ddns
    container_name: google-domains-ddns
    volumes:
      - /config/dir/path:/config
      - /etc/localtime:/etc/localtime
```
