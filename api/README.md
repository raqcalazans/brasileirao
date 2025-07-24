# API do Brasileirão

Este diretório contém o código-source da API backend para o aplicativo "Brasileirão". Esta API é responsável por fornecer os dados dos jogos de futebol para o aplicativo iOS, incluindo a lista de partidas, placares, times e informações básicas.

## 🚀 Tecnologias Utilizadas

* **Linguagem:** Java 17
* **Framework:** Spring Boot 3.5.3
* **Gerenciador de Dependências:** Maven
* **Banco de Dados:** PostgreSQL (para persistência de dados)
    * *Alternativa para desenvolvimento local:* H2 Database (pode ser configurado em `application.properties` para modo em memória ou arquivo para facilitar o setup inicial).
* **ORM:** Spring Data JPA / Hibernate
* **Utilitário:** Lombok (para reduzir boilerplate)

## ✨ Funcionalidades

* Fornece dados de jogos do Brasileirão (dados mock/seed).
* Dados de jogos incluem nomes dos times, escudos (URLs fornecidas), placar, data e horário, status e local.
* Endpoints para listar todos os jogos e obter detalhes de um jogo específico.
* Filtro de jogos por status, data e/ou ID do time.

## 🎯 Decisões de Design e Escopo (Dados Mock/Seed)

Para este desafio técnico, e considerando a complexidade e os custos de APIs de dados esportivos em tempo real, **a API foi desenvolvida para servir dados mock/seed.**

* **Motivação:** Permite focar na implementação da arquitetura da API e na integração com o aplicativo iOS sem depender de APIs externas pagas ou com limites de requisição. Garante um ambiente de desenvolvimento estável e previsível.
* **Fonte dos Dados Mock:** Os dados foram baseados em informações simuladas de jogos do Brasileirão e são populados via o script SQL `data.sql` na inicialização da aplicação (para H2 em memória) ou na primeira execução (para PostgreSQL/H2 em arquivo, usando `ddl-auto=update`). Os escudos dos times utilizam URLs de imagens fornecidas por `s.glbimg.com`.
* **Como seria em um ambiente de produção:** Em um cenário de produção real, esta API seria alimentada por uma fonte de dados de futebol profissional (ex: Sportmonks, API-Football) ou seria parte de um sistema de ingestão de dados maior. A lógica de ingestão e atualização dos dados seria implementada para manter as informações sempre em dia, possivelmente com um banco de dados relacional mais robusto como PostgreSQL.

## ⚙️ Configuração e Execução Local

Siga os passos abaixo para configurar e rodar a API em sua máquina local.

### Pré-requisitos

Certifique-se de ter instalado:

* **Java Development Kit (JDK) 17.**
* **Maven.**
* **PostgreSQL:** Servidor PostgreSQL rodando. Crie um banco de dados chamado `brasileirao_db` e um usuário/senha para acesso, conforme configurado em `application.properties`.

### Instalação e Execução

1.  **Navegue até o diretório da API:**
    ```bash
    cd /caminho/para/seu/repositorio/api
    ```
    (Ou `cd api` se você já estiver na raiz do seu repositório `seu-projeto-brasileirao/`)

2.  **Configure o banco de dados PostgreSQL:**
    * Abra o arquivo `src/main/resources/application.properties`.
    * Atualize as credenciais `spring.datasource.username` e `spring.datasource.password` com as suas credenciais do PostgreSQL.

3.  **Compile e execute o projeto Spring Boot:**
    Utilizando Maven Wrapper (`./mvnw`):
    ```bash
    ./mvnw spring-boot:run
    ```
    * **Observação:** Na primeira execução, o Maven fará o download de todas as dependências, o que pode levar algum tempo. O Spring Boot automaticamente criará as tabelas e populará os dados com base no `data.sql` (se `ddl-auto` estiver como `create` ou `create-drop` ou `update` com tabelas vazias).

A API estará disponível em `http://localhost:8080`.

## 📊 Endpoints da API

A API expõe os seguintes endpoints:

### `GET /api/v1/games`

Retorna uma lista de todos os jogos disponíveis (passados, futuros e em andamento).

