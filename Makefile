.PHONY: \
	crank \
	clean \
	rsync

BUILD=build
SOURCE=s

default: crank

clean:
	rm -fr $(BUILD)
	rm -fr $(SOURCE)/*.tt2

crank: clean
	mkdir -p $(BUILD)/ || true > /dev/null 2>&1
	cp s/* $(BUILD)
	cp static/* $(BUILD)

# This is only useful for Andy
rsync:
	rsync -azu -e ssh --delete --verbose \
		$(BUILD)/ andy@huggy.petdance.com:/srv/btg
