#!/bin/bash

[ -d "my_proj" ] && rm -rf my_proj

mkdir -p my_proj && touch my_proj/main.c my_proj/main.h my_proj/hello.c my_proj/hello.h

for f in my_proj/*; do echo "this file is named $(basename $f)" > "$f"; done

tar -czvf my_proj.tar.gz my_proj

sudo cd /home/edges 2>/dev/null || cd $(eval echo ~edges) 2>/dev/null || true

cp my_proj.tar.gz /home/edges/ && cd /home/edges && tar -xzvf my_proj.tar.g
