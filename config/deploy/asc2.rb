set :stage, :asc2
set :rails_env, 'production'
server 'asc2.curationexperts.com', user: 'deploy', roles: [:web, :app, :db]
