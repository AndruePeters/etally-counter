cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)



# name of project
project (ShotCounter)
find_package(Boost REQUIRED COMPONENTS system filesystem)
include_directories(${Boost_INCLUDE_DIRS})

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/socket.io_lib ${Boost_Library_DIRS})

add_executable(ShotCounter main.cpp)
set_property(TARGET ShotCounter PROPERTY CXX_STANDARD 11)
set_property(TARGET ShotCounter PROPERTY CXX_STANDARD_REQUIRED ON)

# Use the following when compiling on Raspberry Pi
# it is commented out currently because of testing socket.io
# target_link_libraries(ShotCounter sioclient ${Boost_LIBRARIES} pthread wiringPi rf24)
target_link_libraries(ShotCounter sioclient ${Boost_LIBRARIES} pthread)

message(STATUS ${Boost_INCLUDE_DIRS} )
