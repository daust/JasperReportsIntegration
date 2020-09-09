/*
 $Id: DataSourceDefinition.java 56 2013-05-13 07:06:46Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.db;

import org.apache.log4j.Logger;

/** Defines a data source, holds all information for a jdbc database connection.
 * <br> 
 * 
 * @author D. Aust
 *
 */
public class DataSourceDefinition {

	public String type; // type:jndi|jdbc
	public String name;
	public String url;
	public String username;
	public String password;
	
	private final static Logger logger = Logger.getLogger(DataSourceDefinition.class);

	public DataSourceDefinition(String type, String name, String url, String username, String password) {
		this.type = type;
		this.name = name;
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public void dump(){
		logger.debug("dataSource("+this.name+"):");
		logger.debug("	type:"+this.type);
		logger.debug("	name:"+this.name);
		logger.debug("	url:"+this.url);
		logger.debug("	username:"+this.username);
		logger.debug("	password:*******");
	}
}
