all: hello_world
	
hello_world: main.cpp
	g++ main.cpp -o hello_world

test-framework: .gtest-build/libgtest.a

.gtest-build/libgtest.a:
	sudo apt-get install libgtest-dev cmake
	mkdir -p .gtest-build
	cd .gtest-build; cmake /usr/src/gtest/;	make

test: hello_world_test_success

hello_world_test_success: hello_world_test
	./hello_world_test --gtest_output=xml && touch hello_world_test_success

hello_world_test: .gtest-build/libgtest.a main.test.cpp
	g++ main.test.cpp -L.gtest-build/ -lgtest_main -lgtest -lpthread -o hello_world_test
	
clean:
	git clean -fd