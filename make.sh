#!/bin/sh

./csv2tex.pl allnames_0a.csv > out.tex;
xelatex out.tex;
cp out.pdf ~/Dropbox/
cp out.pdf /Volumes/NO\ NAME/
