export DB_URL="postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable"
export MIGRATIONS_DIR="file://dev/do/migrations"

docker-up:
	docker compose up --detach --wait
	sleep 2

up: docker-up migrate-apply migrate-status

down:
	docker compose down --volumes

migrate-status:
	atlas migrate status \
      --dir $(MIGRATIONS_DIR) \
      --url $(DB_URL) \
	  --revisions-schema "public"

migrate-create:
	atlas migrate diff init \
      --dir $(MIGRATIONS_DIR) \
      --to  "file://dev/do/db.hcl" \
      --dev-url $(DB_URL)

migrate-apply:
	atlas migrate apply \
      --dir $(MIGRATIONS_DIR) \
      --url $(DB_URL) \
      --revisions-schema "public"
