#!/bin/bash

. $(dirname "$(realpath "$0")")/source-base.sh

"$binary_directory/chat" -m "$models_directory"/7B/ggml-model-q4_0.bin -n 128