
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
```
$ docker-compose up -d
```

### 5.RailsのコンテナでDB作成のタスクを実行する
```
$ docker-compose run web bundle exec rake db:create
```

### 6.localhost:3000でアクセスする

### 番外編.なんかアクセスできない時

$ docker-compose up で↓みたいなログが出た場合。

```
web_1  | => Booting Puma
web_1  | => Rails 5.0.0.1 application starting in development on http://0.0.0.0:3000
web_1  | => Run `rails server -h` for more startup options
web_1  | A server is already running. Check /app/tmp/pids/server.pid.
web_1  | Exiting
app109_web_1 exited with code 1
```
強制終了（ctl+C） してから、compose up するとserver.pidが既に存在していると怒られる。（↑ね）
このファイル消しゃーいい。

```
$rm tmp/pids/server.pid
```
ファイル削除後、再度　compose up　して動作確認する
