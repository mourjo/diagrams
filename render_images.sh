#!/bin/zsh

ENDCOLOR="\e[0m"
BLUE="\e[34m"


# diff filter https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---diff-filterACDMRTUXB82308203
# Select only files that are Added (A), Copied (C), Modified (M)
FILES=$(git diff origin/master --diff-filter=ACM --name-only | rg puml$)

echo -e "Rendering: ${BLUE}\n$FILES\n\n${ENDCOLOR}"

git diff origin/master --name-only --diff-filter=ACM  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar ~/software/plantuml-gplv2-1.2024.4.jar -o out -tsvg &
git diff origin/master --name-only --diff-filter=ACM  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar ~/software/plantuml-gplv2-1.2024.4.jar -o out -tpng &

wait
git add */out
