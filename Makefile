.PHONY: run bin
.EXPORT_ALL_VARIABLES:

GO111MODULE ?= on
DIECAST_BIN ?= bin/diecast-$(shell uname | tr '[:upper:]' '[:lower:]')-amd64

all: run

run:
	$(DIECAST_BIN) -L debug -a :28419

bin: $(DIECAST_BIN)

$(DIECAST_BIN):
	go build -o $(@) github.com/ghetzel/diecast/cmd/diecast

pass:
	htpasswd -nBC 10 $(USER)