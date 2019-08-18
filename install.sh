#!/usr/bin/env /bin/bash
set -e # halt script on error

cd source/_sass/
bundle exec bourbon install
cd ../../

bundle exec jekyll build
