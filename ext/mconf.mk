#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		mconf.mk
# Brief		Menu config support.
#

ifeq ($(EXTMF_SEG),V)

MCONF_CFG  = .config
MAKEFILES += $(topdir)$(MCONF_CFG)

NOINIT_TARGET += mconf

sinclude $(MCONF_CFG)

endif	# ifeq ($(EXTMF_SEG),V)

ifeq ($(EXTMF_SEG),R)

ifeq ($(filter $(NOINIT_TARGET),$(MAKECMDGOALS)),)
ifeq ($(if $(mcfg),$(wildcard $(MCONF_CFG)),x),)
$(error Please run configurator ("make mconf") first!)
endif
endif

mconf:
	mconf $(mcfg)

distclean::
	$(call msg,RM,mconf configuration)
	$(RM) $(MCONF_CFG){,.old}

help::
	echo ''
	echo 'CONFIGURATION'
	echo -e '$(GREEN)mconf$(NORMAL)'
	echo -e '\tRun menu-based configurator'

.PHONY: mconf

endif	# ifeq ($(EXTMF_SEG),R)
