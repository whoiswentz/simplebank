postgres:
	docker-compose up -d

createdb:
	docker exec -it simplebank_postgres-development_1 createdb --username=postgres --owner=postgres simple_bank

migratecreate:
	migrate create -ext sql -dir db/migration -seq $(NAME)

dropdb:
	docker exec -it simplebank_postgres-development_1 dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go simplebank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server mock migratecreate