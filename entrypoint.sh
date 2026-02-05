#!/bin/bash
set -e

# RailsのPIDファイルが残っているとサーバーが起動しないため削除
rm -f /myapp/tmp/pids/server.pid

# コンテナのメインプロセスを実行（CMDで指定されたコマンド）
exec "$@"
