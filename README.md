<p align="center">
  <img src="https://dimensa.com/wp-content/uploads/2021/09/Logo-1.png" width="200" title="hover text">
 
</p>
<h1>Dimensa Movies</h1>
<p>Essa é uma API RESTful desenvolvida com Ruby on Rails, usando a estrutura Rails API para criar um serviço para gerenciar    filmes. A API permite importar filmes de um arquivo CSV, listar filmes, filtrar filmes por diversos critérios e ordenar os filmes pelo ano de lançamento..</p>    

<h2> 🛠 Dependências</h2>

<p>Ruby 3.1.3</p>
<p>Rails 7.0.4.3</p>
<p>SQlite3</p>

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
- Resposta de sucesso:
  - Status: 200 OK
  - Body: { "message": "Import successful" }

<h3>Listar filmes</h3>

Este endpoint retorna uma lista de filmes.

- Método: GET
- URL: http://localhost:3000/api/v1/movies
- Parâmetros opcionais:
  - page: número da página (padrão: 1)
  - per_page: quantidade de filmes por página (padrão: 25)
- Resposta de sucesso:
  - Status: 200 OK
  - Body: JSON contendo a lista de filmes e informações de paginação

<h3> Filtrar filmes </h3>

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
```

<h2> 📝 Contribuindo:</h2>
Sinta-se à vontade para contribuir com melhorias para este projeto. Se você encontrar algum problema ou tiver sugestões, por favor, abra uma "issue" neste repositório.

<h2> Author</h2>

<img src="https://avatars.githubusercontent.com/u/68801163?s=96&v=4" width="110" title="hover text">

<p>Developed by <a href="https://www.linkedin.com/in/lucasaraujomouta/">Lucas Araujo</a>.</strong></p>



<h2> 📝 references</h2>

<p><a href="https://leanpub.com/conhecendo-ruby"> Lvro - Conhecendo Ruby </a></p>
<p><a href="https://guides.rubyonrails.org/api_app.html"> Rails for Api</a></p>
<p><a href="https://www.ruby-lang.org/pt/"> Ruby </a></p>
<p><a href="https://www.rubyguides.com/2018/11/rspec-introduction/"> Rspec </a></p>


