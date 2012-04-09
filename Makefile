.PHONY: \
	crank \
	clean \
	rsync

BUILD=build
SOURCE=tt

default: crank

clean:
	rm -fr $(BUILD)

crank: clean
	mkdir -p $(BUILD)/ || true > /dev/null 2>&1
	perl crank --sourcepath=$(SOURCE) --buildpath=$(BUILD)
	cp -R static/* $(BUILD)/
	find $(BUILD) -name "*~" -exec rm -v -f {} \; # Remove any backup leftovers

test: crank
	prove t/html.t

# This is only useful for Andy
rsync:
	rsync -azu -e ssh --delete --verbose \
		$(BUILD)/ andy@huggy.petdance.com:/srv/btg/
