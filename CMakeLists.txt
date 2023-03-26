cmake_minimum_required(VERSION 3.20)
project(cleanpaca)

set(CMAKE_CXX_STANDARD 20)

add_subdirectory(src)

if (LLAMA_BUILD_TESTS AND NOT CMAKE_JS_VERSION)
    enable_testing()
    add_subdirectory(tests)
endif ()

