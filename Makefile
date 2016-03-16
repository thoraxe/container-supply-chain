COREBUILD_NAME = corebuild
MW_COREBUILD_NAME = httpd-php
APPLICATION_BUILD_NAME = wordpress
USERNAME = example
VERSION = 1.0.0
REGISTRY = 10.0.1.1

all: build

build: $(COREBUILD_NAME).o $(MW_COREBUILD_NAME).o $(APPLICATION_BUILD_NAME).o

$(COREBUILD_NAME).o: $(COREBUILD_NAME)/*
	docker build -t $(COREBUILD_NAME) $(COREBUILD_NAME)/
	@if docker images $(COREBUILD_NAME) | grep $(COREBUILD_NAME); then touch $(COREBUILD_NAME).o; fi

$(MW_COREBUILD_NAME).o: $(MW_COREBUILD_NAME)/* $(COREBUILD_NAME).o
	docker build -t $(MW_COREBUILD_NAME) $(MW_COREBUILD_NAME)/
	@if docker images $(MW_COREBUILD_NAME) | grep $(MW_COREBUILD_NAME); then touch $(MW_COREBUILD_NAME).o; fi

$(APPLICATION_BUILD_NAME).o: $(APPLICATION_BUILD_NAME)/* $(MW_COREBUILD_NAME).o
	docker build -t $(APPLICATION_BUILD_NAME) $(APPLICATION_BUILD_NAME)/
	@if docker images $(APPLICATION_BUILD_NAME) | grep $(APPLICATION_BUILD_NAME); then touch $(APPLICATION_BUILD_NAME).o; fi

test:
	env NAME=$(NAME) VERSION=$(VERSION) ./test.sh

tag_production:
	docker tag -f $(COREBUILD_NAME):latest $(USERNAME)/$(COREBUILD_NAME):production
	docker tag -f $(MW_COREBUILD_NAME):latest $(USERNAME)/$(MW_COREBUILD_NAME):production
	docker tag -f $(APPLICATION_BUILD_NAME):latest $(USERNAME)/$(APPLICATION_BUILD_NAME):production

release: test tag_production
	@if ! docker images $(USERNAME)/$(COREBUILD_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(COREBUILD_NAME)
	@if ! docker images $(USERNAME)/$(MW_COREBUILD_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(MW_COREBUILD_NAME)
	@if ! docker images $(USERNAME)/$(APPLICATION_BUILD_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(APPLICATION_BUILD_NAME)
