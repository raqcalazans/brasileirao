-- Exclui dados existentes para garantir um estado limpo a cada execução (bom para dev com ddl-auto=update)
-- IMPORTANTE: Se você não quer que os dados sejam resetados a cada restart, remova estas linhas ou comente.
DELETE FROM game_events;
DELETE FROM games;
DELETE FROM teams;

INSERT INTO teams (name, acronym, logo_url, description) VALUES
('Vasco da Gama', 'VAS', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/vasco_60x60.png', 'Clube de futebol carioca fundado em 1898, conhecido por sua tradição e torcida apaixonada.'),
('Avaí', 'AVA', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60_.png', 'Clube catarinense da capital Florianópolis, conhecido como Leão da Ilha.'),
('Sport', 'SPO', 'http://s.glbimg.com/es/sde/f/equipes/2014/09/15/sport_60x60.png', 'Tradicional clube pernambucano, com grande história no futebol nordestino.'),
('Internacional', 'INT', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/internacional_60x60.png', 'Gigante do futebol gaúcho, conhecido como Colorado, com grandes conquistas internacionais.'),
('Palmeiras', 'PAL', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png', 'Um dos maiores clubes de São Paulo, com rica história e muitos títulos nacionais e internacionais.'),
('Chapecoense', 'CHA', 'http://s.glbimg.com/es/sde/f/equipes/2015/05/06/chapecoense_60x60.png', 'Clube catarinense que superou adversidades e se tornou um símbolo de resiliência.'),
('Atlético-MG', 'CAM', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png', 'O Galo de Minas, um dos clubes mais populares de Minas Gerais, com torcida fanática.'),
('Coritiba', 'CFC', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/coritiba_60x60.png', 'Time tradicional do Paraná, conhecido como Coxa, com uma das maiores torcidas do estado.'),
('Grêmio', 'GRE', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png', 'Tradição e glória no Rio Grande do Sul, o Tricolor Gaúcho é um dos mais vitoriosos do Brasil.'),
('Cruzeiro', 'CRU', 'http://s.glbimg.com/es/sde/f/equipes/2015/04/29/cruzeiro_65.png', 'Maior campeão da Copa do Brasil, a Raposa de Minas é um gigante do futebol nacional.'),
('Athletico-PR', 'CAP', 'http://s.glbimg.com/es/sde/f/equipes/2015/06/24/atletico-pr_2015_65.png', 'O Furacão paranaense, conhecido por sua Arena moderna e futebol ousado.'),
('São Paulo', 'SAO', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/sao_paulo_60x60.png', 'Um dos clubes mais vitoriosos do Brasil, conhecido como Tricolor Paulista.'),
('Flamengo', 'FLA', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png', 'Clube de maior torcida do Brasil, com uma história rica e muitos títulos.'),
('Corinthians', 'COR', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/corinthians_60x60.png', 'O Timão, um dos clubes mais populares do Brasil, com uma torcida fiel e apaixonada.'),
('Ponte Preta', 'PON', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/ponte_preta_60x60.png', 'A Macaca, um dos times mais tradicionais do interior de São Paulo.'),
('Figueirense', 'FIG', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/figueirense_60x60.png', 'O Furacão do Estreito, clube catarinense com grande história no futebol regional.'),
('Goiás', 'GOI', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/goias_60x60.png', 'O Esmeraldino, tradicional clube de Goiás, com forte presença no Centro-Oeste.'),
('Fluminense', 'FLU', 'http://s.glbimg.com/es/sde/f/equipes/2015/05/05/fluminense-escudo-65x65.png', 'O Tricolor das Laranjeiras, um dos mais antigos e tradicionais clubes do Rio de Janeiro.'),
('Santos', 'SAN', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png', 'O Peixe, um dos clubes mais gloriosos do futebol brasileiro, conhecido por revelar grandes craques.');


-- Sequências para os IDs gerados automaticamente
SELECT SETVAL('teams_id_seq', (SELECT MAX(id) FROM teams));
SELECT SETVAL('games_id_seq', (SELECT MAX(id) FROM games));
SELECT SETVAL('game_events_id_seq', (SELECT MAX(id) FROM game_events));


-- Jogo 1 (Finalizado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'Flamengo'), (SELECT id FROM teams WHERE name = 'Grêmio'), 2, 1, '2025-07-20T19:00:00-03:00', 'Maracanã, Rio de Janeiro', 'FINALIZADO');
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do 1º tempo', '2025-07-20T19:00:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Gol do Flamengo (Pedro)', '2025-07-20T19:15:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Cartão amarelo para Grêmio', '2025-07-20T19:30:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Gol do Grêmio (Suárez)', '2025-07-20T19:40:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Fim do 1º tempo', '2025-07-20T19:45:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Início do 2º tempo', '2025-07-20T20:00:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Gol do Flamengo (Gabigol)', '2025-07-20T20:25:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Substituição no Flamengo', '2025-07-20T20:35:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro')),
('Fim de jogo', '2025-07-20T20:50:00-03:00', (SELECT id FROM games WHERE home_goals = 2 AND away_goals = 1 AND stadium = 'Maracanã, Rio de Janeiro'));


-- Jogo 2 (Finalizado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'Palmeiras'), (SELECT id FROM teams WHERE name = 'Corinthians'), 1, 1, '2025-07-19T16:00:00-03:00', 'Allianz Parque, São Paulo', 'FINALIZADO');
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do jogo', '2025-07-19T16:00:00-03:00', (SELECT id FROM games WHERE home_goals = 1 AND away_goals = 1 AND stadium = 'Allianz Parque, São Paulo')),
('Gol do Palmeiras', '2025-07-19T16:20:00-03:00', (SELECT id FROM games WHERE home_goals = 1 AND away_goals = 1 AND stadium = 'Allianz Parque, São Paulo')),
('Gol do Corinthians', '2025-07-19T16:55:00-03:00', (SELECT id FROM games WHERE home_goals = 1 AND away_goals = 1 AND stadium = 'Allianz Parque, São Paulo')),
('Fim do jogo', '2025-07-19T17:50:00-03:00', (SELECT id FROM games WHERE home_goals = 1 AND away_goals = 1 AND stadium = 'Allianz Parque, São Paulo'));


-- Jogo 3 (Ao Vivo)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'São Paulo'), (SELECT id FROM teams WHERE name = 'Santos'), 0, 0, '2025-07-23T13:00:00-03:00', 'Morumbi, São Paulo', 'AO_VIVO');
INSERT INTO game_events (description, event_time, game_id) VALUES
('Partida iniciada', '2025-07-23T13:00:00-03:00', (SELECT id FROM games WHERE status = 'AO_VIVO' AND stadium = 'Morumbi, São Paulo')),
('Cartão amarelo para São Paulo', '2025-07-23T13:10:00-03:00', (SELECT id FROM games WHERE status = 'AO_VIVO' AND stadium = 'Morumbi, São Paulo')),
('Ataque perigoso do Santos', '2025-07-23T13:25:00-03:00', (SELECT id FROM games WHERE status = 'AO_VIVO' AND stadium = 'Morumbi, São Paulo'));


-- Jogo 4 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'Atlético-MG'), (SELECT id FROM teams WHERE name = 'Vasco da Gama'), NULL, NULL, '2025-07-25T21:00:00-03:00', 'Arena MRV, Belo Horizonte', 'AGENDADO');

-- Jogo 5 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'Fluminense'), (SELECT id FROM teams WHERE name = 'Internacional'), NULL, NULL, '2025-07-27T18:00:00-03:00', 'Maracanã, Rio de Janeiro', 'AGENDADO');

-- Jogo 6 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE name = 'Cruzeiro'), (SELECT id FROM teams WHERE name = 'Athletico-PR'), NULL, NULL, '2025-08-01T20:00:00-03:00', 'Mineirão, Belo Horizonte', 'AGENDADO');