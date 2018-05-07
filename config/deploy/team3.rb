set :stage, :team3
set :rails_env, 'production'
server 'asc3.curationexperts.com', user: 'deploy', roles: [:web, :app, :db]
