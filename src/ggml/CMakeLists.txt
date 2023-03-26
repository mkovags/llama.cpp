cmake_minimum_required(VERSION 3.20)

project(ggml)

add_library(${PROJECT_NAME}
    ggml.c
)

target_include_directories(${PROJECT_NAME} PUBLIC .)

