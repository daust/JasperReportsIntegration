package main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Scanner;
import java.util.regex.MatchResult;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.configuration.HierarchicalINIConfiguration;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import de.oc.integration.jasper.webapp.AppConfig;

public class CommandLine {

	private final static Logger logger = Logger.getLogger(CommandLine.class);

	/**
	 * main function to run tests
	 * 
	 * @param args automatically passed by the Java environment (i.e. the list of parameters)
	 */
	public static void main(String[] args) {

		BasicConfigurator.configure(); // enough for configuring log4j
		Logger.getRootLogger().setLevel(Level.ERROR); // changing log level

		logger.info("CommandLine called ...");
		logger.debug("#arguments passed: " + args.length);

		int cntArguments = args.length;
		String arg0 = cntArguments > 0 ? args[0] : "";
		String arg1 = cntArguments > 1 ? args[1] : "";
		String arg2 = cntArguments > 2 ? args[2] : "";

		// no parameter were passed
		if (cntArguments == 0) {
			showHelpJavaCall();

		} else if (arg0.toLowerCase().equals("encryptpasswords")) {
			/*
			 * encryptPasswords
			 */
			if (cntArguments < 2) {
				System.err
						.println("Please specify the application.properties file.");
				showHelp(arg0);
				System.exit(-1);
			}
			encryptPasswords(arg1);

		} else if (arg0.toLowerCase().equals("setconfigdir")) {
			/*
			 * setConfigDir
			 */
			if (cntArguments < 3) {
				System.err
						.println("Please specify the path to the JasperReportsIntegration.war file and the configuration directory.");
				showHelp(arg0);
				System.exit(-1);
			}
			setConfigDir(arg1, arg2);

		} else if (arg0.toLowerCase().equals("getconfigdir")) {
			/*
			 * getConfigDir
			 */
			if (cntArguments < 2) {
				System.err
						.println("Please specify the path to the JasperReportsIntegration.war.");
				showHelp(arg0);
				System.exit(-1);
			}
			System.out.println("ConfigDir: " + getConfigDir(arg1));

		} else if (args[0].toLowerCase().equals("validate")) {
			validateConfigFile(arg1);

		} else {
			logger.error("unknown command: " + args[0].toLowerCase());
			System.exit(-1);
		}
	}

	/**
	 * validateConfigFile ...
	 * 
	 * @param configFileName Name of the configuration file
	 * 
	 */
	public static void validateConfigFile(String configFileName) {
		HierarchicalINIConfiguration props = new HierarchicalINIConfiguration();

		File configFile = new File(configFileName);

		// does the file actually exist?
		if (!configFile.exists()) {
			throw new RuntimeException("File " + configFileName
					+ " cannot be found.");
		}

		// load the configuration
		logger.info("Using file: " + configFileName);

		// ----------------------------------------------------
		// Read config file
		// ----------------------------------------------------
		props = AppConfig.getInstance().loadApplicationProperties(
				configFileName);
		AppConfig.getInstance().logApplicationProperties();

		// loop over datasource-sections
		Iterator<String> it = props.getSections().iterator();
		while (it.hasNext()) {
			String sectionName = (String) it.next();
			logger.trace("process section=" + sectionName);

			if (sectionName.startsWith("datasource:")) {
				logger.trace("datasource section found=" + sectionName);
				String dsName = sectionName.split(":")[1];
				String dsUsername = props.getString(sectionName + ".username");
				// String dsPassword = props.getString(sectionName +
				// ".password");

				logger.info("dsName: " + dsName);
				logger.info("dsUsername: " + dsUsername);

				// dsPassword = getEncryptedPWD(dsPassword);
			}
		}
	}

