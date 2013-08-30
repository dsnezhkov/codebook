# Method 1: direct data dump into YAML format
rake db:data:dump
# Method 2: Generate seed file 
rake db:seed:dump RAILS4=true WITHOUT_PROTECTION=false
# load
# RAILS_ENV=production rake db:data:load 

# load schema from schema.rb
rake db:schema:load


