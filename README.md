<p align="center">
  <img src="https://dimensa.com/wp-content/uploads/2021/09/Logo-1.png" width="200" title="hover text">
 
</p>
<h1>Dimensa Movies</h1>
<p>Essa é uma API RESTful desenvolvida com Ruby on Rails, usando a estrutura Rails API para criar um serviço para gerenciar    filmes. A API permite importar filmes de um arquivo CSV, listar filmes, filtrar filmes por diversos critérios e ordenar os filmes pelo ano de lançamento..</p>    

<h2> 🛠 Dependências</h2>

<p>Ruby 3.1.3</p>
<p>Rails 7.0.4.3</p>
<p>SQlite3</p>


<h3> Instalando o Ruby</h3>
Recomenda-se o uso do gerenciador de versões Ruby RVM (Ruby Version Manager) para instalar e gerenciar várias versões do Ruby. Siga as etapas abaixo para instalar o RVM e o Ruby 3.1.3, no Ubuntu:


```sh
  \curl -sSL https://get.rvm.io | bash -s stable
  ```

Após a conclusão da instalação, feche e reabra o terminal para carregar as configurações do RVM.
No terminal, execute o seguinte comando para instalar o Ruby 3.1.3:

```sh
  rvm install 3.1.3
  ```

Verifique se a instalação foi bem-sucedida executando o seguinte comando:

```sh
  ruby --version
  ```

<h3> Instalando o SQLite3</h3>

Para instalar o SQLite3, execute o seguinte comando:

```sh
  sudo apt-get install sqlite3 libsqlite3-dev
  ```
Para confirmar a instalação, execute o seguinte comando:

```sh
  sqlite3 --version
  ```

<span>Em outros sistemas operacionais, consulte a documentação oficial do SQLite para obter as instruções de instalação.</span>


Estas são apenas algumas das principais dependências usadas no projeto. Para ver a lista completa, consulte o arquivo Gemfile.


<h2> 💻 Setup:</h2>

Clone o repositório do projeto::

```sh
  git clone git@github.com:seu-usuario/dimensa-movies.git
  ```
Acesse o diretório do projeto:

```sh
  cd dimensa-movies
  ```
Instale as dependências do Ruby:

```sh
  bundle install
  ```
Crie o banco de dados e execute as migrações:
```sh
  rails db:create
  rails db:migrate
  ```

  Execute os testes para garantir que tudo está funcionando corretamente:
```sh
  bundle exec rspec
  ```
Inicie o servidor:

```sh
  rails server
  ```

<h2> 📝 Documentação:</h2>

A API possui os seguintes endpoints:

<h3>Importar filmes </h3>

Endpoint para importar filmes de um arquivo CSV presente no diretório raiz do projeto. O arquivo CSV deve ter o nome 'netflix_titles.csv'.

- URL: /api/v1/movies/import
- Método: POST
- Parâmetros:
  - file: arquivo CSV contendo os filmes a serem importados

Exemplo usando cURL:
  
  ```sh
    curl -X POST -F "file=@netflix_titles.csv" http://localhost:3000/api/v1/movies/import
  ```

- Resposta de sucesso:
  
  ```sh
  
    {"message": "Import successful"}
  
  ```
  - Status: 201, Created

<h3>Listar e filtrar filmes</h3>

Este endpoint permite listar e filtrar os filmes por diferentes critérios.

- Método: GET
- URL: /api/v1/movies
- Parâmetros opcionais:
  - title: título do filme
  - genre: gênero do filme
  - year: ano de lançamento do filme
  - country: país de origem do filme
  - published_at: data de publicação do filme
  - description: descrição do filme
  - page: número da página (padrão: 1)
  - per_page: quantidade de filmes por página (padrão: 25)

  Exemplo usando cURL:

  Listar todos os filmes:
  ```sh
    curl http://localhost:3000/api/v1/movies
  ```
