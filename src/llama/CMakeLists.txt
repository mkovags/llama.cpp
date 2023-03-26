cmake_minimum_required(VERSION 3.20)

project(llama)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

add_library(${PROJECT_NAME}
        llama.cpp
        )

target_link_libraries(${PROJECT_NAME}
        PRIVATE utils
        PRIVATE ggml
        )

target_include_directories(${PROJECT_NAME} PUBLIC .)
