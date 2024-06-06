CC := gcc

STD := -std=c17

CFLAGS := -g -Wall -Wextra $(STD)

SRC_DIR := src
BUILD_DIR := build

# FMT_INC := ./fmt/include
# CFLAGS += -I $(FMT_INC)

BIN := clox

# get all .c files from src dir
SRCS := $(wildcard $(SRC_DIR)/*.c)

# generate corresponding .o files in build dir
OBJS := $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))

# default target
all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# compile each .c file into corresponding object file, depends on .c file AND build directory existing
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR) $(BIN) *.bin