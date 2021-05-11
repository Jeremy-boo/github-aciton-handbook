PROJECT_NAME := "jeremy-boo/github/hello"
PKG := "$(PROJECT_NAME)"
PKG_LIST := $(shell go list $(PKG)/... | grep -v /vendor/)
GO_LIST := $(shell find . -name '*.go' | grep -v /vendor | grep -v _test.go)
BUILDPATH=$(CURDIR)

GOTAGS=$(if $(GOBUILDTAGS),-tags "$(GOBUILDTAGS)",)
GOLDFLAGS=$(if $(GOBUILDLDFLAGS),--ldflags "-w -s $(GOBUILDLDFLAGS)",)
CORE_LDFLAGS=-X $(PKG_PATH)/version.GitCommit=$(GITCOMMIT) -X $(PKG_PATH)/version.ReleaseVersion=$(RELEASEVERSION)
ifneq ($(GOBUILDLDFLAGS),)
	CORE_LDFLAGS += $(GOBUILDLDFLAGS)
endif

go:
	@echo $(GOTAGS)
	@echo $(GOLDFLAGS)
	@echo $(CORE_LDFLAGS)

.PHONY: all dep lint vet test 

all: build

dep: 
	@go mod download

lint:
	@echo $(BUILDPATH)
	@golint -set_exit_status ${PKG_LIST}

build: dep
	@go build -o build/main ${PKG}

