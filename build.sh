#!/bin/sh

case $1 in
  html)
    jupyter-nbconvert.exe --to html --output-dir html/ notebooks/*.ipynb
  ;;
  slides)
    jupyter-nbconvert.exe --to slides --output-dir slides/ notebooks/*.ipynb
  ;;
  *)
    echo "Unhandled format. Valid formats are: html, slides"
  ;;
esac
