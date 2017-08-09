#!bin/bash

if [ -z ${EM_PATH+x} ]; then 
	echo "EM_PATH is unset"; 
	export EM_PATH="$(PWD)/test"
else 
	echo "EM_PATH is set to '$EM_PATH'"; 
fi

git clone https://github.com/open-source-parsers/jsoncpp.git
cd jsoncpp/
mkdir build
cd build
emcmake cmake -DCMAKE_BUILD_TYPE=release -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$EM_PATH -DCMAKE_INSTALL_LIBDIR=$EM_PATH/lib  -G "Unix Makefiles" ..
emmake make -j
emmake make install
