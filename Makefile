run:
	go run main.go
db-start:
	docker run -d -p 5432:5432 -v `$(PWD)/db`:/var/lib/postgresql/data \
	--name mast-sample-db -e POSTGRES_PASSWORD=webapp postgres
db-init:
	psql -h localhost -U postgres -c "create database mast"
	psql -h localhost -U postgres -c "create database pagila"
	psql -h localhost -d pagila -U postgres -f /Users/kbrendle/projects/sample_data/pagila/pagila-schema.sql
	psql -h localhost -d pagila -U postgres -f /Users/kbrendle/projects/sample_data/pagila/pagila-data.sql
db-psql:
	psql -h localhost -U postgres
