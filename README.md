# test-docker
[![License](https://img.shields.io/github/license/c012vu5/test-docker.svg?style=flat-square)](./LICENSE)

コンテナであれこれするときの備忘録

## Variable

### Dockerfile内(build段階)の変数利用
- Dockerfile内の`ARG`で定義
  - build段階でのみ使われるため, コンテナ内に残らない
  - `compose.yml`内の`build` -> `args`で定義
    - 同名変数があれば`compose.yml`内のものが優先
    - `.env`と組み合わせて`.env`で定義した変数を`Dockerfile`内で利用することも可能
- `Dockerfile`内の`ENV`で定義
  - コンテナ内にも残る

### compose.yml内(deploy段階)の変数利用
- コンテキスト内の`.env`ファイルで定義
- ホスト側の環境変数を参照可能
  - `.env`ファイルで同名の変数が定義されている場合はそちらが優先

### コンテナ内の変数利用
- Dockerfile内の`ENV`で定義
- `compose.yml`内の
  - `environment`で定義
    - `env_file`内で同名変数があれば`environment`のものが優先
  - `env_file`で環境変数を定義したファイルを指定
    - リスト下側にあるものが優先的に上書きする

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
