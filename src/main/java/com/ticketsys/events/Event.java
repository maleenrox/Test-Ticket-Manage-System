package com.ticketsys.events;

import com.ticketsys.utils.*;

import java.io.*;

public class Event  {


    public Event() throws IOException {
    }

    public static void sortEvents(String eventSortPath) throws IOException {
        File eventSortFile = new File(eventSortPath);

        BufferedReader reader1 = null;
        BufferedReader reader = new BufferedReader(new FileReader(eventSortFile));
        StringBuilder sb = new StringBuilder();

        try{
            System.out.println("\t\t\tSystem (DBElementUpdater): Reading file...");
            // Read the file
            String line;
            int lineCount = 0;
            reader1 = new BufferedReader(new FileReader(eventSortFile));
            while (reader1.readLine() != null) {
                lineCount++;
                System.out.println(lineCount);
            }
            long[] eventDates = new long[lineCount];

            int i = 0;
            System.out.println( "\t\t\tSystem (DBElementUpdater): Updating file...");
            while ((line = reader.readLine()) != null) {
                System.out.println("\t\t\tSystem (DBElementUpdater): Checking credentials...");
                String[] parts = line.split(":");
                eventDates[i] = Long.parseLong(parts[1]);
                System.out.println(eventDates[i]);
                i++;
            }
            System.out.println(eventDates.length);

            long[] sortedDates = MergeSort.mergeSort(eventDates);
            System.out.println("\t\t\tSystem (DBElementUpdater): Sorting dates...");
            System.out.println(sortedDates.length);

            for (int j = sortedDates.length-1; j >= 0; j--) {
                System.out.println("\t\t\tSystem (DBElementUpdater): Sorting");
                System.out.println(sortedDates[j]);
                System.out.println(Long.toString(sortedDates[j]));
                sb.append(DBElementGetter.getElement(eventSortFile,Long.toString(sortedDates[j]),2,1,0,69)).append(":").append(sortedDates[j]).append("\n");
            }

            System.out.println(sb.toString().trim());

            BufferedWriter writer = null;
            writer = new BufferedWriter(new FileWriter(eventSortFile));
            writer.write(sb.toString().trim());
            writer.flush();

            System.out.println(sb.toString().trim());
        }
        catch (Exception e)  {
            System.out.println( "\t\t\tSystem (DBElementUpdater): Error in updating file...");
            e.printStackTrace();
        }
//        finally {
//            try {
//                if (writer != null) {
//                    writer.close(); // Always close the writer
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
    }
}
