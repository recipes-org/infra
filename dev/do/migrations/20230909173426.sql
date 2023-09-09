-- Add new schema named "recipes"
CREATE SCHEMA "recipes";
-- Create "recipes" table
CREATE TABLE "recipes"."recipes" ("id" character varying(36) NOT NULL, "name" character varying(100) NOT NULL, PRIMARY KEY ("id"));
-- Create "requirements" table
CREATE TABLE "recipes"."requirements" ("recipe_id" character varying(36) NOT NULL, "ingredient" character varying(36) NOT NULL, "measurement" character varying(36) NOT NULL, "quantity" real NOT NULL, PRIMARY KEY ("recipe_id", "ingredient"), CONSTRAINT "recipe_fk" FOREIGN KEY ("recipe_id") REFERENCES "recipes"."recipes" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
