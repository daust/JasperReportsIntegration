package tests;

//Import log4j classes.
import org.apache.logging.log4j.Logger;

import tests.com.foo.Bar;

import org.apache.logging.log4j.LogManager;

public class LoggingTestFooBar {

	// Define a static logger variable so that it references the
	// Logger instance named "MyApp".
	private static final Logger logger = LogManager.getLogger();

	public static void main(final String... args) {

		// Set up a simple configuration that logs on the console.

		logger.trace("Entering application.");
		Bar bar = new Bar();
		if (!bar.doIt()) {
			logger.error("Didn't do it.");
		}
		logger.trace("Exiting application.");
	}
}
