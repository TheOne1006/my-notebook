# set -e

#File: tree-md

# tree=$(tree -tf --noreport -I 'node_modules|.git|coverage' -N $1 |
#        sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

# tree=$(tree -tf --noreport -I 'node_modules|.git|coverage' -N $1 |
#        sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')


markdown=$(cd "$1" && tree -L 3  -tf --noreport -I "readme.md|node_modules|.git|coverage" -P "*.md" --charset ASCII  --sort=name . |
       LC_ALL=C sed \
      -e '/^$/d' \
      -e 's/`/|/g' \
      -e 's/    |/|   |/g' \
      -e 's/|   /  /g' \
      -e 's/|--/-/g' \
      -e 's:- \(\(.*\)/\(.*\)\):- [\3](\1):g' \
      -e 's/\.md]/]/g' |
    tail -n +2)



printf "%s\n" "$markdown" 