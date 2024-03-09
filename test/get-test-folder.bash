#!/usr/bin/env bash

get_test_folder() {
  echo "$(cd "$(dirname "$1")" >/dev/null 2>&1 && pwd)" 
}
