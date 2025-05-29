cmake_minimum_required(VERSION 3.15)
project(fibonacci CXX)

# Enable coverage instrumentation for Debug builds
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  message(STATUS "Building with code coverage instrumentation")
  # Global compile and link flags for coverage
  add_compile_options(--coverage -O0 -g)
  add_link_options(--coverage)
endif()

add_library(fibonacci src/fibonacci.cpp)
target_include_directories(fibonacci PUBLIC include)

set_target_properties(fibonacci PROPERTIES PUBLIC_HEADER "include/fibonacci.hpp")
install(TARGETS fibonacci)

# Unit tests
enable_testing()
find_package(GTest REQUIRED)
add_executable(unit_tests test/fibonacci_tests.cpp)
target_link_libraries(unit_tests PRIVATE fibonacci GTest::gtest_main)
add_test(NAME unit_tests COMMAND unit_tests)
