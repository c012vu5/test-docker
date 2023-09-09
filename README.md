# test-docker
[![License](https://img.shields.io/github/license/c012vu5/test-docker.svg?style=flat-square)](./LICENSE)

コンテナであれこれするときの備忘録

## Variable

### Dockerfile内(build段階)の変数利用
- Dockerfile内の`ARG`で定義
  - build段階でのみ使われるため, コンテナ内に残らない
  - compose.yml内の`build` -> `args`で定義
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

- コンテナをホストネットワークで起動する
- 環境変数`${DISPLAY}`をホスト・コンテナ間で共有
- Xサーバーへの認証情報`.Xauthority`をコンテナ内に共有
  - コンテナ内実行ユーザーのホームディレクトリへ
  - 所有者は関係なく動作した
    - 読めればOK?

以上3点を満たせば, コンテナ内でGUIアプリを動かせる.  

docker composeを利用したかったが, `docker run ....`コマンドをcompose.ymlに落とし込めなかった  
`Error: Can't open display: ${DISPLAY}`

## GPU

[DockerでGPUを使おうとしたらError...](https://cocoinit23.com/docker-gpu-error-response-from-daemon-linux-runtime-spec-devices-could-not-select-device-driver-with-capabilities-gpu)  
~~[DockerからGUIを使ってみよう](https://www.idnet.co.jp/column/page_229.html)~~  
[Dockerの初歩と詰まったことへの備忘録](https://qiita.com/Yuya-Shimizu/items/f0ace02062cc13e9d54b)  
