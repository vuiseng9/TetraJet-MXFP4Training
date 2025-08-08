#!/usr/bin/env bash

grep_func() {
    grep "* Acc@1\|Total" "$@"
}