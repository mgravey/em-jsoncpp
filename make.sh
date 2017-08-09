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
emcmake cmake -DCMAKE_BUILD_TYPE=release -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF  -G "Unix Makefiles" ..
emmake make -j
cd ..
cp -r include/json/* $EM_PATH/inlcude/json
cp buil/src/lib_json/libjsoncpp.a $EM_PATH/lib/