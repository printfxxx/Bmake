#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		gcc.c.mk
# Brief		Rules for compile C files with gcc.
#

ifeq ($(EXTMF_SEG),V)

export CCFLAGS

endif	# ifeq ($(EXTMF_SEG),V)

ifeq ($(EXTR_SEG),V)

CSRC = $(wildcard $(OBJ:%$(SFX_O)=%$(SFX_C)))
COBJ = $(CSRC:%$(SFX_C)=%$(SFX_O))

CCFLAGS += $(CCFLAGS-y)
ccflags  = $(cflags) $(CCFLAGS) $(ccflags-y)

endif	# ifeq ($(EXTR_SEG),V)

ifeq ($(EXTR_SEG),R)

ifeq ($(filter $(NOINIT_TARGET),$(MAKECMDGOALS)),)
$(foreach f,$(CSRC),$(eval $(call rule_cc_dep,$(f),$(f:%$(SFX_C)=$(bdir)%$(SFX_O)),$$(ccflags))))
endif

$(COBJ:%=$(bdir)%$(SFX_D)): %$(SFX_D): %$(SFX_CMD)

$(COBJ:%=$(bdir)%$(SFX_CMD)): $(bdir)%$(SFX_CMD): FORCE
	$(call cmd_change_chk,$(call do_cc,$(*:%$(SFX_O)=%$(SFX_C)),$(bdir)$*,$(ccflags)),$@)

$(COBJ:%=$(bdir)%): $(bdir)%: $(bdir)%$(SFX_D)
	$(call msg,CC,$(*:%$(SFX_O)=%$(SFX_C)))
	$(call do_cc,$(*:%$(SFX_O)=%$(SFX_C)),$@,$(ccflags))

endif	# ifeq ($(EXTR_SEG),V)
