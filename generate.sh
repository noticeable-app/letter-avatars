#!/bin/bash

BACKGROUND_COLORS=(
  "#F44336" "#E91E63" "#9C27B0" "#673AB7" "#3F51B5" "#2196F3" "#03A9F4"
  "#00BCD4" "#795548" "#009688" "#4CAF50" "#8BC34A" "#CDDC39" "#FFEB3B"
  "#FFC107" "#FF9800" "#FF5722" "#9E9E9E" "#607D8B"
);

CURRENT_DIR=$(cd "$( dirname "$0" )" && pwd);

LETTERS=(
  "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R"
  "S" "T" "U" "V" "W" "X" "Y" "Z"
);

OUTPUT_DIR=$CURRENT_DIR/letters;


function main() {
  rm -rf $OUTPUT_DIR
  mkdir -p $OUTPUT_DIR

  for backgroundColorIndex in ${!BACKGROUND_COLORS[@]};
  do
    backgroundColor=${BACKGROUND_COLORS[backgroundColorIndex]};
    paddedBackgroundColorIndex=$(printf "%02d" $backgroundColorIndex);

    for firstLetterIndex in ${!LETTERS[@]};
    do
      firstLetter=${LETTERS[firstLetterIndex]};

      for secondLetterIndex in ${!LETTERS[@]};
      do
        secondLetter=${LETTERS[secondLetterIndex]};

        generateLetterFiles $backgroundColor $backgroundColorIndex "${firstLetter}${secondLetter}" &
      done;

      wait

      generateLetterFiles $backgroundColor $backgroundColorIndex $firstLetter &
    done;
  done;
}

function generateLetterFiles() {
  sed "s/red/$1/g; s/LP/${3}/g" template.svg \
    > $OUTPUT_DIR/${3}${2}.svg

  toPNG $OUTPUT_DIR/${3}${2}.svg 64
}

function toPNG() {
  convert -size ${2}x${2} $1 ${1%.svg}.png
}


main $@
