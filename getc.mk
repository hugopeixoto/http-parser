LD=clang
CXX=clang++

LIBNAME=joyent-httpparser
REQUIRED_LIBS=
INCLUDE_PATH=./

SRC=http_parser.c

TEST_NAME=test
TEST_SRC=test.c


CXXFLAGS += -Wall -pedantic -Werror -std=c++14 -stdlib=libc++
LDFLAGS += -lc++

CXXFLAGS += -I$(INCLUDE_PATH)
LDFLAGS += $(REQUIRED_LIBS)


LIB=lib$(LIBNAME).a
OBJ=$(addsuffix .o, $(basename $(SRC)))
TEST_OBJ=$(TEST_SRC:.cc=.o)
CURPATH=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: $(TEST_NAME) $(LIB)

$(LIB): $(OBJ)
	$(AR) rcs $@ $^

$(TEST_NAME): $(TEST_OBJ) $(LIB)
	$(LD) -o $@ $^ $(LDFLAGS)

ldflags:
	@echo -L"$(CURPATH)" -l$(LIBNAME) $(REQUIRED_LIBS)

cxxflags:
	@echo -I"$(CURPATH)$(INCLUDE_PATH)"

clean:
	rm -rf $(TEST_NAME) $(TEST_OBJ) $(OBJ) $(LIB)
