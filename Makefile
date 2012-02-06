.PHONY: \
	rsync

BUILD=.

# This is only useful for Andy
rsync:
	rsync -azu -e ssh --delete --verbose \
		--exclude=.git \
		--exclude=Makefile \
		--exclude=README \
		--exclude=*~ \
		$(BUILD)/ andy@huggy.petdance.com:/srv/btg
