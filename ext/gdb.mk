#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		gdb.mk
# Brief		GDB debugger support.
#

ifeq ($(EXTMF_SEG),V)

# GDB commands
GDB  = $(host)gdb
CGDB = cgdb
DDD  = ddd

gdbrc += $(gdbrc-y)

endif	# ifeq ($(EXTR_SEG),V)

ifeq ($(EXTMF_SEG),R)

gdb: $(gdbrc)
	$(call msg,DBG,$^)
	$(GDB) -d $(topdir) $(^:%= -x %)

cgdb: $(gdbrc)
	$(call msg,DBG,$^)
	$(CGDB) -d $(GDB) -- -d $(topdir) $(^:%= -x %)

ddd: $(gdbrc)
	$(call msg,DBG,$^)
	$(DDD) --debugger $(GDB) -d $(topdir) $(^:%= -x %)

help::
	echo ''
	echo 'DEBUG'
	echo -e '$(GREEN)gdb$(NORMAL)'
	echo -e '\tDebug the target with gdb'
	echo -e '$(GREEN)cgdb$(NORMAL)'
	echo -e '\tDebug the target with cgdb'
	echo -e '$(GREEN)ddd$(NORMAL)'
	echo -e '\tDebug the target with ddd'

.PHONY: gdb cgdb ddd

endif	# ifeq ($(EXTR_SEG),R)
