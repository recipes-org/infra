-- Add new schema named "ingredients"
CREATE SCHEMA "ingredients";
-- Create "ingredients" table
CREATE TABLE "ingredients"."ingredients" ("id" character varying(36) NOT NULL, "name" character varying(36) NOT NULL, PRIMARY KEY ("id"));
-- Create index "idx_name" to table: "ingredients"
CREATE UNIQUE INDEX "idx_name" ON "ingredients"."ingredients" ("name");
