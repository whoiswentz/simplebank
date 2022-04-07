postgres:
	docker-compose up -d

createdb:
	docker exec -it simplebank_postgres-development_1 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it simplebank_postgres-development_1 dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc