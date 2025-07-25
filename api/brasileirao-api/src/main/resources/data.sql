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
('Santos', 'SAN', 'http://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png', 'O Peixe, um dos clubes mais gloriosos do futebol brasileiro, conhecido por revelar grandes craques.'),
('Botafogo', 'BOT', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/botafogo_60x60.png', 'O Glorioso, um dos clubes mais tradicionais do Rio de Janeiro, conhecido por sua icônica estrela solitária no escudo.');

--- INSERÇÃO DOS JOGOS ---

--- JOGOS AO VIVO ---
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'CAM'), (SELECT id FROM teams WHERE acronym = 'CRU'), 1, 1, '2025-07-24T14:00:00Z', 'Mineirão, Belo Horizonte', 'AO_VIVO'),
((SELECT id FROM teams WHERE acronym = 'FLA'), (SELECT id FROM teams WHERE acronym = 'VAS'), 2, 0, '2025-07-24T13:30:00Z', 'Maracanã, Rio de Janeiro', 'AO_VIVO'),
((SELECT id FROM teams WHERE acronym = 'BOT'), (SELECT id FROM teams WHERE acronym = 'FLU'), 0, 0, '2025-07-24T21:30:00Z', 'Estádio Nilton Santos, Rio de Janeiro', 'AO_VIVO');

--- JOGOS FINALIZADOS ---
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'PAL'), (SELECT id FROM teams WHERE acronym = 'COR'), 1, 1, '2025-07-22T22:00:00Z', 'Allianz Parque, São Paulo', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'SAO'), (SELECT id FROM teams WHERE acronym = 'SAN'), 1, 0, '2025-07-22T22:00:00Z', 'Morumbi, São Paulo', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'GRE'), (SELECT id FROM teams WHERE acronym = 'INT'), 0, 0, '2025-07-21T23:00:00Z', 'Arena do Grêmio, Porto Alegre', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'CAP'), (SELECT id FROM teams WHERE acronym = 'CFC'), 2, 2, '2025-07-20T19:00:00Z', 'Arena da Baixada, Curitiba', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'SPO'), (SELECT id FROM teams WHERE acronym = 'AVA'), 1, 0, '2025-07-20T21:00:00Z', 'Ilha do Retiro, Recife', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'GOI'), (SELECT id FROM teams WHERE acronym = 'CHA'), 0, 1, '2025-07-19T22:00:00Z', 'Serra Dourada, Goiânia', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'PON'), (SELECT id FROM teams WHERE acronym = 'FIG'), 2, 0, '2025-07-19T19:00:00Z', 'Moisés Lucarelli, Campinas', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'FLA'), (SELECT id FROM teams WHERE acronym = 'SAO'), 2, 1, '2025-07-15T00:00:00Z', 'Maracanã, Rio de Janeiro', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'VAS'), (SELECT id FROM teams WHERE acronym = 'PAL'), 0, 3, '2025-07-14T23:00:00Z', 'São Januário, Rio de Janeiro', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'COR'), (SELECT id FROM teams WHERE acronym = 'SAN'), 2, 0, '2025-07-13T19:00:00Z', 'Neo Química Arena, São Paulo', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'INT'), (SELECT id FROM teams WHERE acronym = 'CAP'), 1, 1, '2025-07-13T21:30:00Z', 'Beira-Rio, Porto Alegre', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'CRU'), (SELECT id FROM teams WHERE acronym = 'GRE'), 0, 1, '2025-07-12T22:00:00Z', 'Mineirão, Belo Horizonte', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'CAM'), (SELECT id FROM teams WHERE acronym = 'FLU'), 2, 2, '2025-07-12T19:00:00Z', 'Arena MRV, Belo Horizonte', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'AVA'), (SELECT id FROM teams WHERE acronym = 'GOI'), 3, 0, '2025-07-10T00:00:00Z', 'Ressacada, Florianópolis', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'CFC'), (SELECT id FROM teams WHERE acronym = 'SPO'), 1, 2, '2025-07-09T23:00:00Z', 'Couto Pereira, Curitiba', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'FIG'), (SELECT id FROM teams WHERE acronym = 'CHA'), 0, 0, '2025-07-08T19:00:00Z', 'Orlando Scarpelli, Florianópolis', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'PAL'), (SELECT id FROM teams WHERE acronym = 'GRE'), 4, 1, '2025-07-06T19:00:00Z', 'Allianz Parque, São Paulo', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'SAN'), (SELECT id FROM teams WHERE acronym = 'FLA'), 1, 3, '2025-07-05T22:00:00Z', 'Vila Belmiro, Santos', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'VAS'), (SELECT id FROM teams WHERE acronym = 'COR'), 0, 0, '2025-07-05T19:00:00Z', 'São Januário, Rio de Janeiro', 'FINALIZADO'),
((SELECT id FROM teams WHERE acronym = 'COR'), (SELECT id FROM teams WHERE acronym = 'BOT'), 1, 2, '2025-07-19T22:00:00Z', 'Neo Química Arena, São Paulo', 'FINALIZADO');

