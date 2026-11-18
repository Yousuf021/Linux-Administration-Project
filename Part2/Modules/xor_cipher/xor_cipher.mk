CC = gcc
CFLAGS = -Wall -fPIC -IModules/xor_cipher/inc

SRC = Modules/xor_cipher/src/xor_encrypt.c Modules/xor_cipher/src/xor_decrypt.c
OBJS = $(GEN_DIR)/xor_encrypt.o $(GEN_DIR)/xor_decrypt.o
LIB = $(LIBS_DIR)/libxor.so

all: $(LIB)

$(GEN_DIR)/%.o: Modules/xor_cipher/src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB): $(OBJS)
	$(CC) -shared $(OBJS) -o $@
