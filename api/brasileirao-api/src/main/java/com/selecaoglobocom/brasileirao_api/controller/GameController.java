// src/main/java/com/brasileirao/controller/GameController.java
package com.selecaoglobocom.brasileirao_api.controller;

import com.selecaoglobocom.brasileirao_api.dto.GameDTO;
import com.selecaoglobocom.brasileirao_api.service.GameService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/games") // Define o endpoint base para este controller
@CrossOrigin(origins = "*") // Permite que o app iOS (ou qualquer cliente) acesse a API
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @GetMapping
    public List<GameDTO> getAllGames() {
        return gameService.findAllGames();
    }
}