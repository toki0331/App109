
## 環境構築手順

### 0.事前準備
このレポジトリをGitCloneしておく
以降、docker-compose.ymlファイルの置いてあるディレクトリで実行する。

### 1.Railsのコンテナを起動してRailsのプロジェクトを作成する
```
$ docker-compose run web rails new . --force --database=mysql
```

### 2.Railsイメージのビルド実行コマンド
```
$ docker-compose build
```

### 3.config/database.ymlの修正
vimか何かで
```
vim config/database.yml
```

- default内の項目を修正する
password: password
host: db

### 4.コンテナをデタッチドモード（バックグラウンド）で実行する
$ docker-compose up -d

### 5.RailsのコンテナでDB作成のタスクを実行する
$ docker-compose run web bundle exec rake db:create

### 6.localhost:3000でアクセスする
