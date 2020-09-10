/*
 $Id: ConnectionUtility.java 88 2017-10-15 21:25:31Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2017-10-15 23:25:31 +0200 (So, 15 Okt 2017) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import de.oc.integration.jasper.webapp.AppConfig;
import de.oc.utils.Utils;
import oracle.jdbc.pool.OracleDataSource;
import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

public class ConnectionUtility {
	private static ConnectionUtility instance;
	private HashMap<String, PoolDataSource> dataSources = new HashMap<String, PoolDataSource>();
	private static Logger logger = Logger.getLogger(ConnectionUtility.class
			.getName());
	private String jndiPrefix = "";
	private Context initialContext = null; // will be created only once
	
	/**
	 * constructor
	 * 
	 */
	private ConnectionUtility(String jndiPrefix) {
		// don't do much, the connection pools are populated upon demand
		// makes for a faster startup
		this.jndiPrefix = jndiPrefix;
		
		try {
			initialContext = new InitialContext();
		} catch (NamingException e) {
			e.printStackTrace();
			logger.warn("naming context could not be established");
		}
	}

	/**
	 * Singleton pattern, get instance
	 * 
	 * @param jndiPrefix the jndi prefix
	 * 
	 * @return ConnectionUtility
	 */
	public static synchronized ConnectionUtility getInstance(String jndiPrefix) {
		if (instance == null) {
			instance = new ConnectionUtility(jndiPrefix);
		}
		return instance;
	}

	/**
	 * Get a connection for a data source from the connection pool. First we try
	 * to get a connection from the JNDI datasources. If there is no
	 * configuration available for this datasource, then create a regular JDBC
	 * connection. The connection pool is created upon the first request.
	 * 
	 * @param dsName the name of the data source, e.g. "default"
	 * @return Connection
	 */
	public Connection getConnection(String dsName) {
		
		logger.trace("lookup dataSource:" + dsName);
		
		DataSourceDefinition dataSourceDef = AppConfig.getInstance()
				.getDataSourceDefinition(dsName);		
		Connection conn = null;
		
		if (dataSourceDef == null)
			Utils.throwRuntimeException("Datasource " + dsName + " could not be found.");
		
		if (dataSourceDef.type.equals("jndi")){
			// ----------------------------------------------------
			// use the JNDILookup first
			// ----------------------------------------------------

			if (initialContext != null) {
				String jndiName = this.jndiPrefix + dsName;
				logger.debug("use JNDI to lookup dataSource:" + jndiName);
				try {
					DataSource ds = (DataSource) initialContext.lookup(jndiName);

					if (ds != null) {
						conn = ds.getConnection();
					}
				} catch (Exception e) {
					logger.info("JNDI lookup failed for " + jndiName
							+ ", trying JDBC now...");
				}
			}		
		} else if (dataSourceDef.type.equals("jdbc")){
			// ----------------------------------------------------
			// use JDBC connection next
			// http://docs.oracle.com/cd/B19306_01/java.102/b14355/concache.htm
			// ----------------------------------------------------
			if (conn == null) {
				logger.debug("use JDBC to lookup dataSource:" + dsName);

				PoolDataSource poolDataSource;
								
				try {
					logger.trace("retrieve connectionPoolDataSource from HashMap first");
					poolDataSource = dataSources
							.get(dsName);

					if (poolDataSource == null) {
						logger.trace("dataSource not found in HashMap, initialize a new connection pool and store in HashMap");

					    //java.util.Properties prop = new java.util.Properties();
					    
					    poolDataSource = PoolDataSourceFactory.getPoolDataSource();
					    poolDataSource.setConnectionFactoryClassName(OracleDataSource.class.getName());
					    poolDataSource.setURL(dataSourceDef.url);
					    poolDataSource.setUser(dataSourceDef.username);
					    poolDataSource.setPassword(dataSourceDef.password);
					    
					    poolDataSource.setInitialPoolSize(5);
					    poolDataSource.setMinPoolSize(5);
					    poolDataSource.setMaxPoolSize(50);
					    // remove additional connections from pool after 10min idle time
					    poolDataSource.setInactiveConnectionTimeout(600);
					    
						dataSources.put(dsName, poolDataSource);
					}

					conn = poolDataSource.getConnection();

					logger.debug("initial pool size: " + poolDataSource.getInitialPoolSize());
					logger.debug("min pool size: " + poolDataSource.getMinPoolSize());
					logger.debug("max pool size: " + poolDataSource.getMaxPoolSize());
				
					logger.info("successfully connected to " + dataSourceDef.url
							+ " with user: " + dataSourceDef.username);
				} catch (SQLException e) {
					Utils.throwRuntimeException("Could not connect via JDBC: "
							+ e.getMessage());
				}
			}			
		}
		if (conn != null)
			logger.info("dataSource loaded:" + dsName);

		return conn;
	}
}
