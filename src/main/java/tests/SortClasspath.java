package tests;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class SortClasspath {

    public static void main(String[] args) {
        java.util.List wanted = new java.util.ArrayList();
        
     // Get the classpath entries as a string
        String classpath = System.getProperty("java.class.path");
        
        // Split the classpath into individual entries based on the platform separator
        String[] classpathEntries = classpath.split(System.getProperty("path.separator"));
        
        // Convert the array to an ArrayList
        ArrayList<String> classpathList = new ArrayList<>(Arrays.asList(classpathEntries));
        
        // Sort the classpath entries
        Collections.sort(classpathList);
        
        // Print the sorted classpath entries
        for (String entry : classpathList) {
            System.out.println(entry);
        }        
        

    }

}
