CC = gcc
CFLAGS = -Wall -IModules/caesar_cipher/inc -IModules/xor_cipher/inc

OUT_DIR = out
GEN_DIR = $(OUT_DIR)/gen
LIBS_DIR = $(OUT_DIR)/libs
TARGET = $(OUT_DIR)/output

all: $(TARGET)

$(TARGET): Application/app.c | $(GEN_DIR) $(LIBS_DIR)
	$(MAKE) -f Modules/caesar_cipher/caesar_cipher.mk GEN_DIR=$(abspath $(GEN_DIR)) LIBS_DIR=$(abspath $(LIBS_DIR))
	$(MAKE) -f Modules/xor_cipher/xor_cipher.mk GEN_DIR=$(abspath $(GEN_DIR)) LIBS_DIR=$(abspath $(LIBS_DIR))
	$(CC) $(CFLAGS) -c Application/app.c -o $(GEN_DIR)/app.o
	$(CC) $(GEN_DIR)/app.o -L$(LIBS_DIR) -lcaesar -lxor -Wl,-rpath,$(abspath $(LIBS_DIR)) -o $(TARGET)

$(GEN_DIR) $(LIBS_DIR):
	mkdir -p $@

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
