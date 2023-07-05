#!/bin/sh
shopt -s extglob
shopt -s nullglob
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
mkdir -p ~/runTimeFiles
rm -r ~/runTimeFiles/*
mkdir -p ~/buildBar
rm -r ~/buildBar/*
cd ~/runTimeFiles
for dir  in !(*olicy*); do
    ( cd "$dir" && zip -r ~/buildBar/"${dir%/}".appzip . )
done
cp -r *olicy* ~/buildBar
cd ~/buildBar
zip -rm "$current_time".bar .