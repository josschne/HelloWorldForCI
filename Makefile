all: .hello_world
	
.hello_world: main.cpp
	g++ main.cpp -o hello_world

test-framework:
	sudo apt-get install libgtest-dev cmake
	mkdir -p .gtest-build
	cd .gtest-build; cmake /usr/src/gtest/;	make

test: .hello_world_test
	./hello_world_test --gtest_output=xml

.hello_world_test: test-framework main.test.cpp
	g++ main.test.cpp -L.gtest-build/ -lgtest_main -lgtest -lpthread -o hello_world_test
	
clean:
	git clean -fd