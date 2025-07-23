package com.selecaoglobocom.brasileirao_api.controller;

import com.selecaoglobocom.brasileirao_api.model.Game;
import com.selecaoglobocom.brasileirao_api.repository.GameRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Optional;

@RestController 
@RequestMapping("/api/v1/games") 
@Tag(name = "Jogos", description = "Endpoints para gerenciamento de jogos do Brasileirão")
public class GameController {

    @Autowired
    private GameRepository gameRepository;

    @Operation(summary = "Lista todos os jogos ou filtra por status, data ou time")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de jogos retornada com sucesso",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Game.class))),
            @ApiResponse(responseCode = "400", description = "Parâmetro de data inválido")
    })
    @GetMapping 
    public List<Game> getAllGames(
            @Parameter(description = "Status do jogo (AGENDADO, FINALIZADO, AO_VIVO)")
            @RequestParam(required = false) String status,
            @Parameter(description = "Data do jogo no formato YYYY-MM-DD")
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
            @Parameter(description = "ID do time (ex: 1, 2, 3...)")
            @RequestParam(required = false) Long teamId) {

        if (status != null) {
            return gameRepository.findByStatus(status.toUpperCase());
        }
        if (date != null) {
            OffsetDateTime startOfDay = date.atStartOfDay().atOffset(ZoneOffset.UTC);
            OffsetDateTime endOfDay = date.plusDays(1).atStartOfDay().atOffset(ZoneOffset.UTC);
            return gameRepository.findByGameDateTimeBetween(startOfDay, endOfDay);
        }
        if (teamId != null) {
            return gameRepository.findByHomeTeamIdOrAwayTeamId(teamId, teamId);
        }

        return gameRepository.findAllWithTeams();
    }

    @Operation(summary = "Retorna os detalhes de um jogo específico por ID, incluindo seus eventos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Detalhes do jogo retornados",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Game.class))),
            @ApiResponse(responseCode = "404", description = "Jogo não encontrado")
    })
    @GetMapping("/{id}")
    public ResponseEntity<Game> getGameById(
            @Parameter(description = "ID do jogo a ser buscado", example = "101")
            @PathVariable Long id) {

        Optional<Game> game = gameRepository.findByIdWithEvents(id);
        
        return game.map(ResponseEntity::ok)
                   .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Jogo não encontrado com o ID: " + id));
    }
}