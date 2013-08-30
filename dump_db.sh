# this is useful if we need to "attach" data to existing db
# direct data dump into YAML format ( gem 'yaml_db' )
rake db:data:dump

# load back into db
RAILS_ENV=development rake db:data:load 

# load schema nd data back
rake db:schema:dump         # Create a db/schema.rb file that can be portably used against any DB supported by AR
rake db:schema:load         # Load a schema.rb file into the database
rake db:load                # Load schema and data from db/schema.rb and db/data.yml


