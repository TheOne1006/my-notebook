#!/bin/bash

#File: tree-md

tree=$(tree -tf --noreport -I 'node_modules|.git|coverage' -N $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

printf "# Project tree\n\n${tree}"