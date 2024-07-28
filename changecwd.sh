#!/usr/bin/env bash

function handler {

    cwd=$(cat /tmp/vimd_cwd)
    pushd $cwd > /dev/null

}

trap handler SIGUSR1  # User defined signal
