## build flow-registry
build:
	docker build --build-arg user=$(user) --build-arg token=$(token) -t flow-registry .
	

## clean nifi-registry container and flow-registry
clean:
	docker stop nifi-registry || true
	docker rm nifi-registry || true
	docker image rm flow-registry || true


## run nifi-registry container
run: clean build
	docker run --name nifi-registry \
	-p 18080:18080 \
	flow-registry:latest

