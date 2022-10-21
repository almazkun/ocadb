build:
	docker build \
		-t ocadb:latest \
		--build-arg LD_LIBRARY_PATH=/instantclient_21_8 \
		--build-arg ORACLE_INSTANT_DRIVER_ZIP=instantclient-basic-linux.x64-21.8.0.0.0dbru.zip \
		--build-arg ORACLE_WALLET_ZIP=Wallet.zip \
		.

run: 
	docker run \
		--rm \
		--env-file .env \
		ocadb