#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-

function adjust () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local REPO_DIR="$(readlink -m -- "$BASH_SOURCE"/../..)"
  cd -- "$REPO_DIR" || return $?
  npm install eslint@6 || return $?
  sed -re 's~("test": ")elp \&\& ~\1~' -i -- package.json || return $?
}

adjust "$@"; exit $?
