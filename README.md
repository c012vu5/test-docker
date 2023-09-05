# test-docker
[![License](https://img.shields.io/github/license/c012vu5/test-docker.svg?style=flat-square)](./LICENSE)

コンテナであれこれするときの備忘録

## Variable

### Dockerfile内(build段階)の変数利用
- Dockerfile内の`ARG`で定義
  - build段階でのみ使われるため, コンテナ内に残らない
  - .envと組み合わせて.envで定義した変数をDockerfile内で利用することも可能
- Dockerfile内の`ENV`で定義
  - コンテナ内にも残る

### compose.yml内(deploy段階)の変数利用
- コンテキスト内の.envファイルで定義
- ホスト側の環境変数を参照可能
  - .envファイルで同名の変数が定義されている場合はそちらが優先

### コンテナ内の変数利用
- Dockerfile内の`ENV`で定義
- compose.yml内の
  - `environment`で定義
  - `env_file`で環境変数を定義したファイルを指定

## GUI

[DockerでGUIを表示するときの仕組みについて](https://qiita.com/Spritaro/items/f907a9b52cb78e4fbec0)

## GPU

## Reference

~~[DockerからGUIを使ってみよう](https://www.idnet.co.jp/column/page_229.html)~~  
[Dockerコンテナ上でGUIアプリを表示する](https://zenn.dev/ysuito/articles/fdc4a49d83614a)  
[Dockerの初歩と詰まったことへの備忘録](https://qiita.com/Yuya-Shimizu/items/f0ace02062cc13e9d54b)  
[DockerコンテナをXクライアントにして, ホスト側のXサーバーで描画を行う](https://kazuhira-r.hatenablog.com/entry/2021/01/16/000533)  
[DockerでXサーバーを動かしてGUIを直接表示する](https://blog.kunst1080.net/post/2018/03/18/225102/)  
[DockerでGPUを使おうとしたらError...](https://cocoinit23.com/docker-gpu-error-response-from-daemon-linux-runtime-spec-devices-could-not-select-device-driver-with-capabilities-gpu)  
