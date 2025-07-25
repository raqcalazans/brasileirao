package com.selecaoglobocom.brasileirao_api.service;

import com.selecaoglobocom.brasileirao_api.dto.GameDTO;
import com.selecaoglobocom.brasileirao_api.dto.GameGroupDTO;
import com.selecaoglobocom.brasileirao_api.dto.GameScreenDTO;
import com.selecaoglobocom.brasileirao_api.entity.GameStatus;
import com.selecaoglobocom.brasileirao_api.entity.Game;
import com.selecaoglobocom.brasileirao_api.mapper.GameMapper;
import com.selecaoglobocom.brasileirao_api.repository.GameRepository;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class GameService {
    private final GameRepository gameRepository;
    private final GameMapper gameMapper;

    public GameService(GameRepository gameRepository, GameMapper gameMapper) {
        this.gameRepository = gameRepository;
        this.gameMapper = gameMapper;
    }

    public GameScreenDTO findAllGamesGrouped() {
        List<Game> games = gameRepository.findAllWithTeamsAndEvents();

        Map<GameStatus, List<Game>> gamesByStatus = games.stream()
                .collect(Collectors.groupingBy(Game::getStatus));

        List<GameGroupDTO> groups = gamesByStatus.entrySet().stream()
                .sorted(Comparator.comparing(entry -> {
                    switch (entry.getKey()) {
                        case AO_VIVO: return 0;
                        case AGENDADO: return 1;
                        case FINALIZADO: return 2;
                        default: return 3;
                    }
                }))
                .map(entry -> {
                    String title = getTitleForStatus(entry.getKey());
                    List<GameDTO> gameDTOs = gameMapper.toDto(entry.getValue());
                    return new GameGroupDTO(title, gameDTOs);
                })
                .collect(Collectors.toList());

        return new GameScreenDTO("JOGOS", groups);
    }
    
    private String getTitleForStatus(GameStatus status) {
        switch (status) {
            case AO_VIVO: return "AO VIVO";
            case FINALIZADO: return "ENCERRADOS";
            case AGENDADO: return "AGENDADOS";
            default: return "OUTROS";
        }
    }
}