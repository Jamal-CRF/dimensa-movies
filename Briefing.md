<h1>Desafio API</h1>
Criar uma API de serviço do catálogo de filmes. Para isso será necessário criar dois endpoints, um que faça a leitura de um arquivo CSV e crie os registros no banco de dados. E um segundo que liste todos os filmes cadastrados em formato JSON.

<h2>Requisitos:</h2>
- O desafio deve ser desenvolvido utilizando Ruby e tendo o Rails como framework.
-Poderá optar pelos bancos de dados SQLite, Postgresql ou MongoDB.
- Seguir o padrão API RESTful.
- Ordenar pelo ano de lançamento.
- Filtrar os registros por ano de lançamento, gênero, país, etc.
- Garantir que não haja duplicidade de registros.
- O projeto deve ser disponibilizado em um repositório aberto no GitHub.
- A response do endpoint de listagem deve obedecer estritamente o padrão abaixo:
[
    {
        "id": "840c7cfc-cd1f-4094-9651-688457d97fa4",
        "title": "13 Reasons Why",
        "genre": "TV Show",
        "year": "2020",
        "country": "United States",
        "published_at": "2020-05-07",
        "description": "A classmate receives a series of tapes that unravel the mystery of her tragic choice."
    }
]
<h2>Dicas:<h/2>
- Testes são bem-vindos.
- O filtro pode ser aplicado por 1 ou mais itens, mas devem atender aos requisitos.
- Criar um readme.md com algumas informações do projeto é sempre bem útil.
- O arquivo .csv, intitulado netflix_titles.csv, poderá ser encontrado neste repositório.
