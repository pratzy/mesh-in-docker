run:
	docker build -t prateek/ubuntu:local .
	docker run --rm --name mymesh -it -p 4646:4646 -p 8500:8500 -v /var/run/docker.sock:/var/run/docker.sock -v $(PWD)/..:/app prateek/ubuntu:local

attach:
	docker exec -it mymesh '/bin/bash'

