package com.selecaoglobocom.brasileirao_api.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.List;

@Entity
@Table(name = "games")
@Getter
@Setter
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY) // LAZY é melhor para performance
    @JoinColumn(name = "home_team_id", nullable = false)
    private Team homeTeam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "away_team_id", nullable = false)
    private Team awayTeam;

    @Column(name = "home_goals") // Opcional, mas boa prática para clareza
    private Integer homeGoals; // Integer (com 'I' maiúsculo) para permitir valores nulos

    @Column(name = "away_goals")
    private Integer awayGoals; // Integer permite nulos, 'int' não

    @Column(name = "game_date_time", nullable = false)
    private OffsetDateTime gameDateTime; // O tipo ideal para colunas com fuso horário

    @Column(nullable = false)
    private String stadium;

    @Enumerated(EnumType.STRING) // Diz ao JPA para salvar o NOME do enum ("AO_VIVO") e não o número (1)
    @Column(nullable = false)
    private GameStatus status;

    @OneToMany(
            mappedBy = "game", // 'game' é o nome do campo na entidade GameEvent que aponta de volta para Game
            cascade = CascadeType.ALL, // Se apagar um jogo, apaga os eventos associados
            orphanRemoval = true,
            fetch = FetchType.LAZY
    )
    private List<GameEvent> events;
}