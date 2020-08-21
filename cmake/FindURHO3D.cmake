message( "finding URHO3D!"  )

if(WIN32)

    message("Is Windows")
    set(URHO3D_PATH $ENV{URHO3D_PATH})
    if( URHO3D_PATH )

        message("Find URHO3D_PATH env!")
        message(${URHO3D_PATH})

        find_path( URHO3D_INCLUDE_DIR Urho3D "${URHO3D_PATH}/include" )
        find_path( URHO3D_3RD_INCLUDE_DIR SDL "${URHO3D_PATH}/include/Urho3D/ThirdParty" )
        find_library( URHO3D_LIBRARY Urho3D.lib "${URHO3D_PATH}/lib" )

        
        message(${URHO3D_3RD_INCLUDE_DIR})

        if( URHO3D_INCLUDE_DIR AND URHO3D_LIBRARY AND URHO3D_3RD_INCLUDE_DIR)

            set( URHO3D_FOUND TRUE )

        else()

            set( URHO3D_FOUND FALSE )

        endif()

    else()

        set( URHO3D_FOUND FALSE )
        message("Not Find URHO3D_PATH env!")

    endif()

else()

    message("Not Windows!")
    find_path( URHO3D_INCLUDE_DIR GLFW "/usr/include" )
    find_library( URHO3D_LIBRARY glfw "/usr/lib/x86_64-linux-gnu/")

    if( URHO3D_INCLUDE_DIR AND URHO3D_LIBRARY)

        message("find URHO3D ${URHO3D_LIBRARY}")
        set( URHO3D_FOUND TRUE )

    else()

        set( URHO3D_FOUND FALSE )

    endif()

endif()

message("................................................................")