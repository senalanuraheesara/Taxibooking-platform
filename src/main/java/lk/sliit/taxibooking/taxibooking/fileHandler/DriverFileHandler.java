package lk.sliit.taxibooking.taxibooking.fileHandler;

import lk.sliit.taxibooking.taxibooking.DriverDetails;

import java.io.*;
import java.util.*;

public class DriverFileHandler {

    public static List<DriverDetails> loadDriversFromFile(String usersFilePath) throws IOException {
        List<DriverDetails> drivers = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(usersFilePath));
        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && parts[5].equalsIgnoreCase("driver")) {
                drivers.add(new DriverDetails(parts[0], parts[1], parts[2], parts[4]));
                System.out.println("passowrd"+parts[3]);
            }
        }
        br.close();
        return drivers;
    }

    public static List<DriverDetails> loadDriversFromDetailsFile(String filePath) throws IOException {
        List<DriverDetails> drivers = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) return drivers;

        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 9) {
                DriverDetails d = new DriverDetails(parts[0], parts[1], parts[2], parts[3]);
                d.setLicenseNumber(parts[4]);
                d.setVehicleType(parts[5]);
                d.setWorkStatus(parts[6]);
                d.setExperience(Integer.parseInt(parts[7]));
                d.setRating(Double.parseDouble(parts[8]));
                drivers.add(d);
            }
        }
        br.close();
        return drivers;
    }

    public static void loadRatingsFromFile(List<DriverDetails> drivers, String reviewsFilePath) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(reviewsFilePath));
        Map<String, List<Integer>> ratingMap = new HashMap<>();
        String line;

        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",", 4); // name,rating,comment,date
            if (parts.length >= 2) {
                String name = parts[0].trim();
                int rating;
                try {
                    rating = Integer.parseInt(parts[1].trim());
                } catch (NumberFormatException e) {
                    continue; // Skip invalid ratings
                }
                ratingMap.computeIfAbsent(name, k -> new ArrayList<>()).add(rating);
            }
        }
        br.close();

        for (DriverDetails d : drivers) {
            List<Integer> ratings = ratingMap.get(d.getName().trim());
            if (ratings != null && !ratings.isEmpty()) {
                double avg = 0.0;
                for (int r : ratings) {
                    avg += r;
                }
                d.setRating(avg / ratings.size());
            } else {
                d.setRating(0.0); // no ratings
            }
        }
    }



    public static void sortDriversByRating(List<DriverDetails> drivers) {
        for (int i = 0; i < drivers.size() - 1; i++) {
            for (int j = 0; j < drivers.size() - i - 1; j++) {
                if (drivers.get(j).getRating() < drivers.get(j + 1).getRating()) {
                    DriverDetails temp = drivers.get(j);
                    drivers.set(j, drivers.get(j + 1));
                    drivers.set(j + 1, temp);
                }
            }
        }
    }


    public static void writeDriversToFile(List<DriverDetails> drivers, String filePath) throws IOException {
        File file = new File(filePath);
        file.getParentFile().mkdirs();

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            for (DriverDetails d : drivers) {
                if (d.getLicenseNumber() != null) {
                    bw.write(d.getUserID() + "," + d.getName() + "," + d.getEmail() + "," + d.getPhoneNumber() + ","
                            + d.getLicenseNumber() + "," + d.getVehicleType() + "," + d.getWorkStatus() + ","
                            + d.getExperience() + "," + d.getRating());
                    bw.newLine();
                }
            }
        }
    }
}
