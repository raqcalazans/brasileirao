// src/main/java/com/brasileirao/mapper/GameMapper.java
package com.selecaoglobocom.brasileirao_api.mapper;

import com.selecaoglobocom.brasileirao_api.dto.GameDTO;
import com.selecaoglobocom.brasileirao_api.dto.GameEventDTO;
import com.selecaoglobocom.brasileirao_api.dto.TeamDTO;
import com.selecaoglobocom.brasileirao_api.entity.Game;
import com.selecaoglobocom.brasileirao_api.entity.GameEvent;
import com.selecaoglobocom.brasileirao_api.entity.Team;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class GameMapper {

    public GameDTO toDto(Game game) {
        if (game == null) {
            return null;
        }

        GameDTO dto = new GameDTO();
        dto.setId(game.getId());
        dto.setHomeGoals(game.getHomeGoals());
        dto.setAwayGoals(game.getAwayGoals());
        dto.setGameDateTime(game.getGameDateTime());
        dto.setStadium(game.getStadium());
        dto.setStatus(game.getStatus().name()); // Converte o enum para String

        dto.setHomeTeam(toDto(game.getHomeTeam()));
        dto.setAwayTeam(toDto(game.getAwayTeam()));

        // Mapeia a lista de eventos, se existir
        if (game.getEvents() != null) {
            List<GameEventDTO> eventDTOs = game.getEvents().stream()
                    .map(eventEntity -> toDto(eventEntity, game))
                    .collect(Collectors.toList());
            dto.setEvents(eventDTOs);
        } else {
            dto.setEvents(Collections.emptyList());
        }

        return dto;
    }

    public List<GameDTO> toDto(List<Game> games) {
        return games.stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    // Método auxiliar para eventos que calcula o timeInGame
    private GameEventDTO toDto(GameEvent event, Game parentGame) {
        if (event == null) {
            return null;
        }
        GameEventDTO dto = new GameEventDTO();
        dto.setId(event.getId());
        dto.setDescription(event.getDescription());

        // **LÓGICA CENTRAL: CALCULA O TEMPO DE JOGO**
        Duration duration = Duration.between(parentGame.getGameDateTime(), event.getEventTime());
        long minutes = duration.toMinutes();
        dto.setTimeInGame(String.format("%d'", minutes));

        return dto;
    }

    // Método auxiliar para times
    private TeamDTO toDto(Team team) {
        if (team == null) {
            return null;
        }
        TeamDTO dto = new TeamDTO();
        dto.setId(team.getId());
        dto.setName(team.getName());
        dto.setAcronym(team.getAcronym());
        dto.setLogoURL(team.getLogoUrl());
        dto.setDescription(team.getDescription());
        return dto;
    }
}