#/bin/bash
echo "phase: create database and table"
mysql -u root -pBwGz55yBfQOb < ./setup.sql
echo "phase: insert locations"
mysql -u root -pBwGz55yBfQOb < insert_locations.sql
echo "phase: insert comics"
mysql -u root -pBwGz55yBfQOb < insert_comics.sql
echo "phase: add page to comic"
mysql -u root -pBwGz55yBfQOb < add_page_to_comic.sql
