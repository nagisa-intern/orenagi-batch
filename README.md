# Orenagi_-batch
---  
本リポジトリではSQL生成やバッチ処理のためのソースを記述しております  

# 使い方  

## locationsテーブルへのデータ挿入  
```sh
wget https://geonlp.ex.nii.ac.jp/dictionary/geonlp/japan_city/geonlp_japan_city_20140310_u.zip
unzip geonlp_japan_city_20140310_u.zip
rm geonlp_japan_city_20140310_u.zip
go run location_inject.go > ./sql/insert_locations.sql
```

## locations\_comicsテーブルへのデータ挿入  
```sh
```

#### ※試験運用用のMySQLサーバの起動
1. locationsテーブルへのデータ挿入
1. locations\_comicsテーブルへのデータ挿入  
を実行後  
```sh
cd docker
docker-compose up -d
docker ps    # コンテナ名を確認
docker exec -it docker_mariaDB_1 /bin/bash    # コンテナ名"docker_mariaDB_1"の場合
cd /var/tmp
./init.sh
```
