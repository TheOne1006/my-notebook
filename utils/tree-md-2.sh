# set -e

#File: tree-md
# 使用 tree 并 转换为 markdown 格式


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