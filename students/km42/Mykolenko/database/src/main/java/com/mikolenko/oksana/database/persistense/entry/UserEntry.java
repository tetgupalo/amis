package com.mikolenko.oksana.database.persistense.entry;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEntry {
    private String firstName;
    private String secondName;
    private String email;
    private String password;
    private Integer type;

}
