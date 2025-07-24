package com.selecaoglobocom.brasileirao_api.dto;

import lombok.Data;
import java.time.OffsetDateTime;
import java.util.List;

@Data
public class GameDTO {

    private Integer id;

    private TeamDTO homeTeam;

    private TeamDTO awayTeam;

    private Integer homeGoals;

    private Integer awayGoals;

    private OffsetDateTime gameDateTime;

    private String stadium;

    private String status;

    private List<GameEventDTO> events;
}