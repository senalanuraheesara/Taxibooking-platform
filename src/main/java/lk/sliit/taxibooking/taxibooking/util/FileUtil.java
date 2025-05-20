package lk.sliit.taxibooking.taxibooking.util;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {

    private static final String FILE_NAME = "reviews.txt"; // ✅ centralized name

    public static void appendToFile(ServletContext context, String content) throws IOException {
        String filePath = context.getRealPath("/data/" + FILE_NAME);
        if (filePath == null) {
            throw new IOException("Path to /data/ not found. Ensure /data/ exists inside webapp.");
        }

        File file = new File(filePath);
        if (!file.exists()) {
            file.getParentFile().mkdirs();  // create /data/ folder if needed
            file.createNewFile();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(content);
            writer.newLine();
        }

        System.out.println("✅ Review saved to: " + filePath);
    }

    public static List<String> readFile(ServletContext context) throws IOException {
        String filePath = context.getRealPath("/data/" + FILE_NAME);
        if (filePath == null) {
            throw new IOException("Path to /data/ not found. Ensure /data/ exists inside webapp.");
        }

        File file = new File(filePath);
        List<String> lines = new ArrayList<>();

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    lines.add(line);
                }
            }
        }

        return lines;
    }
}