#!/bin/bash -e

for dir in `find -name '*.shp' | xargs dirname`
do
	target="`echo "$dir" | sed 's#^\./##'`.geojson"
	ogr2ogr -f GeoJSON "$target" "$dir"
done
