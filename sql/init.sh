#!/bin/bash

mysql -u admin -pBwGz55yBfQOb < ./01_setup.sql
mysql -u admin -pBwGz55yBfQOb < ./02_insert_comics.sql
mysql -u admin -pBwGz55yBfQOb < ./03_add_page_to_comic.sql
mysql -u admin -pBwGz55yBfQOb < ./04_insert_locations.sql
