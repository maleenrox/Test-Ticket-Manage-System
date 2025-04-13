package com.ticketsys.utils;

import java.io.*;

public class FilePathReader {
    public static String getPathFromResources(int targetLine) throws IOException {
        InputStream inputStream = FilePathReader.class.getClassLoader().getResourceAsStream("data/db_paths.txt");
        if (inputStream == null) {
            System.out.println("data_paths.txt not found in classpath");
            return null;
        }

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            int lineCount = 0;

            while ((line = reader.readLine()) != null) {
                lineCount++;
                if (lineCount == targetLine) {
                    return line;
                }
            }
        }

        return null; // Not enough lines
    }
}
