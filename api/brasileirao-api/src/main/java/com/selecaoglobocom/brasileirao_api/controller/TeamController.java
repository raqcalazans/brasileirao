package com.selecaoglobocom.brasileirao_api.controller;

import com.selecaoglobocom.brasileirao_api.model.Team;
import com.selecaoglobocom.brasileirao_api.repository.TeamRepository; 
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/teams")
@Tag(name = "Times", description = "Endpoints para gerenciamento de informações de times")
public class TeamController {

    @Autowired 
    private TeamRepository teamRepository;

    @Operation(summary = "Lista todos os times disponíveis")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de times retornada com sucesso",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Team.class)))
    })
    @GetMapping 
    public List<Team> getAllTeams() {
        return teamRepository.findAll(); 
    }

    @Operation(summary = "Retorna os detalhes de um time específico por ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Detalhes do time retornados",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Team.class))),
            @ApiResponse(responseCode = "404", description = "Time não encontrado")
    })
    @GetMapping("/{id}") 
    public ResponseEntity<Team> getTeamById(
            @Parameter(description = "ID do time a ser buscado", example = "1")
            @PathVariable Long id) { 
        Optional<Team> team = teamRepository.findById(id); 

        return team.map(ResponseEntity::ok) 
                   .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Time não encontrado com o ID: " + id));
    }
}