package de.oc.integration.jasper.webapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JRRuntimeException;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.HierarchicalINIConfiguration;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import de.oc.db.ConnectionUtility;
import de.oc.db.DataSourceDefinition;
import de.oc.utils.Encryptor;

/**
 * Application Configuration
 * 
 * @author daust
 * 
 * 08.09.2020	D. Aust		Added getVersion()
 * 15.09.2020	D. Aust		Added config parameter application.ipAddressesAllowed
 * 
 */
public class AppConfig {

	// ----------------------------------------------------
	// constants
	// ----------------------------------------------------
	public static final String OC_JASPER_CONFIG_HOME_INIT = "oc.jasper.config.home";
	public static final String OC_JASPER_CONFIG_HOME_ENV = "OC_JASPER_CONFIG_HOME";
	public static final String OC_JASPER_WEBAPP_HOME = "oc.jasper.webapp.home";
	public static final java.lang.String APPLICATION_PROPERTIES_FILE = "application.properties";

	//public static final String key1 = "Bar12345Bar12345"; // 128 bit key
	public static final String key2 = "ThisIsASecretKet";

	// ----------------------------------------------------
	// public
	// ----------------------------------------------------
	// app configuration
	public boolean enablePasswordOverURL = false;
	public boolean displayPrintDialog = false;
	public String configFileVersion = null;

	private HashMap<String, DataSourceDefinition> _dataSourceDefinitions = new HashMap<String, DataSourceDefinition>();

	// infoPageIsEnabled
	public boolean infoPageIsEnabled = false;
	
	// application.ipAddressesAllowed
	public String[] ipAddressesAllowed = null;

	// direct printing
	public boolean printIsEnabled = false;

	// save file on server
	public boolean saveFileIsEnabled = false;
	private String[] _directoryWhitelist = null;

	// ----------------------------------------------------
	// private
	// ----------------------------------------------------
	private static Logger _logger = Logger.getLogger(AppConfig.class);
	private static AppConfig _instance = null;

	// custom configuration, e.g.: /Users/daust/JasperReportsIntegration
	private static String _configHomeDir;
	// which is the root directory, where the web application is deployed to?
	private static String _webappHomeDir;
	// was a custom configuration set using an init parameter in the web.xml
	// file?
	private static String _initParameterConfigHomeDir;
	// was a custom configuration set using an environment variable on operating
	// system level?
	private static String _envVariableConfigHomeDir;

	private static String _applicationPropertiesFileName;
	private HierarchicalINIConfiguration _applicationProperties = new HierarchicalINIConfiguration();

	/* database connections */
	private static ConnectionUtility _connectionUtility = null;
	private String _jndiPrefix = "java:comp/env/jdbc/";

	/**
	 * Static Method, returns the only instance of this class.
	 * 
	 * @return AppContext
	 */
	public static AppConfig getInstance() {
		if (_instance == null) {
			_instance = new AppConfig();
		}
		return _instance;
	}

	/**
	 * Default constructor, does nothing. All the action happens in initialize()
	 * 
	 */
	private AppConfig() {
	}

