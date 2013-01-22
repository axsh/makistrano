#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_makistrano_xnode() {
  makistrano_xnode hoge >/dev/null
  assertEquals $? 0
}

function test_makistrano_xnode_no_opts() {
  makistrano_xnode 2>/dev/null
  assertNotEquals $? 0
}

## shunit2

. ${shunit2_file}
