cmake_minimum_required(VERSION 2.8)
project(joyent-http-parser)

set(CMAKE_C_FLAGS "-Wall -Wextra -Werror")

set(OBJS http_parser.c)
add_library(http-parser ${OBJS})

