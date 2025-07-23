package com.selecaoglobocom.brasileirao_api.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "games")
@Data
@EqualsAndHashCode(exclude = {"homeTeam", "awayTeam", "events"}) 
@ToString(exclude = {"homeTeam", "awayTeam", "events"}) 
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "home_team_id")
    private Team homeTeam;

    @ManyToOne
    @JoinColumn(name = "away_team_id")
    private Team awayTeam;

    private Integer homeGoals;
    private Integer awayGoals;
    private OffsetDateTime gameDateTime;
    private String stadium;
    private String status;

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL, orphanRemoval = true)
    // mappedBy = "game": Indica que o campo 'game' na classe GameEvent é o dono do relacionamento.
    // cascade = CascadeType.ALL: Operações (persist, remove, merge) no Game serão cascateadas para GameEvents.
    // orphanRemoval = true: Se um GameEvent for removido da lista 'events' de um Game, ele será deletado do DB.
    private List<GameEvent> events = new ArrayList<>();
}