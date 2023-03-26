cmake_minimum_required(VERSION 3.20)

project(chat)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

add_executable(${PROJECT_NAME}
    chat.cpp
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE utils
    PRIVATE llama
    PRIVATE ggml
)
