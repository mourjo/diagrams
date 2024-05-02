#!/bin/zsh

ENDCOLOR="\e[0m"
BLUE="\e[34m"

FILES=$(git diff origin/main --name-only | rg puml$)

echo -e "Rendering: ${BLUE}\n$FILES\n\n${ENDCOLOR}"

git diff origin/main --name-only  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar /Users/mourjo/software/plantuml-gplv2-1.2024.4.jar -o out -tsvg &
git diff origin/main --name-only  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar /Users/mourjo/software/plantuml-gplv2-1.2024.4.jar -o out -tpng &

wait
git add */out
