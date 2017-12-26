package com.mikolenko.oksana.database.persistense.entry;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class FlatEntry {
    public String flatAddress;
    public String flatType;
    public String flatDescription;
    public int flatPrice;
    public String path;

}
