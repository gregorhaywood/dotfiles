#!/bin/bash

dir=$(mktemp -d)
cd $dir
while read $line
do
  l=$(playerctl metadata --format '{{mpris:artUrl}}')
  curl --silent $l -o img
  echo $(pwd)/img
done < <(playerctl --follow metadata --format '{{mpris:artUrl}}')
