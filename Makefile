DOCKER_TAG = 0.0.6

docker_build:
		@echo "building and pushing docker image..."
		docker build -t local/crypto-fabianbrash-com-serve:$(DOCKER_TAG) .
		sleep 6
		docker tag local/crypto-fabianbrash-com-serve:$(DOCKER_TAG) docker.io/fabianbrash/cryptoapp-serve:$(DOCKER_TAG)
		sleep 3
		docker push docker.io/fabianbrash/cryptoapp-serve:$(DOCKER_TAG)
		sleep 6
		docker system prune -f
