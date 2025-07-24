package com.selecaoglobocom.brasileirao_api.dto;

import lombok.Data;
import java.net.URL;

@Data
public class TeamDTO {
    private int id;
    private String name;
    private String acronym;
    private URL logoURL;
    private String description;
}
