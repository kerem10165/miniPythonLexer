cmake -S . -B build
cmake --build build -j8
clear
cd build
./miniPythonLexer test.py $@
cd ..