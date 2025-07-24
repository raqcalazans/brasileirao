// src/main/java/com/brasileirao/repository/GameRepository.java
package com.selecaoglobocom.brasileirao_api.repository;

import com.selecaoglobocom.brasileirao_api.entity.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameRepository extends JpaRepository<Game, Integer> {

    /**
     * Busca todos os jogos, já trazendo os relacionamentos de times e eventos
     * em uma única consulta para otimizar a performance (evita o problema N+1).
     */
    @Query("SELECT g FROM Game g " +
           "LEFT JOIN FETCH g.homeTeam " +
           "LEFT JOIN FETCH g.awayTeam " +
           "LEFT JOIN FETCH g.events")
    List<Game> findAllWithTeamsAndEvents();
}