set :stage, :asc1
set :rails_env, 'production'
server 'asc1.curationexperts.com', user: 'deploy', roles: [:web, :app, :db]
