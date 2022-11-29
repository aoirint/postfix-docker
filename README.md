# postfix-docker

## Build

```shell
sudo docker buildx build -t postfix .
```


## Copy config

```shell
mkdir postfix

sudo docker run -d --name postfix postfix

sudo docker cp postfix:/etc/postfix/main.cf postfix/
sudo docker cp postfix:/etc/postfix/master.cf postfix/

sudo docker rm -f postfix
```


## Run

```shell
sudo docker run --rm -p "0.0.0.0:25:25" -p "0.0.0.0:465:465" -p "0.0.0.0:587:587" postfix

sudo docker run --rm -v "$PWD/postfix:/postfix" -v "$PWD/certs:/certs" -p "0.0.0.0:25:25" -p "0.0.0.0:465:465" -p "0.0.0.0:587:587" postfix
```

```yaml
services:
  postfix:
    image: aoirint/postfix:20221130.1
    ports:
      - "0.0.0.0:25:25"
      - "0.0.0.0:465:465"
      - "0.0.0.0:587:587"
    volumes:
      - "./postfix:/postfix"
      - "./certs:/certs"
```
