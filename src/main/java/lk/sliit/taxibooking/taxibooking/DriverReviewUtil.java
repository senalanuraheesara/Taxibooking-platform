package lk.sliit.taxibooking.taxibooking;

import java.io.*;
import java.util.*;

public class DriverReviewUtil {

    public static List<String[]> getReviewsByName(String driverName, String filePath) {
        List<String[]> reviews = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",", 4); // ID, Rating, Comment, Date
                if (parts.length == 4 && parts[0].equalsIgnoreCase(driverName)) {
                    reviews.add(parts); // [name, rating, comment, date]
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return reviews;
    }
}
