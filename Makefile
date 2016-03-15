COREBUILD_NAME = rhel7-corebuild
MW_COREBUILD_NAME = corebuild-php56-httpd24
APPLICATION_NAME = php56-httpd24-wordpress
USERNAME = example
VERSION = 1.0.0

all: build

build:
	docker build -t $(USERNAME)/$(COREBUILD_NAME):$(VERSION) $(COREBUILD_NAME)/
	docker build -t $(USERNAME)/$(MW_COREBUILD_NAME):$(VERSION) $(MW_COREBUILD_NAME)
	docker build -t $(USERNAME)/$(APPLICATION_NAME):$(VERSION) $(APPLICATION_NAME)/

test:
	env NAME=$(NAME) VERSION=$(VERSION) ./test.sh

tag_latest:
	docker tag -f $(USERNAME)/$(COREBUILD_NAME):$(VERSION) $(USERNAME)/$(COREBUILD_NAME):latest
	docker tag -f $(USERNAME)/$(MW_COREBUILD_NAME):$(VERSION) $(USERNAME)/$(MW_COREBUILD_NAME):latest
	docker tag -f $(USERNAME)/$(APPLICATION_NAME):$(VERSION) $(USERNAME)/$(APPLICATION_NAME):latest

release: test tag_latest
	@if ! docker images $(USERNAME)/$(COREBUILD_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(COREBUILD_NAME)
	@if ! docker images $(USERNAME)/$(MW_COREBUILD_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(MW_COREBUILD_NAME)
	@if ! docker images $(USERNAME)/$(APPLICATION_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then make build; false; fi
	docker push $(USERNAME)/$(APPLICATION_NAME)