	/**
	 * encryptPasswords
	 * 
	 * @param configFilename name of the configuration file
	 * 
	 */
	public static void encryptPasswords(String configFilename) {
		String tmpFilename = configFilename + ".tmp.properties";

		logger.info("encryptPasswords(" + configFilename + ")");

		File configFile = new File(configFilename);

		// does the file actually exist?
		if (!configFile.exists()) {
			System.err.println("Configuration file could not be found: "
					+ configFilename);
			System.exit(-1);
		}

		BufferedReader br = null;
		PrintWriter pw = null;

		try {
			br = new BufferedReader(new FileReader(configFilename));
			pw = new PrintWriter(new FileWriter(tmpFilename));

			String line;
			while ((line = br.readLine()) != null) {
				// if line contains pwd, then encrypt it
				if (line.trim().startsWith("password")) {
					String pwd = line.substring(line.indexOf("=") + 1);
					logger.debug("pwd=" + pwd);
					line = "password="
							+ AppConfig.getInstance().encryptPWD(pwd);
				}
				pw.println(line);
			}

			br.close();
			pw.close();

			// Move files
			new File(configFilename).delete();
			new File(tmpFilename).renameTo(new File(configFilename));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * setConfigDir sets the new path of the configuration dir in the .war file
	 * 
	 * @param warFilename name of the war file (the fully specified path)
	 * @param configDirname the fully qualified path to the configuration directory 
	 * 
	 */
	public static void setConfigDir(String warFilename, String configDirname) {
		logger.info("setConfigDir(" + configDirname + ") for war file: "
				+ warFilename);

		File configDir = new File(configDirname);
		File warFile = new File(warFilename);
		File tmpWarFile = new File(warFilename + ".tmp.war");

		// does the file actually exist?
		if (!configDir.exists()) {
			System.err
					.println("WARNING: Configuration directory could not be found: "
							+ configDirname);
			// System.exit(-1);
		}
		// does the war file actually exist?
		if (!warFile.exists()) {
			System.err
					.println("War file (JasperReportsIntegration.war) could not be found: "
							+ warFilename);
			System.exit(-1);
		}

		// now update the web.xml file by creating a new war file
		try {
			updateWebXML(warFilename, warFilename + ".tmp.war", configDirname);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// now delete the original file and rename the new to the old
		
		warFile.delete();
		
		tmpWarFile.renameTo(new File(warFilename));
	}

	public static void updateWebXML(String origWarFilePath,
			String newWarFilePath, String configDirname) throws IOException {
		ZipFile zipFile = new ZipFile(origWarFilePath);
		ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(
				newWarFilePath));

		logger.info("create new war file: " + newWarFilePath);
		String newConfigDirName = configDirname.replaceAll("\\\\", "/");
		logger.info("canonical path for config dir: " + newConfigDirName);

		for (Enumeration<?> e = zipFile.entries(); e.hasMoreElements();) {
			ZipEntry entryIn = (ZipEntry) e.nextElement();
			if (!entryIn.getName().contains("web.xml")) {
				zos.putNextEntry(entryIn);
				InputStream is = zipFile.getInputStream(entryIn);
				byte[] buf = new byte[1024];
				int len;
				while ((len = (is.read(buf))) > 0) {
					zos.write(buf, 0, len);
				}
			} else {
				System.out.println("process web.xml");
				zos.putNextEntry(new ZipEntry(entryIn.getName()));

				InputStream is = zipFile.getInputStream(entryIn);
				byte[] buf = new byte[1024];
				int len;
				while ((len = (is.read(buf))) > 0) {
					String s = new String(buf);
					if (s.contains("oc.jasper.config.home")) {
						System.out.println("replace config.home");
						buf = s.replaceAll(
								"(?ms)<context-param>.*<param-name>oc.jasper.config.home</param-name>.*?</context-param>",
								"<context-param><param-name>oc.jasper.config.home</param-name><param-value>"
										+ newConfigDirName
										+ "</param-value></context-param>")
								.getBytes();
					}
					zos.write(buf, 0, (len < buf.length) ? len : buf.length);
				}
			}
			zos.closeEntry();
		}
		zos.close();
		
		// strange, cannot delete file on windows
		zipFile.close();
		
		logger.info("done!");
	}

	/**
	 * getConfigDir returns the directory path of the configuration directory
	 * 
	 * @param warFilename the name of the war file
	 * 
	 * @return the String pointing to the configuration directory
	 * 
	 */
	public static String getConfigDir(String warFilename) {
		String configDir = "";

		logger.info("getConfigDir for war file: " + warFilename);

		File warFile = new File(warFilename);

		// does the war file actually exist?
		if (!warFile.exists()) {
			System.err.println("War file could not be found: " + warFilename);
			System.exit(-1);
		}

		ZipFile zipFile;
		try {
			zipFile = new ZipFile(warFilename);
			for (Enumeration<?> e = zipFile.entries(); e.hasMoreElements();) {
				ZipEntry entryIn = (ZipEntry) e.nextElement();
				if (entryIn.getName().contains("web.xml")) {
					logger.info("process web.xml");

					InputStream is = zipFile.getInputStream(entryIn);
					
					Scanner sc = new Scanner(is, "UTF-8");
					Pattern p = Pattern.compile(
					    "<context-param>.*<param-name>oc.jasper.config.home</param-name>.*?<param-value>(.*?)</param-value></context-param>"
					);
					while (sc.findWithinHorizon(p, 0) != null)
					{
					  MatchResult m = sc.match();
					  configDir = m.group(1);
					}
					sc.close();
				}
			}
			zipFile.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		logger.info("done!");

		return configDir;
	}

	
	/**
	 * @param command the command to be passed on the command line, can be encryptpasswords,
	 * 	setconfigdir, ...
	 * 
	 */
	public static void showHelp(String command) {
		final String OS = System.getProperty("os.name").toLowerCase();
		
		System.out.println("");
		
		logger.info("operating system: " + OS);
		
		// windows
		if (OS.indexOf("win") >= 0){
			// the rest (max, linux, solaris)	
			if (command.toLowerCase().equals("encryptpasswords")) {

				System.out.println("encryptPasswords.cmd <path to application.properties file>");
				System.out.println("  e.g.: encryptPasswords.cmd ..\\conf\\application.properties");
				System.out.println("");

			} else if (command.toLowerCase().equals("setconfigdir")) {

				System.out.println("setConfigDir.cmd <path to .war file> <path to config directory>");
				System.out.println("  e.g.: setConfigDir.cmd ..\\webapp\\JasperReportsIntegration.war c:\\app\\JasperReportsIntegration");
				System.out.println("");

			} else if (command.toLowerCase().equals("getconfigdir")) {

				System.out.println("getConfigDir.sh <path to .war file>");
				System.out.println("  e.g.: getConfigDir.cmd ..\\webapp\\JasperReportsIntegration.war");
				System.out.println("");
				
			} else {
				logger.error("unknown command: " + command.toLowerCase());
				System.exit(-1);
			}			
			
		} else {
			// the rest (max, linux, solaris)	
			if (command.toLowerCase().equals("encryptpasswords")) {

				System.out.println("encryptPasswords.sh <path to application.properties file>");
				System.out.println("  e.g.: encryptPasswords.sh ../conf/application.properties");
				System.out.println("");

			} else if (command.toLowerCase().equals("setconfigdir")) {

				System.out.println("setConfigDir.sh <path to .war file> <path to config directory>");
				System.out.println("  e.g.: setConfigDir.sh ../webapp/JasperReportsIntegration.war /Users/daust/oc-jasper");
				System.out.println("");

			} else if (command.toLowerCase().equals("getconfigdir")) {

				System.out.println("getConfigDir.sh <path to .war file>");
				System.out.println("  e.g.: getConfigDir.sh ../webapp/JasperReportsIntegration.war");
				System.out.println("");
				
			} else {
				logger.error("unknown command: " + command.toLowerCase());
				System.exit(-1);
			}			
		}
		
	}

	/**
	 * 
	 */
	public static void showHelpJavaCall() {
		System.out.println("");
		System.out
				.println("Usage: java -jar JasperReportsIntegration.war <COMMAND> [arguments] \n");
		System.out.println("The following commands are available: \n");
		System.out
				.println("getConfigDir <path to JasperReportsIntegration.war file>  : This will return the config directory as specified in the web.xml file \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war getConfigDir ./JasperReportsIntegration.war\n");
		System.out
				.println("setConfigDir     : This will set the config directory and update the web.xml file \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war setConfigDir JasperReportsIntegration.war /jri");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war setConfigDir JasperReportsIntegration.war d:\\jri\n");
		System.out
				.println("encryptPasswords <path to application.properties file> \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war encryptPasswords /jri/conf/application.properties");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war encryptPasswords d:\\jri\\conf\\application.properties\n");
	}

	public static void showHelpOldOneJAR() {
		System.out.println("");
		System.out
				.println("Usage: java -jar JasperReportsIntegration.war <COMMAND> [arguments] \n");
		System.out.println("The following commands are available: \n");
		System.out
				.println("getConfigDir <path to JasperReportsIntegration.war file>  : This will return the config directory as specified in the web.xml file \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war getConfigDir ./JasperReportsIntegration.war\n");
		System.out
				.println("setConfigDir     : This will set the config directory and update the web.xml file \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war setConfigDir JasperReportsIntegration.war /jri");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war setConfigDir JasperReportsIntegration.war d:\\jri\n");
		System.out
				.println("encryptPasswords <path to application.properties file> \n");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war encryptPasswords /jri/conf/application.properties");
		System.out
				.println("   example: java -jar JasperReportsIntegration.war encryptPasswords d:\\jri\\conf\\application.properties\n");
		System.out
				.println("You can suppress all info messages by using -Done-jar.silent=true, \n e.g. java -Done-jar.silent=true -jar JasperReportsIntegration.war getConfigDir JasperReportsIntegration.war\n");
	}

}
