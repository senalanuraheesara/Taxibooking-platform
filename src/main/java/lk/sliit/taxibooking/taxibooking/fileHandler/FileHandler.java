package lk.sliit.taxibooking.taxibooking.fileHandler;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

public class FileHandler {
    private static final String DELIMITER = "%%";

    public <T extends Serializable> void save(String key, T data) throws IOException {
        Class<?> clazz = data.getClass();
        Map<String, T> existingData = readAll((Class<T>) clazz);
        existingData.put(key, data);
        writeData((Class<T>) clazz, existingData);
    }

    public <T extends Serializable> T read(String key, Class<T> clazz) throws IOException, ClassNotFoundException {
        return readAll(clazz).get(key);
    }

    @SuppressWarnings("unchecked")
    public <T extends Serializable> Map<String, T> readAll(Class<T> clazz) throws IOException {
        String filePath = FilePathManager.INSTANCE.getFilePath(clazz);
        File file = new File(filePath);

        if (!file.exists()) return new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            Map<String, T> result = new HashMap<>();
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(DELIMITER, 2);
                if (parts.length == 2) {
                    try {
                        T value = deserialize(parts[1], clazz);
                        result.put(parts[0], value);
                    } catch (RuntimeException e) {
                        System.err.println("Skipping corrupted entry for key: " + parts[0]);
                    }
                }
            }
            return result;
        }
    }

    public <T extends Serializable> void delete(String key, Class<T> clazz) throws IOException {
        Map<String, T> existingData = readAll(clazz);
        existingData.remove(key);
        writeData(clazz, existingData);
    }

    private <T extends Serializable> void writeData(Class<T> clazz, Map<String, T> data) throws IOException {
        String filePath = FilePathManager.INSTANCE.getFilePath(clazz);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Map.Entry<String, T> entry : data.entrySet()) {
                writer.write(entry.getKey() + DELIMITER + serialize(entry.getValue()));
                writer.newLine();
            }
        }
    }

    private <T extends Serializable> String serialize(T obj) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
             ObjectOutputStream oos = new ObjectOutputStream(baos)) {

            oos.writeObject(obj);
            return Base64.getEncoder().encodeToString(baos.toByteArray());
        } catch (IOException e) {
            throw new RuntimeException("Serialization error", e);
        }
    }

    private <T> T deserialize(String base64String, Class<T> clazz) {
        byte[] data = Base64.getDecoder().decode(base64String);
        try (ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(data))) {
            return clazz.cast(ois.readObject());
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException("Deserialization error", e);
        }
    }
}
