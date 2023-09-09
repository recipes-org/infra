schema "recipes" {}

table "recipes" {
  schema = schema.recipes
  column "id" {
    null = false
    type = varchar(36)
  }
  column "name" {
    null = false
    type = varchar(100)
  }
  primary_key {
    columns = [column.id]
  }
}

table "requirements" {
  schema = schema.recipes
  column "recipe_id" {
    null = false
    type = varchar(36)
  }
  column "ingredient" {
    null = false
    type = varchar(36)
  }
  column "measurement" {
    null = false
    type = varchar(36)
  }
  column "quantity" {
    null = false
    type = real
  }
  primary_key {
    columns = [column.recipe_id, column.ingredient]
  }
  foreign_key "recipe_fk" {
    columns = [column.recipe_id]
    ref_columns = [table.recipes.column.id]
  }
}
