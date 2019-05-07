build:
	docker build --file=./Dockerfile --tag=cherre-project .

run: build
	docker run -d -p 8787:8787 \
		-e DISABLE_AUTH=true \
		--name='cherre-project-table' \
		-v ${HOME}:/home/rstudio/hostdata \
		cherre-project;

	sleep 3;
	open http://localhost:8787;

stop:
	docker stop cherre-project-table

start:
	docker start cherre-project-table

remove: stop
	docker rm cherre-project-table


