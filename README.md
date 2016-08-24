# AtGames Development docker env

## setting docker alias
vim ~/.your_shell_rc
```
alias dk='docker'
alias dkc='docker-compose'
alias dke='docker exec -it '
```

## How to build image
```
docker build -t atgames/dev:0.1 atgames_dev
```

## Start env
### Direct start
```
docker rm atgdev; docker run -it --name atgdev atgames/dev bash
```

### Start with ssh
start
```
dkc up -d
```

connect to server
```
ssh ubuntu@0.0.0.0 -p 2222
```

### Start development
Init
```
# /work/docker-setting/.gitconfig
# /work/docker-setting/id_rsa
/work/docker-setting/dev-go
```

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
