package main

import (
	"encoding/csv"
	"fmt"
	"io/ioutil"
	"strings"
)

const (
	DICT_FILE      = "./geo_directory/geonlp_japan_city/geonlp_japan_city_20140310_u.csv"
	CONNECTION_STR = "admin:BwGz55yBfQOb@tcp(rds-intern.cc7ypgxhy74c.ap-northeast-1.rds.amazonaws.com:3306)/orenagi"
)

func main() {
	csvStr := readFile(DICT_FILE)
	locations := locationsFromCSV(csvStr)
	fmt.Println(insertQuery(locations))
}

func readFile(filename string) string {
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}
	return string(data)
}

func locationsFromCSV(csvStr string) (locations []string) {
	r := csv.NewReader(strings.NewReader(csvStr))
	records, err := r.ReadAll()
	if err != nil {
		panic(err)
	}
	// remove duplication
	tmpLocations := make(map[string]bool, len(locations))
	for _, record := range records[1:] {
		tmpLocations[record[2]] = true
		tmpLocations[record[4]] = true
		tmpLocations[record[5]] = true
		tmpLocations[strings.Split(record[8], "/")[0]] = true
	}
	for loc, _ := range tmpLocations {
		locations = append(locations, loc)
	}
	return
}

func insertQuery(locations []string) (sql string) {
	for _, loc := range locations {
		sql = sql + "INSERT INTO orenagi.locations (name) VALUES (\"" + string(loc) + "\");\n"
	}
	return
}
