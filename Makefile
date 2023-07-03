CC = gcc
CFLAGS = -Wall -Werror --coverage 

LIB_NAME = libadd.a
SRC_FILES = add.c sub.c
OBJ_FILES = $(SRC_FILES:.c=.o)

TEST_SRC_FILES = test.c
TEST_OBJ_FILES = $(TEST_SRC_FILES:.c=.o)

.PHONY: all clean test

all: $(LIB_NAME)

$(LIB_NAME): $(OBJ_FILES)
	$(AR) rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test: $(LIB_NAME) $(TEST_OBJ_FILES) 
	$(CC) $(CFLAGS) -o $@ $^ -L. -ladd
	./test

coverage: test
	# lcov --capture --directory . --output-file coverage.info
	# lcov --summary coverage.info
	coveralls --gcov-options '\-lp' -r .

clean:
	rm -f $(LIB_NAME) $(OBJ_FILES) $(TEST_OBJ_FILES) test