--- JOGOS AGENDADOS ---
INSERT INTO games (home_team_id, away_team_id, home_goals, away_goals, game_date_time, stadium, status) VALUES
((SELECT id FROM teams WHERE acronym = 'SAO'), (SELECT id FROM teams WHERE acronym = 'CAM'), NULL, NULL, '2025-07-25T23:00:00Z', 'Morumbi, São Paulo', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'INT'), (SELECT id FROM teams WHERE acronym = 'PAL'), NULL, NULL, '2025-07-26T19:00:00Z', 'Beira-Rio, Porto Alegre', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'CAP'), (SELECT id FROM teams WHERE acronym = 'FLA'), NULL, NULL, '2025-07-26T22:00:00Z', 'Arena da Baixada, Curitiba', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'GRE'), (SELECT id FROM teams WHERE acronym = 'VAS'), NULL, NULL, '2025-07-27T19:00:00Z', 'Arena do Grêmio, Porto Alegre', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'COR'), (SELECT id FROM teams WHERE acronym = 'FLU'), NULL, NULL, '2025-07-27T22:00:00Z', 'Neo Química Arena, São Paulo', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'CRU'), (SELECT id FROM teams WHERE acronym = 'SPO'), NULL, NULL, '2025-07-29T23:00:00Z', 'Mineirão, Belo Horizonte', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'SAN'), (SELECT id FROM teams WHERE acronym = 'GOI'), NULL, NULL, '2025-07-30T00:00:00Z', 'Vila Belmiro, Santos', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'CFC'), (SELECT id FROM teams WHERE acronym = 'AVA'), NULL, NULL, '2025-08-01T23:00:00Z', 'Couto Pereira, Curitiba', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'CHA'), (SELECT id FROM teams WHERE acronym = 'PON'), NULL, NULL, '2025-08-02T19:00:00Z', 'Arena Condá, Chapecó', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'CAM'), (SELECT id FROM teams WHERE acronym = 'INT'), NULL, NULL, '2025-08-03T19:00:00Z', 'Arena MRV, Belo Horizonte', 'AGENDADO'),
((SELECT id FROM teams WHERE acronym = 'BOT'), (SELECT id FROM teams WHERE acronym = 'GRE'), NULL, NULL, '2025-08-02T19:00:00Z', 'Estádio Nilton Santos, Rio de Janeiro', 'AGENDADO');

--- INSERÇÃO DOS EVENTOS DE JOGO ---

--- Eventos Jogo Ao Vivo 1: CAM 1x1 CRU
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do jogo', '2025-07-24T14:00:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU')),
('Cartão amarelo para o Atlético-MG', '2025-07-24T14:18:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU')),
('Gol do Cruzeiro! Matheus Pereira abre o placar.', '2025-07-24T14:35:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU')),
('Intervalo de jogo.', '2025-07-24T14:46:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU')),
('Começa o segundo tempo!', '2025-07-24T15:01:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU')),
('Gol do Atlético-MG! Paulinho empata o clássico.', '2025-07-24T15:05:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'CAM' AND at.acronym = 'CRU'));

--- Eventos Jogo Ao Vivo 2: FLA 2x0 VAS
INSERT INTO game_events (description, event_time, game_id) VALUES
('Apita o árbitro! Começa o clássico dos milhões!', '2025-07-24T13:30:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS')),
('GOL DO FLAMENGO! Pedro, de cabeça, abre o placar.', '2025-07-24T13:45:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS')),
('Cartão amarelo para Vegetti por reclamação.', '2025-07-24T14:05:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS')),
('Intervalo no Maracanã.', '2025-07-24T14:17:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS')),
('Bola rolando para a etapa final.', '2025-07-24T14:32:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS')),
('GOL DO FLAMENGO! Arrascaeta amplia de fora da área.', '2025-07-24T14:50:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'FLA' AND at.acronym = 'VAS'));

--- Eventos Jogos Finalizados ---
-- PAL 1x1 COR
INSERT INTO game_events (description, event_time, game_id) VALUES
('Início do jogo', '2025-07-22T22:00:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'PAL' AND at.acronym = 'COR')),
('Gol do Palmeiras', '2025-07-22T22:25:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'PAL' AND at.acronym = 'COR')),
('Gol do Corinthians', '2025-07-22T23:10:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'PAL' AND at.acronym = 'COR')),
('Fim de jogo', '2025-07-22T23:50:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'PAL' AND at.acronym = 'COR'));

-- SAO 1x0 SAN
INSERT INTO game_events (description, event_time, game_id) VALUES
('Começa o clássico!', '2025-07-22T22:00:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'SAO' AND at.acronym = 'SAN')),
('Gol do São Paulo', '2025-07-22T23:30:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'SAO' AND at.acronym = 'SAN')),
('Fim de papo no Morumbi.', '2025-07-22T23:52:00Z', (SELECT g.id FROM games g JOIN teams ht ON g.home_team_id = ht.id JOIN teams at ON g.away_team_id = at.id WHERE ht.acronym = 'SAO' AND at.acronym = 'SAN'));