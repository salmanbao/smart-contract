#!/usr/bin/env bash
set -e
# remove solc from truffle to use our version
rm -rf node_modules/truffle/node_modules/solc
for file in "scripts/templated-tests/configs/token"/**/*
do
  echo "testing file "$file
  source $(dirname "$0")/templated-tests/compile-token-template.sh $file && source $(dirname "$0")/templated-tests/test-token-template.sh $file || error "failed test "$file
done
