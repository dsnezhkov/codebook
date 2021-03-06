#!/bin/bash 

# install dependencies for codebook app (listed in Gemfile)
bundle install

# Create schema in database (db/development.sqlite3)
rake db:schema:load

# seed priorities and states
rake db:seed

# Search-related tasks
rails generate sunspot_rails:install

# start search (you need to make sure this search is always up when you start rails)
sunspot-solr start -p 8982 -d solr/data/development -s solr --pid-dir=tmp/pids -l FINE --log-file=log/sunspot-solr-development.log

# This reindexes existing models in database. This can be used any time. if you have no "yes" utility.
# then you just need to run the rake command and it will ask you to confirmm, say yes
yes | rake sunspot:reindex

# stop search 
sunspot-solr stop -p 8982 
