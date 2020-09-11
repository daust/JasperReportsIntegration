package de.oc.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;



public class UpdateWebXmlFile {

	/**
	 * @param args arguments to the main function
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
		 * Extract files: web.xml
		 */
		// create destination directory if it doesn't exist.
		File d = new File(destDir);
		if (!d.exists())
			d.mkdir();

		java.util.jar.JarFile jar = new java.util.jar.JarFile(warFileName);

		java.util.Enumeration<?> jarEntryEnum = jar.entries();
		while (jarEntryEnum.hasMoreElements()) {
			java.util.jar.JarEntry file = (java.util.jar.JarEntry) jarEntryEnum
					.nextElement();

			if (file.getName().contains("web.xml")) {
				// java.io.File f = new java.io.File(destDir +
				// java.io.File.separator + file.getName());
				java.io.File f = new java.io.File(destDir
						+ java.io.File.separator + "web.xml");
				System.out.println("process " + f.getAbsolutePath());
				java.io.InputStream is = jar.getInputStream(file); // get the
																	// input
																	// stream
				java.io.FileOutputStream fos = new java.io.FileOutputStream(f);
				while (is.available() > 0) { // write contents of 'is' to 'fos'
					fos.write(is.read());
				}
				fos.close();
				is.close();
			}
		}
		jar.close();

		
		saveMe(warFileName, warFileName+"_new.war");
		
		/*
		 * Modify web.xml file
		 */

		/*
		 * Create new archive
		 */

		/*
		 * Rename files
		 */

		System.out.println("done!");
	}

public static void saveMe(String origWarFilePath, String newWarFilePath) throws IOException{
	ZipFile zipFile = new ZipFile(origWarFilePath);
	final ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(newWarFilePath));
	
	
	for(Enumeration<?> e = zipFile.entries(); e.hasMoreElements(); ) {
	    ZipEntry entryIn = (ZipEntry) e.nextElement();
	    if(!entryIn.getName().contains("web.xml")){
	        zos.putNextEntry(entryIn);
	        InputStream is = zipFile.getInputStream(entryIn);
	        byte [] buf = new byte[1024];
	        int len;
	        while((len = (is.read(buf))) > 0) {            
	            zos.write(buf, 0, len);
	        }
	    }
	    else{
	    	System.out.println("process web.xml");
	        zos.putNextEntry(new ZipEntry(entryIn.getName()));

	                InputStream is = zipFile.getInputStream(entryIn);
	                byte[] buf = new byte[1024];
	                int len;
	                while ((len = (is.read(buf))) > 0) {
	                    String s = new String(buf);
	                    if (s.contains("oc.jasper.config.home")) {
	                    	System.out.println("replace config.home");
	                        buf = s.replaceAll("(?ms)<context-param>.*<param-name>oc.jasper.config.home</param-name>.*?</context-param>", "DUMMY").getBytes();
	                    }
	                    zos.write(buf, 0, (len < buf.length) ? len : buf.length);
	                }
	    }
	    zos.closeEntry();
	}
	zos.close();
	zipFile.close();
}
	
	
}
