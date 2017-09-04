default['postgresql']['config']['listen_addresses'] = '*'
default['postgresql']['pg_hba'] = [
  {
    :comment => '# Allow Incoming Connections',
    :type => 'host', 
    :db => 'all', 
    :user => 'all', 
    :addr => '0.0.0.0/0', 
    :method => 'trust'
  }
]
default['postgresql']['password']['postgres'] = "password"
