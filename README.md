# ネコのhotwireデモ

このデモは、[Hotwire](https://hotwired.dev/)を使ったチュートリアルです。

## インストール
```bash
$ git clone []
$ cd hotwire-demo
$ docker-compose up
$ docker-compose exec web bash
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## 使い方
```bash
$ docker-compose exec web bash
$ bin/dev
```
ブラウザで`http://localhost:3000`にアクセスしてください。