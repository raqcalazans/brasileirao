-- Inserção dos Times
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

-- Inserção dos Jogos (com datas em UTC e status ajustado)
-- Jogo 1 (Finalizado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'FLA'), (SELECT id FROM teams WHERE acronym = 'GRE'), 2, 1, '2025-07-20T22:00:00Z', 'Maracanã, Rio de Janeiro', 'FINALIZADO');
-- Jogo 2 (Finalizado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'PAL'), (SELECT id FROM teams WHERE acronym = 'COR'), 1, 1, '2025-07-19T19:00:00Z', 'Allianz Parque, São Paulo', 'FINALIZADO');
-- Jogo 3 (AJUSTADO PARA FINALIZADO, baseado na hora atual)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'SAO'), (SELECT id FROM teams WHERE acronym = 'SAN'), 1, 0, '2025-07-23T16:00:00Z', 'Morumbi, São Paulo', 'FINALIZADO');
-- Jogo 4 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'CAM'), (SELECT id FROM teams WHERE acronym = 'VAS'), NULL, NULL, '2025-07-26T00:00:00Z', 'Arena MRV, Belo Horizonte', 'AGENDADO');
-- Jogo 5 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'FLU'), (SELECT id FROM teams WHERE acronym = 'INT'), NULL, NULL, '2025-07-27T21:00:00Z', 'Maracanã, Rio de Janeiro', 'AGENDADO');
-- Jogo 6 (Agendado)
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'CRU'), (SELECT id FROM teams WHERE acronym = 'CAP'), NULL, NULL, '2025-08-02T00:00:00Z', 'Mineirão, Belo Horizonte', 'AGENDADO');

-- Inserção dos Eventos de Jogo
-- Eventos Jogo 1: Flamengo 2x1 Grêmio
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do 1º tempo', '2025-07-20T22:00:00Z', (SELECT id FROM games WHERE stadium = 'Maracanã, Rio de Janeiro' AND home_goals = 2)),
('Gol do Flamengo (Pedro)', '2025-07-20T22:15:00Z', (SELECT id FROM games WHERE stadium = 'Maracanã, Rio de Janeiro' AND home_goals = 2)),
('Gol do Grêmio (Suárez)', '2025-07-20T22:40:00Z', (SELECT id FROM games WHERE stadium = 'Maracanã, Rio de Janeiro' AND home_goals = 2)),
('Gol do Flamengo (Gabigol)', '2025-07-20T23:25:00Z', (SELECT id FROM games WHERE stadium = 'Maracanã, Rio de Janeiro' AND home_goals = 2)),
('Fim de jogo', '2025-07-20T23:50:00Z', (SELECT id FROM games WHERE stadium = 'Maracanã, Rio de Janeiro' AND home_goals = 2));

-- Eventos Jogo 2: Palmeiras 1x1 Corinthians
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do jogo', '2025-07-19T19:00:00Z', (SELECT id FROM games WHERE stadium = 'Allianz Parque, São Paulo')),
('Gol do Palmeiras', '2025-07-19T19:20:00Z', (SELECT id FROM games WHERE stadium = 'Allianz Parque, São Paulo')),
('Gol do Corinthians', '2025-07-19T19:55:00Z', (SELECT id FROM games WHERE stadium = 'Allianz Parque, São Paulo')),
('Fim do jogo', '2025-07-19T20:50:00Z', (SELECT id FROM games WHERE stadium = 'Allianz Parque, São Paulo'));

-- Eventos Jogo 3: São Paulo 1x0 Santos (Eventos ajustados)
INSERT INTO game_events (description, event_time, game_id) VALUES
('Partida iniciada', '2025-07-23T16:00:00Z', (SELECT id FROM games WHERE stadium = 'Morumbi, São Paulo')),
('Cartão amarelo para São Paulo', '2025-07-23T16:10:00Z', (SELECT id FROM games WHERE stadium = 'Morumbi, São Paulo')),
('Ataque perigoso do Santos', '2025-07-23T16:25:00Z', (SELECT id FROM games WHERE stadium = 'Morumbi, São Paulo')),
('Gol do São Paulo (Calleri)', '2025-07-23T17:20:00Z', (SELECT id FROM games WHERE stadium = 'Morumbi, São Paulo')),
('Fim do jogo', '2025-07-23T17:52:00Z', (SELECT id FROM games WHERE stadium = 'Morumbi, São Paulo'));