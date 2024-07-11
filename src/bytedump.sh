#!/usr/bin/env bash

# This program comes with ABSOLUTELY NO WARRANTY
# This is free software, and you are welcome to redistribute it
# under certain conditions

INPUT="$1"
TEMP_FILE="/tmp/temp.bin"
ARCH="i386:x86-64"

if [[ "$INPUT" == "ppc64" ]]; then
	INPUT="$2"
	ARCH="powerpc:common64"
fi

echo -n "$INPUT" | xxd -r -p > "$TEMP_FILE"
objdump -D -b binary -m "$ARCH" "$TEMP_FILE"
rm "$TEMP_FILE"
