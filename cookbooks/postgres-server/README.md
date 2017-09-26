# postgres-server-cookbook
A chef cookbook used to create a generic fully open database server. Not to be used in production as security is disabled

## Usage

metadata.rb
```
depends 'postgres-server', git: 'git@github.com:spartaglobal/postgresql-server-cookbook.git'
```

default.rb
```
include_recipe 'postgres-server::default'
```

