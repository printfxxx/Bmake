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
obj = src/
# === Output Target ===
out = $(project)$(SFX_EXE)
$(project)$(SFX_EXE) = src/

# === Flags For Compiler & Linker ===
# Flags to give to C compiler
CFLAGS = -g -Wall -Wextra
# Flags to give to assembler
ASFLAGS =
# Flags to give to C++ compiler
CXXFLAGS =
# Flags to give to linker
LDFLAGS = -lstdc++

# === Mconf Options ===
# Mconf config file
mcfg =

# === Debugger Options ===
# GDB command scripts
gdbrc = gdb/exec.gdb

# === Document Options ===
# Doxygen config files
doxcfg = dox/dox.cfg
