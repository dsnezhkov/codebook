# clone the remote repository to local
git clone https://github.com/dsnezhkov/codebook.git
cd codebook 

# install dependencies for codebook app (listed in Gemfile)
$ bundle install

# Create schema in database (db/development.sqlite3)
$ rake db:schema:load

# seed priorities and states
rake db:seed

# Search-related tasks
rails generate sunspot_rails:install

# start search (you need to make sure this search is always up when you start rails)
sunspot-solr start -p 8982 -d solr/data/development -s solr --pid-dir=tmp/pids -l FINE --log-file=log/sunspot-solr-development.log

# This reindexes existing models in database. This can be used any time
rake sunspot:reindex