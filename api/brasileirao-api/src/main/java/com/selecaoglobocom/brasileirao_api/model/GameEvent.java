package com.selecaoglobocom.brasileirao_api.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.time.OffsetDateTime;

@Entity
@Table(name = "game_events")
@Data
@EqualsAndHashCode(exclude = "game")
@ToString(exclude = "game")
public class GameEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String description;
    private OffsetDateTime eventTime;

    @ManyToOne
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    public GameEvent() {}

    public GameEvent(String description, OffsetDateTime eventTime, String eventType, Game game) {
        this.description = description;
        this.eventTime = eventTime;
        this.game = game;
    }
}