# OUTFILE
# BACKEND_CONFIG

ROOT_DIR ?= ./
BACKEND_CONFIG := $(if $(BACKEND_CONFIG),-backend-config=$(shell pwd)/$(BACKEND_CONFIG),)
OUT_FILE := $(if $(OUT_FILE),$(shell pwd)/$(OUT_FILE),)

TF_COMMAND := $(if $(TF_COMMAND),$(TF_COMMAND),terraform)

test:
	echo $(BACKEND_CONFIG)

fmt:
	$(TF_COMMAND) fmt

fmt-test:
	$(TF_COMMAND) fmt -check

init:
	cd $(ROOT_DIR) && $(TF_COMMAND) init $(if $(TF_IN_AUTOMATION),-input=false,) $(BACKEND_CONFIG)

init-test:
	cd $(ROOT_DIR) && $(TF_COMMAND) validate

plan:
	cd $(ROOT_DIR) && $(TF_COMMAND) plan $(if $(TF_IN_AUTOMATION),-input=false,) $(if $(OUT_FILE),-out=$(OUT_FILE),) 

plan-test:
	echo "TODO: policy verification"

apply:
	cd $(ROOT_DIR) && $(TF_COMMAND) apply $(if $(TF_IN_AUTOMATION),-input=false -auto-approve,) $(OUT_FILE)

apply-test:
	cd $(ROOT_DIR) && wget --retry-connrefused --timeout=5 --tries=240 --waitretry=1 -qO- $$(terraform output http_endpoint)

destroy:
	cd $(ROOT_DIR) && $(TF_COMMAND) destroy $(if $(TF_IN_AUTOMATION),-input=false -auto-approve,)


clean:
ifneq ($(OUT_FILE),)
	rm $(OUT_FILE) || true
endif