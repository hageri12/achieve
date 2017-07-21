server '52.199.95.104', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yuhei/.ssh/id_rsa'
