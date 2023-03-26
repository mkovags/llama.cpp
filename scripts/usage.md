## Overview

This script converts a LLaMA model checkpoint to a ggml compatible file. The conversion is performed by loading the model using PyTorch, iterating over all its variables, and writing them to a binary file. The script supports different float types (float16 and float32) and handles partial model files for large models.
Usage

To use the script, you need to have Python and the required packages installed:

```bash
$ pip install torch sentencepiece
```

Run the script with the required arguments:

```bash
$ python convert-ckpt-to-ggml.py <dir-model> <ftype>
```

Where <dir-model> is the path to the model directory, and <ftype> is an integer representing the float type (0 for float32 and 1 for float16).
## Details
### Input

The script expects a LLaMA model checkpoint and its associated tokenizer file as input. The model checkpoint file should be in PyTorch format (with a .pth extension), and the tokenizer file should be a SentencePiece model (with a .model extension).

### Output

The output of the script is a binary file in ggml format, containing the converted model and its associated metadata. The output file will be saved in the same directory as the input model, with the following naming convention:

```
ggml-model-<ftype_str>.bin
```


Where <ftype_str> is either "f32" for float32 or "f16" for float16. If the model has multiple parts, the output files will have part numbers appended to their names, such as:

```
ggml-model-<ftype_str>.bin.<part_number>
```

## Float Type Support

The script allows users to choose between float32 and float16 data types for model variables. By default, the script converts larger matrices to float16 to save space. However, users can disable this by specifying the "use-f32" command-line argument (setting ftype to 0).
Large Model Support

For large models with dimensions that exceed the capabilities of some hardware, the script supports dividing the model into multiple parts. The script calculates the number of parts based on the model's dimensions and processes each part separately.