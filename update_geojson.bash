#!/bin/bash -e

for dir in `find -name '*.shp' | xargs dirname`
do
	target="`echo "$dir" | sed 's#/shapes/#/geojson/#'`.geojson"
	rm -f "$target"
	ogr2ogr -f GeoJSON "$target" "$dir"
done
