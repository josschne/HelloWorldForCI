all:
	g++ main.cpp -o hello_world

depend:
	sudo apt-get install libgtest-dev cmake
	mkdir -p .gtest-build
	cd .gtest-build
	cmake /usr/src/gtest/
	make