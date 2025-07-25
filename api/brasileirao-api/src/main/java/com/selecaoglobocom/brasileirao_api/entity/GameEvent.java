package com.selecaoglobocom.brasileirao_api.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;

@Entity
@Table(name = "game_events")
@Getter
@Setter
public class GameEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String description;

    @Column(name = "event_time", nullable = false)
    private OffsetDateTime eventTime;

    /**
     * Define o relacionamento "Muitos-para-Um" com a entidade Game.
     * Muitos eventos pertencem a um único jogo.
     * A coluna 'game_id' na tabela 'game_events' é a chave estrangeira.
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;
}