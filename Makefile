BIZ := b
ENV ?= dev

build:
	docker build -t demo-biz-$(BIZ):latest .
scan: build
	sysdig-cli-scanner --apiurl https://app.au1.sysdig.com docker://demo-biz-$(BIZ):latest
deploy: build
	kubectl --context colima apply -k k8s/overlays/$(ENV)
