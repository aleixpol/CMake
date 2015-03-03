CMAKE_EXPORT_PROJECT_METADATA
-----------------------------

Exports the metadata of the metadata of the project.

This variable will be used to specify whether a ProjectTargets.json will be
when generating the build directory. To do so, the variable will be initialized
with the version number of the file to generate.

This file can be used by 3rd party software such as an IDE or a code browser to
figure out how the project will be built.

Currently the only supported value is "1.0". Any other value will result with
the file not being generated.