	/**
	 * Initialize the singleton. Also set the system properties: -
	 * oc.jasper.config.home - oc.jasper.webapp.home
	 * 
	 * @param servletContext the servlet context
	 */
	public void initialize(ServletContext servletContext) {

		_logger.info("initialize AppConfig()");

		// ----------------------------------------------------
		// get directories and environment variables
		// ----------------------------------------------------
		_webappHomeDir = servletContext.getRealPath("/");
		// remove trailing slash
		if (_webappHomeDir.endsWith("/")) {
			_webappHomeDir = _webappHomeDir.substring(0,
					_webappHomeDir.length() - 1);
		}

		_initParameterConfigHomeDir = servletContext
				.getInitParameter(OC_JASPER_CONFIG_HOME_INIT);
		_envVariableConfigHomeDir = System.getenv(OC_JASPER_CONFIG_HOME_ENV);

		// ----------------------------------------------------
		// Determine the location of the config file
		// ----------------------------------------------------
		_logger.debug("determine the location of the config file");

		// 1) init parameter in web.xml set?
		// 2) environment variable oc.jasper.config.home set?
		// 3) default: webapp home dir of current deployment
		_configHomeDir = nvl(_initParameterConfigHomeDir,
				_envVariableConfigHomeDir);
		_configHomeDir = nvl(_configHomeDir, _webappHomeDir + File.separator
				+ "WEB-INF");
		_applicationPropertiesFileName = this.getConfigHomeDir()
				+ File.separator + "conf" + File.separator
				+ APPLICATION_PROPERTIES_FILE;

		_logger.info("** webappHomeDir:" + _webappHomeDir);
		_logger.info("** InitParameter " + OC_JASPER_CONFIG_HOME_INIT + ":"
				+ _initParameterConfigHomeDir);
		_logger.info("** Environment variable " + OC_JASPER_CONFIG_HOME_ENV
				+ ":" + _envVariableConfigHomeDir);
		_logger.info("** configHomeDir:" + _configHomeDir);
		_logger.info("** configFile:" + _applicationPropertiesFileName);

		// set system properties required for the logger
		_logger.info("set system property " + OC_JASPER_CONFIG_HOME_INIT + "="
				+ _configHomeDir);
		System.setProperty(OC_JASPER_CONFIG_HOME_INIT, _configHomeDir);
		_logger.info("set system property " + OC_JASPER_WEBAPP_HOME + "="
				+ _webappHomeDir);
		System.setProperty(OC_JASPER_WEBAPP_HOME, _webappHomeDir);

		// ----------------------------------------------------
		// initialize the log4j framework
		// ----------------------------------------------------
		String log4jPropertiesFile = servletContext
				.getInitParameter("log4j-init-file");
		_logger.info("** log4j-init-file:" + log4jPropertiesFile);
		String log4jPropertiesFilePath = getConfigHomeDir() + File.separator
				+ "conf" + File.separator + log4jPropertiesFile;

		// if the log4j-init-file is not set, then no point in trying
		if (log4jPropertiesFile != null) {
			// PropertyConfigurator.configure(prefix+file);

			_logger = Logger.getLogger(this.getClass());
			_logger.info("Load log4j configuration from file: "
					+ log4jPropertiesFilePath);

			PropertyConfigurator.configure(log4jPropertiesFilePath);

		}

		// logger can be configured now, log4j framework is initialized
		configureLogger();

		// ----------------------------------------------------
		// Read config file
		// ----------------------------------------------------
		_applicationProperties = loadApplicationProperties(_applicationPropertiesFileName);

		// dump properties to logfile
		if (_logger.isDebugEnabled())
			logApplicationProperties();

		// ----------------------------------------------------
		// Process config file
		// ----------------------------------------------------
		processConfigFile(_applicationProperties);

		// initialize connection pool
		_connectionUtility = ConnectionUtility.getInstance(_jndiPrefix);

	}

	public void validateConfiguration(ServletContext servletContext) {
		// check, whether the configuration is still valid or the configuration
		// file has been changed in between.
	}

	/**
	 * can be called after the logger has been initilized
	 */
	private void configureLogger() {
		_logger = Logger.getLogger(this.getClass());
	}

