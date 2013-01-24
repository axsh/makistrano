#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  function role_defined_role() {
    function nodes() { echo localhost; }
  }
  function task_defined_task() { echo task_defined; }
  function namespace_defined_namespace() {
    task_defined() { echo namespace:defined; }
  }
}

function test_makistrano_eval() {
  makistrano_eval defined_role "" defined_task >/dev/null
  assertEquals $? 0
}

function test_makistrano_eval_undefined_role() {
  makistrano_eval undefined_role "" defined_task >/dev/null 2>&1
  assertNotEquals $? 0
}

function test_makistrano_eval_undefined_task() {
  makistrano_eval defined_role ""undefined_task 2>/dev/null
  assertNotEquals $? 0
}

function test_makistrano_eval_defined_namespace() {
  makistrano_eval defined_role defined_namespace defined_task >/dev/null
  assertEquals $? 0
}

function test_makistrano_eval_undefined_namespace() {
  makistrano_eval defined_role undefined_namespace defined_task >/dev/null 2>&1
  assertNotEquals $? 0
}

## shunit2

. ${shunit2_file}
