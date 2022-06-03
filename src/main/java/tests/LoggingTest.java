package tests;

import java.io.File;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;

public class LoggingTest {

	private static Logger logger = LogManager.getLogger(LoggingTest.class);

	public static void main(String[] args) {
		// ----------------------------------------------------
		// initialize the log4j framework
		// ----------------------------------------------------
		String log4jPropertiesFilePath = "/tmp/jri/conf/log4j2.xml";
		System.setProperty("log4j.configurationFile", log4jPropertiesFilePath);
		System.setProperty("oc.jasper.log.dir", "/tmp/jri" + File.separator + "logs");
		LoggerContext.getContext(false).reconfigure();
		
		logger.info("** log4j-init-file:" + log4jPropertiesFilePath);
		logger.info("Load log4j configuration from file: " + log4jPropertiesFilePath);
		logger.debug("*** debug statement");
		logger.trace("*** trace statement");
		logger.warn("*** warn statement");
		logger.error("*** error statement");
	}
}
