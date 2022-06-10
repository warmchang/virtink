all: test

generate:
	docker build -f hack/Dockerfile . | tee /dev/tty | tail -n1 | cut -d' ' -f3 | xargs -I{} \
		docker run --rm -v $$PWD:/go/src/github.com/smartxworks/kubrid -w /go/src/github.com/smartxworks/kubrid {} ./hack/generate.sh

fmt:
	go fmt ./...

test:
	go test ./... -coverprofile cover.out