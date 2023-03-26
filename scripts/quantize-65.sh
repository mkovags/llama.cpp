#!/bin/bash

. $(dirname "$(realpath "$0")")/source-base.sh

quantize_directory "65B" "false"
