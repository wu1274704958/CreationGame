cmake_minimum_required(VERSION 3.0.0)
project(CreationGame VERSION 0.1.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
set(CMAKE_CXX_STANDARD 17)



if(WIN32)
    message("is Windows")
    add_definitions(/permissive-)
    if(${CMAKE_BUILD_TYPE} STREQUAL "Release" )
        add_link_options(/SAFESEH:NO /SUBSYSTEM:WINDOWS )
    else()
        add_link_options(/SAFESEH:NO /SUBSYSTEM:CONSOLE )
    endif()
    message("${CMAKE_EXE_LINKER_FLAGS}")
    set(PLATFORM_NEED_LIB winmm.lib d3d9.lib D3DCompiler.lib version.lib imm32.lib)
else()
    set(PLATFORM_NEED_LIB "")
endif()

message(${PLATFORM_NEED_LIB})

find_package(MINI_TEST)
find_package(URHO3D)

include_directories(
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR} 
)

if(MINI_TEST_FOUND)
    include_directories(${MINI_TEST_INCLUDE_DIR})
endif()

if( URHO3D_FOUND )

add_executable(CreationGame main.cpp)
target_include_directories(CreationGame PRIVATE ${URHO3D_INCLUDE_DIR} ${URHO3D_3RD_INCLUDE_DIR})
message(${URHO3D_LIBRARY})
target_link_libraries(CreationGame ${URHO3D_LIBRARY} ${PLATFORM_NEED_LIB})

endif()

