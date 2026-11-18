cmake_minimum_required(VERSION 3.10)
project(CryptoApp C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs)

add_subdirectory(Modules/caesar_cipher)
add_subdirectory(Modules/xor_cipher)

include_directories(Modules/caesar_cipher/inc Modules/xor_cipher/inc)

add_executable(output Application/app.c)
target_link_libraries(output PRIVATE caesar xor)
