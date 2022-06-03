/*
 * Created on 11.03.2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package de.oc.utils;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.Writer;

/**
 * Some simple file I-O primitives reimplemented in Java.
 * All methods are static, since there is no state.
 * @version $Id: FileIO.java,v 1.14 2002/01/29 15:56:38 ian Exp $
 */
public class FileIO {

	/** Nobody should need to create an instance; all methods are static */
	private FileIO() { }

    /** Copy a file from one filename to another */
    public static void copyFile(String inName, String outName)
	throws FileNotFoundException, IOException {
		BufferedInputStream is = 
			new BufferedInputStream(new FileInputStream(inName));
		BufferedOutputStream os = 
			new BufferedOutputStream(new FileOutputStream(outName));
		copyFile(is, os, true);
	}

	/** Copy a file from an opened InputStream to opened OutputStream */
	public static void copyFile(InputStream is, OutputStream os, boolean close) 
	throws IOException {
		int b;				// the byte read from the file
		while ((b = is.read()) != -1) {
			os.write(b);
		}
		is.close();
		if (close)
			os.close();
    }

	/** Copy a file from an opened Reader to opened Writer */
	public static void copyFile(Reader is, Writer os, boolean close) 
	throws IOException {
		int b;				// the byte read from the file
		while ((b = is.read()) != -1) {
			os.write(b);
		}
		is.close();
		if (close)
			os.close();
    }

	/** Copy a file from a filename to a PrintWriter. */
	public static void copyFile(String inName, PrintWriter pw, boolean close) 
	throws FileNotFoundException, IOException {
		BufferedReader is = new BufferedReader(new FileReader(inName));
		copyFile(is, pw, close);
	}

	/** Open a file and read the first line from it. */
	public static String readLine(String inName)
	throws FileNotFoundException, IOException {
		BufferedReader is = new BufferedReader(new FileReader(inName));
		String line = null;
		line = is.readLine();
		is.close();
		return line;
	}

	/** The size of blocking to use */
	protected static final int BLKSIZ = 8192;

	/** Copy a data file from one filename to another, alternate method.
	 * As the name suggests, use my own buffer instead of letting
	 * the BufferedReader allocate and use the buffer.
	 */
	public void copyFileBuffered(String inName, String outName) throws
			FileNotFoundException, IOException {
		InputStream is = new FileInputStream(inName);
		OutputStream os = new FileOutputStream(outName);
		int count = 0;		// the byte count
		byte b[] = new byte[BLKSIZ];	// the bytes read from the file
		while ((count = is.read(b)) != -1) {
			os.write(b, 0, count);
		}
		is.close();
		os.close();
	}

	/** Read the entire content of a Reader into a String */
	public static String readerToString(Reader is) throws IOException {
		StringBuffer sb = new StringBuffer();
		char[] b = new char[BLKSIZ];
		int n;

		// Read a block. If it gets any chars, append them.
		while ((n = is.read(b)) > 0) {
			sb.append(b, 0, n);
		}

		// Only construct the String object once, here.
		return sb.toString();
	}

	/** Read the content of a Stream into a String */
	public static String inputStreamToString(InputStream is)
	throws IOException {
		return readerToString(new InputStreamReader(is));
	}

	/** Write a String as the entire content of a File */
	public static void stringToFile(String text, String fileName)
	throws IOException {
		BufferedWriter os = new BufferedWriter(new FileWriter(fileName));
		os.write(text);
		os.flush();
		os.close();
	}

	/** Open a BufferedReader from a named file. */
	public static BufferedReader openFile(String fileName)
	throws IOException {
		return new BufferedReader(new FileReader(fileName));
	}
	
	public static String fileToString(String filename) throws IOException {
		StringBuffer sb = new StringBuffer();
		BufferedReader brIn = new BufferedReader(new FileReader(filename));
		int c;

		while ((c = brIn.read()) != -1) {
			sb.append((char) c);
		}
		brIn.close();

		return sb.toString();
	}

	/**
	 * Deletes all files and subdirectories under "dir".
	 * @param dir Directory to be deleted
	 * @return boolean Returns "true" if all deletions were successful.
	 *                 If a deletion fails, the method stops attempting to 
	 *                 delete and returns "false".
	 */
	public static boolean deleteDir(File dir) {

		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i=0; i<children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}

		// The directory is now empty so now it can be smoked
		return dir.delete();
	}
	
	/**
	 * Delete files with certain suffixes from a directory, recursively
	 * 
	 * @param dir
	 * @return
	 */
	public static void deleteFiles(File dir, String[] fileFilter) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			
			for (int i=0; i<children.length; i++) {
				deleteFiles(new File(dir, children[i]), fileFilter);
			}
		}else {
			// check matching filename, then delete
			for (int i = 0; i < fileFilter.length; i++) {
				if (dir.getName().matches(fileFilter[i])){
					System.out.println("delete " + dir.getName());
					dir.delete();
				}
			}
		}
	}
	
	public static void main(String[] args) {
		//deleteFiles(new File("/Users/daust/Downloads/sample2/opal-tools/lib"), new String[] {".*\\.jar"});
		deleteFiles(new File("/private/tmp/sample2/opal-tools/lib"), new String[] {".*\\.jar"});
	}

}
