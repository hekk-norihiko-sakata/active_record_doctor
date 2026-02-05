FROM ruby:3.2.8

# 必要なパッケージのインストール (libyaml-dev を追加しました)
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    git \
    vim \
    libyaml-dev

# 作業ディレクトリの設定
WORKDIR /myapp

# Gemfileをコピーしてbundle install
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# アプリケーションのコピー
COPY . /myapp

# コンテナ起動時に毎回実行されるスクリプト
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Railsサーバー起動
CMD ["rails", "server", "-b", "0.0.0.0"]
