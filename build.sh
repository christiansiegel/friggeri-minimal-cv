#!/bin/bash

xelatex example-cv.tex
xelatex example-cv.tex

xelatex example-letter.tex
xelatex example-letter.tex

convert -background white -alpha remove -density 150 example-cv.pdf example-cv.png
convert -background white -alpha remove -density 150 example-letter.pdf example-letter.png
