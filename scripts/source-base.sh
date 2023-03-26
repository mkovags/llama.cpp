# Do not use this file directly, it's meant to be sourced by other scripts

script_dir="$(dirname "$(realpath "$0")")"
git_root=$(git rev-parse --show-toplevel)
binary_directory="$git_root/cmake-build-debug/bin"
models_directory="$git_root"/models/

function convert_f16() {
    python3 "$script_dir"/convert-pth-to-ggml.py "$git_root"/models/"$1" 1
}

function convert_f32() {
    python3 "$script_dir"/convert-pth-to-ggml.py "$git_root"/models/"$1" 0
}

# quantize_directory(input_directory, remove_f16)
# Processes ggml-model-f16.bin* files in the specified directory by running the 'quantize'
# script/executable. Replaces original files with their quantized versions (q4_0 in the file
# names) and removes original files if remove_f16 is "true".
#
# Example usage:
#   quantize_directory "example_dir" "true"  # Quantizes and removes originals
#   quantize_directory "example_dir" "false" # Quantizes without removing originals
function quantize_directory() {
  input_directory="$1"
  remove_f16="$2"

  for i in "$models_directory"/"$1"/ggml-model-f16.bin*; do
      original_file="$i"
      new_file="${i/f16/q4_0}"
      "$binary_directory"/quantize "$i" "$new_file" 2
      if [[ "$2" == "true" ]]; then
          rm "$i"
      fi
  done
}
