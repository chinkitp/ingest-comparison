```bash
$ docker-compose up --build
$ esrally configure --advanced-config
$ esrally --pipeline=benchmark-only --target-hosts=elasticsearch:9200 --track-path=./ --preserve-install=true
```
