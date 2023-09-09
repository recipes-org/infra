# Infrastructure

- 1 container registry
- 2 database clusters
- 2 service clusters, "apps"
- `colunch-dev` and `colunch-prod`

## DBs

- Test a schema update out locally.
- Create a PR with changes to `dev/do/db.hcl`.
    - Create the migration.
    - Apply dry-run.
    - On merge ...
- Create a PR containing the migration files.
    - Apply dry-run.
    - On merge, apply to dev and ...
- Create a PR with the changes to `live/do/db.hcl`.
- ... and as above but in live.

Local db

```shell
export RECIPES_DB_URL="postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable"
```

Create a migration

```shell
atlas migrate diff init \
      --dir "file://dev/do/migrations/" \
      --to  "file://dev/do/db.hcl" \
      --dev-url $RECIPES_DB_URL
```

Apply migrations

```shell
atlas migrate apply \
      --dir "file://dev/do/migrations/" \
      --url "postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable" \
      --dry-run
```
