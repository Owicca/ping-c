CC = clang

SRC_DIR = src
BIN_DIR = bin

SRC = $(SRC_DIR)/main.c
TARGET = $(BIN_DIR)/ping-c

CFLAGS = -Wall -Wextra -O2

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(SRC) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -f $(TARGET)

.PHONY: all clean
