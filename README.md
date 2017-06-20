# nginx-cache

Nginxで `スマホの時 + 特定のpath` のみをキャッシュする

## Usage

```
$ docker-compose build
$ docker-compose up -d
```

## Test

### localhost:58083/cache + スマホUA
  - このリクエストは何回叩いても1分間の間、時間が進むことはない(キャッシュしている)

```
$ curl -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Mobile Safari/537.36' localhost:58083/cache
Request path: /cache
Last sinatra request time is 2017-06-20 10:06:21
```

### localhost:58083/cache + PC UA
  - このリクエストはPCでのアクセスなのでキャッシュしない、時間は常に進む

```
$ curl -H 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36' localhost:58083/cache
Request path: /cache
Last sinatra request time is 2017-06-20 10:10:11
```

### localhost:58083/no_cache + スマホUA
  - キャッシュ対象ページではないので常に時間は進む

```
$ curl -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Mobile Safari/537.36' localhost:58083/no_cache
Request path: /no_cache
Last sinatra request time is 2017-06-20 10:11:52
```

### localhost:58083/no_cache + PC UA
  - キャッシュ対象ページではないので常に時間は進む

```
$ curl -H 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36' localhost:58083/no_cache
Request path: /no_cache
Last sinatra request time is 2017-06-20 10:12:13
```
