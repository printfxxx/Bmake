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
obj = src1/ src2/
# === Output Target ===
out = demo1$(SFX_EXE) demo2$(SFX_EXE)
demo1$(SFX_EXE) = src1/
demo2$(SFX_EXE) = src2/

# === Flags For Compiler & Linker ===
# Flags to give to C compiler
CFLAGS = -g -Wall -Wextra
# Flags to give to assembler
ASFLAGS =
# Flags to give to C++ compiler
CXXFLAGS =
# Flags to give to linker
LDFLAGS =

# === Mconf Options ===
# Mconf config file
mcfg =

# === Debugger Options ===
# GDB command scripts
gdbrc =

# === Document Options ===
# Doxygen config files
doxcfg =