* **URL:** `http://localhost:8080/api/v1/games`
* **Método:** `GET`
* **Parâmetros de Query (Opcional):**
    * `status`: Filtra jogos por status (ex: `agendado`, `finalizado`, `ao_vivo`).
        * Exemplo: `http://localhost:8080/api/v1/games?status=agendado`
    * `date`: Filtra jogos por data específica no formato `YYYY-MM-DD`.
        * Exemplo: `http://localhost:8080/api/v1/games?date=2025-07-25`
    * `teamId`: Filtra jogos que envolvam um time específico (seja como mandante ou visitante).
        * Exemplo: `http://localhost:8080/api/v1/games?teamId=flamengo`
* **Exemplo de Resposta (JSON):**
    ```json
    [
        {
            "id": "game-d01a2b3c",
            "homeTeam": {
                "id": "flamengo",
                "name": "Flamengo",
                "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png)"
            },
            "awayTeam": {
                "id": "gremio",
                "name": "Grêmio",
                "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png)"
            },
            "homeScore": 2,
            "awayScore": 1,
            "dateTime": "2025-07-16T19:00:00-03:00",
            "status": "finalizado",
            "location": "Maracanã, Rio de Janeiro"
        },
        {
            "id": "game-c8d9e0f1",
            "homeTeam": {
                "id": "atletico-mg",
                "name": "Atlético-MG",
                "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png)"
            },
            "awayTeam": {
                "id": "vasco",
                "name": "Vasco da Gama",
                "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/vasco_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/vasco_60x60.png)"
            },
            "homeScore": null,
            "awayScore": null,
            "dateTime": "2025-07-25T20:30:00-03:00",
            "status": "agendado",
            "location": "Arena MRV, Belo Horizonte"
        }
    ]
    ```

### `GET /api/v1/games/{id}`

Retorna os detalhes de um jogo específico pelo seu ID.

* **URL:** `http://localhost:8080/api/v1/games/game-d01a2b3c`
* **Método:** `GET`
* **Exemplo de Resposta (JSON):**
    ```json
    {
        "id": "game-d01a2b3c",
        "homeTeam": {
            "id": "flamengo",
            "name": "Flamengo",
            "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png)"
        },
        "awayTeam": {
            "id": "gremio",
            "name": "Grêmio",
            "shieldUrl": "[http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png](http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png)"
        },
        "homeScore": 2,
        "awayScore": 1,
        "dateTime": "2025-07-16T19:00:00-03:00",
        "status": "finalizado",
        "location": "Maracanã, Rio de Janeiro"
        // Campo 'events' (Lance a Lance) não implementado no MVP, mas pode ser adicionado aqui
    }
    ```

## 🧪 Testes

* **Como rodar os testes da API (Maven):**
    ```bash
    ./mvnw test
    ```
* **Cobertura dos Testes:** Os testes de unidade e integração cobrem a funcionalidade dos endpoints principais (`GET /api/v1/games` e `GET /api/v1/games/{id}`) e o mapeamento dos modelos de dados.

## 📚 Ideias para Melhorias Futuras (Escalabilidade e Expansão)

* **Integração com uma API de Dados Esportivos Real:** Substituir os dados mock por uma fonte de dados externa, como Sportmonks ou API-Football (mencionar considerações sobre limites de requisição e caching).
* **Endpoint para Classificação do Campeonato:** Adicionar um endpoint `/api/v1/standings` para retornar a tabela de classificação.
* **Endpoints para Detalhes de Times:** `/api/v1/teams/{team_id}` para informações mais detalhadas sobre um time.
* **Autenticação e Autorização:** Implementar mecanismos de segurança caso a API precise de acesso restrito.
* **Deploy em Produção:** Sugestões de plataformas de deploy (ex: Heroku, AWS Elastic Beanstalk) e estratégias de CI/CD (ex: GitHub Actions, Jenkins).
* **Websockets para Atualizações em Tempo Real:** Implementar websockets para push de eventos como gols e mudanças de placar para o aplicativo.
* **Monitoramento e Logs:** Adicionar ferramentas de monitoramento e logs mais robustas para acompanhar o desempenho e erros da API.
* **Tratamento de Exceções Global:** Implementar um handler global para exceções na API para respostas padronizadas.

---