	/**
	 * load the application properties from the application.properties file they
	 * are stored in the .ini file format:
	 * http://commons.apache.org/configuration
	 * /apidocs/org/apache/commons/configuration
	 * /HierarchicalINIConfiguration.html
	 * 
	 * they contain global parameters as well as the definition of the data
	 * sources
	 * 
	 * @param applicationPropertiesFileName File name of the application properties file, e.g.: "application.properties"
	 * 
	 * @return HierarchicalINIConfiguration
	 * 
	 */
	public HierarchicalINIConfiguration loadApplicationProperties(
			String applicationPropertiesFileName) {

		HierarchicalINIConfiguration props = new HierarchicalINIConfiguration();
		String errMsg = "";

		// open properties file
		File applicationPropertiesFile = new File(applicationPropertiesFileName);
		if (!applicationPropertiesFile.exists()) {
			errMsg = "File " + applicationPropertiesFile + " not found.";
			_logger.error(errMsg);
			throw new JRRuntimeException(errMsg);
		}

		// load properties
		try {
			props.load(new FileInputStream(applicationPropertiesFileName));
		} catch (ConfigurationException e1) {
			e1.printStackTrace();
			errMsg = "Error during processing of application properties file: "
					+ applicationPropertiesFile + ": " + e1.getMessage();
			_logger.error(errMsg);
			throw new JRRuntimeException(errMsg);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			errMsg = "File " + applicationPropertiesFile + " not found.";
			_logger.error(errMsg);
			throw new JRRuntimeException(errMsg);
		}

		_logger.info("application properties loaded from file: "
				+ applicationPropertiesFileName);
		// _logger.info("#entries: " + _applicationProperties.);

		return props;
	}

	/**
	 * Process the parameter of the config file
	 * 
	 * @param props
	 */
	private void processConfigFile(HierarchicalINIConfiguration props) {

		_logger.debug("process properties file...");

		// -----------------------------------------------------------
		// application
		// -----------------------------------------------------------
		this.enablePasswordOverURL = Boolean.parseBoolean(props
				.getString("application.passUserPwdOverURL"));
		this._jndiPrefix = props.getString("application.jndiPrefix");
		this.configFileVersion = props
				.getString("application.configFileVersion");
		
        // fuer die alten Versionen soll es immer angezeigt werden
		this.infoPageIsEnabled = Boolean.parseBoolean(props
				.getString("application.infoPageIsEnabled", "true"));

		this.ipAddressesAllowed = props.getStringArray("application.ipAddressesAllowed");
		
		// -----------------------------------------------------------
		// direct printing
		// -----------------------------------------------------------
		this.printIsEnabled = Boolean.parseBoolean(props
				.getString("directPrinting.isEnabled"));
		this.displayPrintDialog = Boolean.parseBoolean(props
				.getString("directPrinting.displayPrintDialog"));

		// save file on server
		this.saveFileIsEnabled = Boolean.parseBoolean(props
				.getString("saveFileOnServer.isEnabled"));

		this._directoryWhitelist = props
				.getStringArray("saveFileOnServer.directoryWhitelist");

		// loop over datasource-sections
		Iterator<String> it = props.getSections().iterator();
		while (it.hasNext()) {
			String sectionName = (String) it.next();
			_logger.trace("process section=" + sectionName);

			if (sectionName.startsWith("datasource:")) {
				_logger.trace("datasource section found=" + sectionName);
				String dsName = sectionName.split(":")[1];
				DataSourceDefinition ds = new DataSourceDefinition(
						props.getString(sectionName + ".type"), dsName,
						props.getString(sectionName + ".url"),
						props.getString(sectionName + ".username"),
						decryptPWD(props.getString(sectionName + ".password")));

				_dataSourceDefinitions.put(dsName, ds);
				// write datasource to logfile
				ds.dump();
			}
		}
	}

	/**
	 * Returns the computed configuration directory. This directory has the
	 * following subdirectories: - logs - conf - reports
	 * 
	 * @return String
	 */
	public String getConfigHomeDir() {
		return _configHomeDir;
	}

	public String getConfigDir() {
		return _configHomeDir + File.separator + "conf";
	}

	public String getReportsDir() {
		return _configHomeDir + File.separator + "reports";
	}

	public String getLogsDir() {
		return _configHomeDir + File.separator + "logs";
	}

	public String getTmpDir() {
		return _webappHomeDir + File.separator + "report_tmp";
	}

	public String getApplicationPropertiesFileName() {
		return _applicationPropertiesFileName;
	}

