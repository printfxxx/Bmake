#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		gcc.asm.mk
# Brief		Rules for compile ASM files with gcc.
#

ifeq ($(EXTMF_SEG),V)

export ASFLAGS

endif	# ifeq ($(EXTMF_SEG),V)

ifeq ($(EXTR_SEG),V)

ASRC = $(wildcard $(OBJ:%$(SFX_O)=%$(SFX_ASM)))
AOBJ = $(ASRC:%$(SFX_ASM)=%$(SFX_O))

ASFLAGS += $(ASFLAGS-y)
asflags  = $(cflags) $(ASFLAGS) $(asflags-y)

endif	# ifeq ($(EXTR_SEG),V)

ifeq ($(EXTR_SEG),R)

ifeq ($(filter $(NOINIT_TARGET),$(MAKECMDGOALS)),)
$(foreach f,$(ASRC),$(eval $(call rule_cc_dep,$(f),$(f:%$(SFX_ASM)=$(bdir)%$(SFX_O)),$$(asflags))))
endif

$(AOBJ:%=$(bdir)%$(SFX_D)): %$(SFX_D): %$(SFX_CMD)

$(AOBJ:%=$(bdir)%$(SFX_CMD)): $(bdir)%$(SFX_CMD): FORCE
	$(call cmd_change_chk,$(call do_cc,$(*:%$(SFX_O)=%$(SFX_ASM)),$(bdir)$*,$(asflags)),$@)

$(AOBJ:%=$(bdir)%): $(bdir)%: $(bdir)%$(SFX_D)
	$(call msg,CC,$(*:%$(SFX_O)=%$(SFX_ASM)))
	$(call do_cc,$(*:%$(SFX_O)=%$(SFX_ASM)),$@,$(asflags))

endif	# ifeq ($(EXTR_SEG),V)
