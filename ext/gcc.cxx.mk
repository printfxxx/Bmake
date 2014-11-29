#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		gcc.cxx.mk
# Brief		Rules for compile C++ files with gcc.
#

ifeq ($(EXTMF_SEG),V)

export CXXFLAGS

endif	# ifeq ($(EXTMF_SEG),V)

ifeq ($(EXTR_SEG),V)

CXXSRC = $(wildcard $(OBJ:%$(SFX_O)=%$(SFX_CXX)))
CXXOBJ = $(CXXSRC:%$(SFX_CXX)=%$(SFX_O))

CXXFLAGS += $(CXXFLAGS-y)
cxxflags  = $(cflags) $(CXXFLAGS) $(cxxflags-y)

endif	# ifeq ($(EXTR_SEG),V)

ifeq ($(EXTR_SEG),R)

ifeq ($(filter $(NOINIT_TARGET),$(MAKECMDGOALS)),)
$(foreach f,$(CXXSRC),$(eval $(call rule_cc_dep,$(f),$(f:%$(SFX_CXX)=$(bdir)%$(SFX_O)),$$(cxxflags))))
endif

$(CXXOBJ:%=$(bdir)%$(SFX_D)): %$(SFX_D): %$(SFX_CMD)

$(CXXOBJ:%=$(bdir)%$(SFX_CMD)): $(bdir)%$(SFX_CMD): FORCE
	$(call cmd_change_chk,$(call do_cc,$(*:%$(SFX_O)=%$(SFX_CXX)),$(bdir)$*,$(cxxflags)),$@)

$(CXXOBJ:%=$(bdir)%): $(bdir)%: $(bdir)%$(SFX_D)
	$(call msg,CC,$(*:%$(SFX_O)=%$(SFX_CXX)))
	$(call do_cc,$(*:%$(SFX_O)=%$(SFX_CXX)),$@,$(cxxflags))

endif	# ifeq ($(EXTR_SEG),V)
