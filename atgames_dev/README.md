# AtGames Development docker env

## setting docker alias
vim ~/.your_shell_rc
```
alias dk='docker'
alias dkc='docker-compose'
alias dke='docker exec -it '
```

## How to build image
e.g.
```
cd 0.1
./build
```

## Start env
setting
```
vim setting
```

start
```
./up
```

### Enter console
```
./go
```

### Enter with ssh
connect to server
```
ssh ubuntu@0.0.0.0 -p 2222
```

### Start development
Install gems
```
cd /work/project_name/
gem install bundle
bundle install
```

Database
```
# vim database.yml
# host: db
rake db:create
rake db:schema:load
rake d2d:db:setting
rake d2d:seed:dev
```

refresh prices
```
rails c
> Price.refresh_prices
```

start rails
```
rails s
```
