package com.mikolenko.oksana.database.utils;

import java.io.File;
import java.net.URL;
import java.util.Enumeration;

public class GetImage {
    public String getImage(String path) {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("public/img/" + path).getFile());
        return "/img/"+path;
    }
}
