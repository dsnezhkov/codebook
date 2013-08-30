# this is useful if we need to "attach" data to existing db
# direct data dump into YAML format
rake db:data:dump

# load back into db
RAILS_ENV=development rake db:data:load 

# load schema from schema.rb
# rake db:schema:load


