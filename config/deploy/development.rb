server "qb-clt-1015", roles: [:app, :web, :db], :primary => true
set :deploy_to, '/home/qburst/my_capistrano/shoppingcart'
set :branch, 'master'
set :user, 'qburst'
set :use_sudo, true
