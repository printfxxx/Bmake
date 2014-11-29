#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		cygwin.mk
# Brief		MS win gcc support in cygwin.
#

ifeq ($(EXTMF_SEG),V)

ifneq ($(shell $(CC) -print-prog-name=cc1 | sed -ne '/^[A-Za-z]:\//p'),)
CC	= $(tooldir)cygwin/gcc/gcc host=$(host)
AR	= $(tooldir)cygwin/gcc/ar host=$(host)
OBJDUMP = $(tooldir)cygwin/gcc/objdump host=$(host)
OBJCOPY = $(tooldir)cygwin/gcc/objcopy host=$(host)
STRIP	= $(tooldir)cygwin/gcc/strip host=$(host)
GDB	= $(tooldir)cygwin/gdb/gdb host=$(host)
endif

endif	# ifeq ($(EXTMF_SEG),V)
