#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function run_all_tests () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?
  ./usage_demo.sh || return $?
}


run_all_tests "$@"; exit $?
