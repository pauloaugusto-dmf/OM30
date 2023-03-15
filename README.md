# OM30

CRUD of citizens

<table>
    <tr>
        <td>Ruby</td>
        <td>3.1.3</td>
    </tr>
    <tr>
        <td>Ruby on Rails</td>
        <td>6.1.4</td>
    </tr>
    <tr>
        <td>Postgresql</td>
        <td>15</td>
    </tr>
</table>

<br>

## Settings to run the project

### Without using Docker

```bash
git clone https://github.com/pauloaugusto-dmf/OM30.git

cd OM30

bundle install

rails db:create db:migrate

rails s
```

### Using Docker


```bash
cp .env.template .env

docker-compose build

docker-compose up -d

docker-compose exec web rails db:create

docker-compose exec web rails db:migrate
```

## Tests

### Without using Docker

```bash
rspec
```

### Using Docker

```bash
docker-compose run --rm web rspec
```

### Open the browser at the address `http://0.0.0.0:3000` 


