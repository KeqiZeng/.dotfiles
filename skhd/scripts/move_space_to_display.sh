#!/usr/bin/env bash

display_id=$1

yabai -m space --display "$display_id" &>/dev/null
