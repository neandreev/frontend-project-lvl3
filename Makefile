current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
port ?= 4200

install:
	npm install

ci:
	npm ci

develop:
	npm run develop

build:
	npm run build

docker-build:
	docker build -t rss-agregator .

docker-run:
	docker run -d -p $(port):4200 --rm --name rss-agregator rss-agregator

docker-run-dev:
	docker run -d -p $(port):4200 -v "$(current_dir):/app" -v /app/node_modules --rm --name rss-agregator rss-agregator

docker-stop:
	docker stop rss-agregator