- Resposta de sucesso:

 ```sh
  
  [
    {
        "id": 93,
        "title": "A Clockwork Orange",
        "genre": "Movie",
        "year": 1971,
        "country": "United Kingdom, United States",
        "published_at": "2020-11-01",
        "description": "In this dark satire from director Stanley Kubrick, a young, vicious sociopath in a dystopian England undergoes an experimental rehabilitation therapy."
    },
    {
        "id": 42,
        "title": "300 Miles to Heaven",
        "genre": "Movie",
        "year": 1989,
        "country": "Denmark, France, Poland",
        "published_at": "2019-10-01",
        "description": "Hoping to help their dissident parents, two brothers sneak out of Poland and land as refugees in Denmark, where they are prevented from returning home."
    },
    {
        "id": 94,
        "title": "A Dangerous Woman",
        "genre": "Movie",
        "year": 1993,
        "country": "United States",
        "published_at": "2018-04-01",
        "description": "At the center of this engrossing melodrama is a Golden Globe-nominated turn by Debra Winger, who plays a sheltered, slow-witted woman living with her widowed Aunt Frances while working at a dry cleaners."
    }
  ]
  
  ```
  - Status: 200, OK

  Filtrar filmes por gênero e ano:
  ```sh
    curl http://localhost:3000/api/v1/movies?genre=Movie&year=1993
  ```

  - Resposta de sucesso:
 ```sh
  [
    {
        "id": 94,
        "title": "A Dangerous Woman",
        "genre": "Movie",
        "year": 1993,
        "country": "United States",
        "published_at": "2018-04-01",
        "description": "At the center of this engrossing melodrama is a Golden Globe-nominated turn by Debra Winger, who plays a sheltered, slow-witted woman living with her widowed Aunt Frances while working at a dry cleaners."
    }
  ]
 ```
  Paginação de resultados:
  ```sh
    curl http://localhost:3000/api/v1/movies?page=2&per_page=2
  ```

<!-- <h3> Filtrar filmes </h3>

Este endpoint permite filtrar os filmes por diferentes critérios, como título, gênero, ano, país, etc.

- Método: GET
- URL: http://localhost:3000/api/v1/movies
- Parâmetros:
  - title: título do filme
  - genre: gênero do filme
  - year: ano de lançamento do filme
  - country: país de origem do filme
  - published_at: data de publicação do filme
  - description: descrição do filme
- Resposta de sucesso:
  - Status: 200 OK
  - Body: JSON contendo a lista de filmes filtrados

<h3> Exemplos de uso </h3>

Aqui estão alguns exemplos de uso dos endpoints da API:

<h4>Importar filmes</h4>

Para importar filmes a partir de um arquivo CSV, envie uma requisição POST para http://localhost:3000/api/v1/movies/import com o arquivo CSV como parâmetro.

Exemplo usando cURL:

```sh
  curl -X POST -F "file=@netflix_titles.csv" http://localhost:3000/api/v1/movies/import
  ```

<h4>Listar filmes</h4>

Para obter uma lista de todos os filmes, faça uma requisição GET para http://localhost:3000/api/v1/movies.

Exemplo usando cURL:

```sh
  curl http://localhost:3000/api/v1/movies
  ```

<h4>Filtrar filmes</h4>

Para filtrar os filmes com base em critérios específicos, faça uma requisição GET para http://localhost:3000/api/v1/movies passando os parâmetros desejados.

Exemplo usando cURL:
  
  ```sh
  curl http://localhost:3000/api/v1/movies?genre=Movie&year=1993
  ```
<h4> Paginação </h4>

A listagem de filmes retorna os resultados paginados. Para realizar a paginação dos resultados, inclua os parâmetros 'page' e 'per_page' na requisição GET.

Exemplo usando cURL:

```sh
  curl "http://localhost:3000/api/v1/movies?page=1&per_page=10"
``` -->

<h2> 📝 Contribuindo:</h2>
Sinta-se à vontade para contribuir com melhorias para este projeto. Se você encontrar algum problema ou tiver sugestões, por favor, abra uma "issue" neste repositório.

<h2> Author</h2>

<img src="https://avatars.githubusercontent.com/u/68801163?s=96&v=4" width="110" title="hover text">

<p>Developed by <a href="https://www.linkedin.com/in/lucasaraujomouta/">Lucas Araujo</a>.</strong></p>



<h2> 📝 Material de apoio</h2>

<p><a href="https://leanpub.com/conhecendo-ruby"> Lvro - Conhecendo Ruby </a></p>
<p><a href="https://guides.rubyonrails.org/api_app.html"> Rails for Api</a></p>
<p><a href="https://www.ruby-lang.org/pt/"> Ruby </a></p>
<p><a href="https://www.rubyguides.com/2018/11/rspec-introduction/"> Rspec </a></p>





