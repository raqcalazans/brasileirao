package com.selecaoglobocom.brasileirao_api.service;

import com.selecaoglobocom.brasileirao_api.dto.GameDTO;
import com.selecaoglobocom.brasileirao_api.entity.Game;
import com.selecaoglobocom.brasileirao_api.mapper.GameMapper;
import com.selecaoglobocom.brasileirao_api.repository.GameRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameService {

    private final GameRepository gameRepository;
    private final GameMapper gameMapper;

    // Usando injeção de dependência via construtor (melhor prática)
    public GameService(GameRepository gameRepository, GameMapper gameMapper) {
        this.gameRepository = gameRepository;
        this.gameMapper = gameMapper;
    }

    public List<GameDTO> findAllGames() {
        // 1. Busca as entidades do banco usando o método otimizado
        List<Game> games = gameRepository.findAllWithTeamsAndEvents();
        
        // 2. Usa o mapper para converter a lista de Entidades para uma lista de DTOs
        return gameMapper.toDto(games);
    }
}