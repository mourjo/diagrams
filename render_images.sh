#!/bin/zsh

ENDCOLOR="\e[0m"
BLUE="\e[34m"

PLANTUML_JAR_FILE="${PLANTUML_JAR_FILE:-$HOME/software/plantuml-1.2025.2.jar}"

FILES=$(git diff origin/master --name-only | rg puml$)

echo -e "Rendering: ${BLUE}\n$FILES\n\n${ENDCOLOR}"

git diff origin/master --name-only  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar $PLANTUML_JAR_FILE -o out -tsvg &
git diff origin/master --name-only  | rg puml$ | xargs -I{} echo "'{}'" | xargs java -jar $PLANTUML_JAR_FILE -o out -tpng &

wait
git add **/out/*

# to run for all files in a folder:
# fd puml bt-modernization/sotu_sep_2024 | xargs -I{} echo "'{}'" | xargs java -jar $HOME/software/plantuml-1.2024.6.jar -o out -tsvg
# fd puml bt-modernization/sotu_sep_2024 | xargs -I{} echo "'{}'" | xargs java -jar $HOME/software/plantuml-1.2024.6.jar -o out -tpng
