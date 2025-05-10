package lk.sliit.taxibooking.taxibooking.fileHandler;

import lk.sliit.taxibooking.taxibooking.User;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public enum FilePathManager {
    INSTANCE;

    private final Map<Class<?>, String> pathMap = new HashMap<>();

    FilePathManager() {
        pathMap.put(User.class, "users.txt");
    }

    public String getFilePath(Class<?> clazz) {
        if (!pathMap.containsKey(clazz)) {
            throw new IllegalArgumentException("No file path mapped for class: " + clazz.getName());
        }
        String baseDirectory = "C:/Users/senal/OneDrive/Desktop/oop_data";
        return baseDirectory + File.separator + pathMap.get(clazz);
    }
}
