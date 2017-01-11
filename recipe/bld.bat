:: Copy the CMake files to the source dir
xcopy /S "%RECIPE_DIR%\cmake\*" "%SRC_DIR%\libraries\liblmdb"

mkdir build
pushd build
cmake -GNinja ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      "%SRC_DIR%\libraries\liblmdb"

cmake --build . --target install

popd
