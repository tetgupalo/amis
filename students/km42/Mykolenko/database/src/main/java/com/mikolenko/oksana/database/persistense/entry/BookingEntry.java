package com.mikolenko.oksana.database.persistense.entry;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;
import  java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookingEntry {
public Integer Id;
public String  Status;
public Date StartDate;
public Date FinishDate;
public Integer HostIdFk;
public Integer GuestIdFk;
public String FlatAddressFk;
}