	public boolean isWhitelistDirectory(String dir) {
		for (int i = 0; i < _directoryWhitelist.length; i++) {
			if (_directoryWhitelist[i].toLowerCase().equals(dir.toLowerCase()))
				return true;
		}
		return false;
	}

	/**
	 * gets a value and sets a default value if null ... nvl
	 * 
	 * @param p	the value of the parameter
	 * @param defaultValue the default value that will be returned when p is null
	 * 
	 * @return String
	 */
	public String nvl(String p, String defaultValue) {
		if (p == null)
			return defaultValue;
		if (p.equals(""))
			return defaultValue;

		return p;
	}

	/**
	 * 
	 */
	public void logApplicationProperties() {
		// output properties ...
		Iterator<String> it = _applicationProperties.getKeys();
		while (it.hasNext()) {
			Object key = it.next();
			if (!((String) key).endsWith(".password")) {
				_logger.debug((String) key + "="
						+ _applicationProperties.getString((String) key));
			}
		}
	}

	/**
	 * 
	 * @param datasourceName the name of the datasource, e.g. "default" as defined in the application.properties file
	 * 
	 * @return DataSourceDefinition
	 */
	public DataSourceDefinition getDataSourceDefinition(String datasourceName) {
		return this._dataSourceDefinitions.get(datasourceName);
	}

	/**
	 * returns the hashMap itself
	 * 
	 * @return HashMap
	 */
	public HashMap<String, DataSourceDefinition> getDataSources() {
		return _dataSourceDefinitions;
	}

	public Connection getConnection(String dsName) {

		return _connectionUtility.getConnection(dsName);
	}

	/**
	 * clean up connection pool and other things
	 * 
	 */
	public void close() {
		// TODO: needs to be implemented
		// Needs more checking, but the connection pools are closed differently. 
	}

	
	public static String padRight(String s, int n) {
	     return String.format("%1$-" + n + "s", s);  
	}

	public static String padLeft(String s, int n) {
	    return String.format("%1$" + n + "s", s);  
	}
	
	public static String getKey1() {
		String key1 = "";
		String localhostname = "";

		try {
			localhostname = java.net.InetAddress.getLocalHost().getHostName();
		} catch (UnknownHostException e) {
		}
		
		if (localhostname.length()>16){
			localhostname = localhostname.substring(0,16);
		}
		
		key1 = padRight(localhostname,16).replace(" ", "|");
		//_logger.info("key1: #"+key1+"#");
		
		return key1;
	}
	
	
	// if it is already encrypted, then do nothing
	// if it is NOT already encrypted, then use method 1:
	public String encryptPWD(String pwd) {
		pwd = pwd.trim();
		
		if (pwd.startsWith("1:")) {
			// password is encrypted with method 1 ... do nothing
		} else {
			// not encrypted => ENCRYPT!
			pwd = "1:" + Encryptor.encrypt(getKey1(), key2, pwd);
		}
		
		return pwd;
	}

	public String decryptPWD(String pwd) {

		if (pwd != null){
			if (pwd.startsWith("1:")) {
				// password is encrypted with method 1
				String encPwd = pwd.substring("1:".length());
				pwd = Encryptor.decrypt(getKey1(), key2, encPwd);
			} else {
				// not encrypted => do nothing
			}			
		}
		
		return pwd;
	}
	
	/**
	 * Checks the list of allowed ip addresses. 
	 * 
	 * @param ipAddress
	 * @return yes/no based on the configured list of allowed ip addresses: application.ipAddressesAllowed
	 */
	public boolean isIpAddressAllowed(String ipAddress) {
		_logger.debug("check ip address: " + ipAddress);
		
		// if parameter has not been configured in the file => ALLOW ACCESS
		if (this.ipAddressesAllowed.length==0) {
			return true;
		}
		
		for (int i = 0; i < this.ipAddressesAllowed.length; i++) {
			if (this.ipAddressesAllowed[i].toLowerCase().equals(ipAddress.toLowerCase()))
				return true;
		}
		_logger.debug("ip address rejected: " + ipAddress);
		return false;

	}

}
