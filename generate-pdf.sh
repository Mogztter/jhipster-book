#!/bin/bash

source $HOME/.rvm/scripts/rvm

rvm use 2.3.1 --quiet
if [ ! -d .bundle/gems ]; then
  rm -f Gemfile.lock
  bundle config --local github.https true
  bundle --path=.bundle/gems --binstubs=.bundle/.bin
fi

ASCIIDOCTOR_PDF="./.bundle/.bin/asciidoctor-pdf"
OPTIMIZE_PDF="`bundle exec gem contents --show-install-dir asciidoctor-pdf`/bin/optimize-pdf"

ROOT_DIR=$(realpath $(dirname $0))
MEDIA=prepress
if [ ! -z "$1" ]; then
  MEDIA=$1
fi
BASE_DIR="$ROOT_DIR/src/docs/asciidoc"
OUT_DIR="$ROOT_DIR/build/asciidoc/pdf-$MEDIA"

$ASCIIDOCTOR_PDF --trace -B "$BASE_DIR" \
  -D "$OUT_DIR" \
  -S unsafe \
  -r "$ROOT_DIR/src/main/ruby/asciidoctor-pdf-extensions.rb" \
  -a media=prepress \
  -a pdfmarks \
  -a pdf-style=infoq-$MEDIA \
  -a pdf-stylesdir="$BASE_DIR/styles/pdf" \
  -a pdf-fontsdir="$BASE_DIR/styles/pdf/fonts" \
  -a sourcedir=../../../main/webapp \
  -a source-highlighter=coderay \
  -a imagesdir=images \
  -a toc \
  -a icons=font \
  -a idprefix \
  -a idseparator=- \
  -a projectdir=../../.. \
  -a rootdir=../../.. \
  -a project-name=jhipster-book \
  -a project-version=1.0.1-SNAPSHOT \
  -a attribute-missing=warn \
  "$BASE_DIR/index.adoc"

$OPTIMIZE_PDF "$OUT_DIR/index.pdf"
mv -f "$OUT_DIR/index-optimized.pdf" "$OUT_DIR/index.pdf"
