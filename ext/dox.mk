#
# Copyright (C) 2011
#
# Brick Yang <printfxxx@gmail.com>
#
# This program is free software. You can redistribute it and/or
# modify it as you like.
#

##
# File		dox.mk
# Brief		Doxygen support.
#

ifeq ($(EXTMF_SEG),V)

# Doxygen command
DOX = doxygen

doxcfg += $(doxcfg-y)

endif	# ifeq ($(EXTMF_SEG),V)

ifeq ($(EXTMF_SEG),R)

dox: $(doxcfg)
	$(call msg,DOX,$^)
	cat $^ | $(DOX) -

help::
	echo ''
	echo 'DOCUMENT'
	echo -e '$(GREEN)dox$(NORMAL)'
	echo -e '\tGenerate document with doxygen'

.PHONY: dox

endif	# ifeq ($(EXTMF_SEG),R)
