cmake_minimum_required(VERSION 3.20)

project(utils)

add_library(${PROJECT_NAME}
    utils.cpp
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE llama
    PRIVATE ggml
)

target_include_directories(${PROJECT_NAME} PUBLIC .)
