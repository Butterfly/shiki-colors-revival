# Copyright (c) 2014-2015 Kylie McClain <somasis@exherbo.org>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

DESTDIR		?= /
PREFIX		?= /usr

BASE		=	numix-themes
COLORS		=	Brave Human Illustrious Noble Wine Wise

Shiki-Brave_selected			= 729fcf
Shiki-Human_selected			= faa546
Shiki-Illustrious_selected		= f9a1ac
Shiki-Noble_selected			= ad7fa8
Shiki-Wine_selected				= df5757
Shiki-Wise_selected				= 97bf60

# xfwm4 is provided by shiki-colors-xfwm, metacity/openbox are not themed
# xfce-notify is not yet themed as well

all: prepare generate install

prepare:
	[[ "$(no_git)" ]] || git submodule update
	cd $(BASE) && rm -rf xfwm4 metacity-1 openbox-3 xfce-notify-4.0 index.theme

Shiki-%:
	@echo "Generating $@ from $(BASE)..."
	cp -r $(BASE) $@
	sed -i $@/gtk-2.0/gtkrc $@/gtk-3.0/gtk.css	\
		-e 's/#d64937/#$($@_selected)/g'

generate:
	$(foreach COLOR,$(COLORS),make Shiki-$(COLOR);)

clean:
	rm -rf $(BASE)
	$(foreach COLOR,$(COLORS),rm -rf Shiki-$(COLOR)/;)

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/themes
	mkdir -p $(DESTDIR)$(PREFIX)/share/plank/themes
	cp -r Shiki-Colors-* $(DESTDIR)$(PREFIX)/share/themes
	cp -r plank/* $(DESTDIR)$(PREFIX)/share/plank/themes
	$(foreach COLOR,$(COLORS),cp -r Shiki-$(COLOR) $(DESTDIR)$(PREFIX)/share/themes/Shiki-$(COLOR);)
