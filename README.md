# Coding challenge

## O Desafio

Criar um aplicativo para acompanhamento de jogos de futebol.

O aplicativo deverá funcionar em dispositivos iOS.

Também deverá ser feita a API que provê os dados para o aplicativo com a tecnologia de sua escolha.

## Considerações Gerais

**Registre tudo**: Ideias que gostaria de implementar se tivesse mais tempo (explique como você as resolveria), decisões tomadas e seus porquês, arquiteturas testadas e os motivos de terem sido modificadas ou abandonadas.

Sinta-se livre para incluir ferramentas e bibliotecas open source.

Avaliaremos sua submissão como se fosse um produto mínimo viável (MVP), pronto para ser publicado em produção, mas que continuará sendo expandido e mantido no futuro. A avaliação terá como foco as seguintes características:

* se atende aos requisitos básicos.
* a qualidade do código, do projeto de software, da arquitetura.
* os testes.
* a automação.
* a escalabilidade.

## O Aplicativo

O aplicativo possui duas telas: uma listagem de jogos e o detalhe de cada jogo.

### Tela Inicial

- Lista de jogos
  - Nome dos times
  - Escudos
  - Placar
  - Data e horário

Considere as seguintes condições:

- A lista de jogos deve estar disponível offline

- O usuário pode querer atualizar a lista de jogos

- Clicar sobre um jogo leva o usuário para a tela de detalhe daquele jogo

### Detalhe do Jogo

- Detalhe do jogo
  - Nome dos times
  - Escudos
  - Placar
  - Data e horário
  - Local

- Lance a Lance
  - Lista de momentos importantes do jogo
    - Tempo no jogo
    - Descrição

- Atalho para voltar para a tela inicial

## Imagens

Escudos dos times

```
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/vasco_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60_.png
http://s.glbimg.com/es/sde/f/equipes/2014/09/15/sport_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/internacional_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2015/05/06/chapecoense_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/coritiba_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2015/04/29/cruzeiro_65.png
http://s.glbimg.com/es/sde/f/equipes/2015/06/24/atletico-pr_2015_65.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/sao_paulo_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/corinthians_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/ponte_preta_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/figueirense_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/goias_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2015/05/05/fluminense-escudo-65x65.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png
http://s.glbimg.com/es/sde/f/equipes/2014/04/14/botafogo_60x60.png
```

---

## Solução Proposta: Brasileirão App

<img width="200" alt="AppIcon_brasileirao" src="https://github.com/user-attachments/assets/6b64d4d1-5b27-4497-8d77-d84933691bf7" />

![Swift Version](https://img.shields.io/badge/Swift-5.5%2B-orange)
![Platform](https://img.shields.io/badge/Platform-iOS%2013%2B-lightgrey)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue)
[![CI Build & Unit Test](https://github.com/SelecaoGlobocom/raquel-calazans/actions/workflows/ci.yml/badge.svg)](https://github.com/SelecaoGlobocom/raquel-calazans/actions/workflows/ci.yml)

Este repositório contém a implementação completa para o desafio, consistindo em uma API backend e um aplicativo cliente para iOS. A solução foi desenvolvida com foco em arquitetura moderna, escalabilidade e qualidade de código.

### Arquitetura Geral

O projeto foi estruturado como um "monorepo" contendo dois subprojetos principais:

* **`./api`**: Uma API RESTful desenvolvida com **Java e Spring Boot**.
* **`./ios-app`**: Um aplicativo nativo para iOS desenvolvido com **Swift, SwiftUI e SwiftData**.

A decisão de arquitetura mais impactante foi a implementação de um modelo de **UI Guiada pelo Servidor (Server-Driven UI)**, onde a API define a estrutura de agrupamento dos jogos (ex: por status ou por rodada), e o cliente iOS apenas renderiza a estrutura recebida.

### Detalhes de Cada Projeto

Para informações detalhadas sobre a arquitetura, stack de tecnologias, instruções de setup, testes e decisões de design de cada parte do projeto, por favor, consulte seus respectivos `README`s:

* ➡️ **[Documentação da API (Backend)](./api/README.md)**
* ➡️ **[Documentação do App (iOS)](./ios-app/README.md)**
