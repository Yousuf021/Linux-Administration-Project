CC = gcc
CFLAGS = -Wall -IModules/caesar_cipher/inc

SRC = Modules/caesar_cipher/src/caesar_encrypt.c Modules/caesar_cipher/src/caesar_decrypt.c
OBJS = $(GEN_DIR)/caesar_encrypt.o $(GEN_DIR)/caesar_decrypt.o
LIB = $(LIBS_DIR)/libcaesar.a

all: $(LIB)

$(GEN_DIR)/%.o: Modules/caesar_cipher/src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB): $(OBJS)
	ar rcs $@ $(OBJS)
