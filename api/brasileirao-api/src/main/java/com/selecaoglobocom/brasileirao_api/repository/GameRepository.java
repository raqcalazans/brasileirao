package com.selecaoglobocom.brasileirao_api.repository;

import com.selecaoglobocom.brasileirao_api.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface GameRepository extends JpaRepository<Game, Long> {
    List<Game> findByStatus(String status);
    List<Game> findByGameDateTimeBetween(OffsetDateTime startOfDay, OffsetDateTime endOfDay);

    // Para buscar jogos de um time (seja home ou away)
    List<Game> findByHomeTeamIdOrAwayTeamId(Long homeTeamId, Long awayTeamId);

    @Query("SELECT g FROM Game g LEFT JOIN FETCH g.events WHERE g.id = :id")
    Optional<Game> findByIdWithEvents(Long id);

    // Query para buscar todos os Games e seus times (home e away) juntos, evitando N+1
    @Query("SELECT g FROM Game g JOIN FETCH g.homeTeam JOIN FETCH g.awayTeam")
    List<Game> findAllWithTeams(); // Para a lista de jogos, para evitar N+1 para os times
}