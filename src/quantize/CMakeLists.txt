cmake_minimum_required(VERSION 3.20)

project(quantize)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

add_executable(${PROJECT_NAME}
    quantize.cpp
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE utils
    PRIVATE ggml
    PRIVATE llama
)

target_include_directories(${PROJECT_NAME} PUBLIC .)
