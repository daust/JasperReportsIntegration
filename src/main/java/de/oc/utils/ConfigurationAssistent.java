package de.oc.utils;

import java.io.File;
import java.io.IOException;

public class ConfigurationAssistent {

	/**
	 * @param args arguments to the main function
	 * 
	 * @throws IOException default
	 */
	public static void main(String[] args) throws IOException {
		String warFileName = args[0];
		String destDir = warFileName + ".tmp";
		
		System.out.println("warFileName:" + warFileName);
		System.out.println("destDir:" + destDir);
		
		// check file existence
		// check dir existence

		/*
		 * Extract files
		 */
		// create destination directory if it doesn't exist.
		File d = new File(destDir);
		if (!d.exists()) 
			d.mkdir();
		
		java.util.jar.JarFile jar = new java.util.jar.JarFile(warFileName);
		java.util.Enumeration<?> jarEntryEnum = jar.entries();
		while (jarEntryEnum.hasMoreElements()) {
			java.util.jar.JarEntry file = (java.util.jar.JarEntry) jarEntryEnum.nextElement();
			java.io.File f = new java.io.File(destDir + java.io.File.separator + file.getName());
			System.out.println("process " + f.getAbsolutePath() );
			if (file.isDirectory()) { // if its a directory, create it
				f.mkdir();
				continue;
			}
			java.io.InputStream is = jar.getInputStream(file); // get the input stream
			java.io.FileOutputStream fos = new java.io.FileOutputStream(f);
			while (is.available() > 0) {  // write contents of 'is' to 'fos'
				fos.write(is.read());
			}
			fos.close();
			is.close();
		}
		jar.close();
		
		/*
		 * Modify web.xml file
		 */
		
		
		/*
		 * Create new archive
		 */
		
		
		/*
		 * Rename files
		 */
		
		System.out.println("done!" );
	}
}
