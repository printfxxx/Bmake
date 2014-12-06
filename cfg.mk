#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		cfg.mk
# Brief		Configuration for project.
#

# === Project Configuration ===
# Project name
project = Bmake

# === Objs, subdirs, targets ===
obj = src/ autoconf.h
cflags_autoconf.h  = -DVAL1=$(CONFIG_VAL1)
cflags_autoconf.h += -DSTR1=$(call escape,$(CONFIG_STR1))
# === Output Target ===
out = $(project)$(SFX_EXE)
$(project)$(SFX_EXE) = src/

# === Flags For Compiler & Linker ===
# Flags to give to C compiler
CFLAGS = -I$(gendir)
# Flags to give to assembler
ASFLAGS =
# Flags to give to C++ compiler
CXXFLAGS =
# Flags to give to linker
LDFLAGS =

# === Mconf Options ===
# Mconf config file
mcfg = Kconfig/Kconfig

# === Debugger Options ===
# GDB command scripts
gdbrc =

# === Document Options ===
# Doxygen config files
doxcfg =
