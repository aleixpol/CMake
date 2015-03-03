include(RunCMake)

# Run with ctest -R RunCMake.CMAKE_EXPORT_PROJECT_METADATA -V

set(RunCMake_TEST_OPTIONS "-DCMAKE_EXPORT_PROJECT_METADATA=1.0")
run_cmake(OneTarget)

set(test "OneTarget-ProjectsFile")
set(PROJECTSFILE "${CMAKE_CURRENT_LIST_DIR}/OneTarget-build/ProjectTargets.json")
if (EXISTS "${PROJECTSFILE}")
    file(READ ${PROJECTSFILE} PROJECTSFILE_CONTENT)

    if (NOT PROJECTSFILE_CONTENT MATCHES "\"name\" : \"MyTest\"")
        message(SEND_ERROR "${test} - FAILED: No target name.")
    endif()
    if (NOT PROJECTSFILE_CONTENT MATCHES "\"type\" : \"EXECUTABLE\"")
        message(SEND_ERROR "${test} - FAILED: wrong target type.")
    endif()
else()
    message(SEND_ERROR "${test} - FAILED: Couldn't find ${PROJECTSFILE}")
endif ()
