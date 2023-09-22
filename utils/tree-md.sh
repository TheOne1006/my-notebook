# set -e

#File: tree-md
markdown=$(cd "$1" && tree -L 3  -tf --noreport -I "readme.md|node_modules|.git|coverage|js|sh" -P "*.png|*.html" --charset C -N  --sort=name . |
      sed \
      -e '/^$/d' \
      -e 's/`/|/g' \
      -e 's/    |/|   |/g' \
      -e 's/|   /  /g' \
      -e 's/|--/-/g' \
      -e 's:- \(\(.*\)/\(.*\)\):- [\3](\1):g' \
      -e 's/\.md]/]/g' |
    tail -n +2)

# sed 转成utf8

printf "%s\n" "$markdown" 