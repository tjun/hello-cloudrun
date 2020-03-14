_VERSION := $(shell date +"%Y%m%d%H%M")
_SERVICE := "hello-run"
_IMAGE := ${_SERVICE}-${_VERSION}

.PHONY: deploy
deploy: 
	@gcloud builds submit . \
	--config cloudbuild.yaml \
	--project $(PROJECT_ID) \
	--substitutions "_SERVICE=$(_SERVICE),_IMAGE=$(_IMAGE)"
