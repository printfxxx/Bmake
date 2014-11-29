#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		kmod.mk
# Brief		Linux kernel module build support
#

ifeq ($(EXTR_SEG),V)

define rule_kmod
$(PFX_KM)$(1) ?= $(1)$(SFX_KO)
$(OLST): $$($(PFX_KM)$(1):%=$(optdir)%)
$$($(PFX_KM)$(1):%=$(1)/$(bdir)%): build-$(1)
$$($(PFX_KM)$(1):%=$(optdir)%): $(optdir)%: $(1)/$(bdir)%
	cp $$< $$@
endef

PFX_KM = km-
SFX_KO = .ko

KMOD = $(patsubst $(PFX_KM)%,%,$(filter $(PFX_KM)%,$(obj)))

CROSS_COMPILE ?= $(host)

kdir ?= /lib/modules/$(shell uname -r)/build

endif	# ifeq ($(EXTR_SEG),V)

ifeq ($(EXTR_SEG),R)

ifeq ($(filter $(NOINIT_TARGET),$(MAKECMDGOALS)),)
$(foreach f,$(KMOD),$(eval $(call rule_kmod,$(f))))
endif

$(KMOD:%=%/$(bdir)Kbuild): %/$(bdir)Kbuild: %/Kbuild
	mkdir -p $(@D)
	ln -sf `readlink -m $<` $@

$(KMOD:%=build-%): build-%: %/$(bdir)Kbuild FORCE
	$(call msg,KBUILD,$*)
	unset host MAKEFLAGS MAKEFILES CFLAGS ASFLAGS && CROSS_COMPILE=$(CROSS_COMPILE) \
	$(MAKE) -C $(kdir) M=`readlink -m $(@:build-%=%)/$(bdir)` V=$(V) modules

endif	# ifeq ($(EXTR_SEG),R)
