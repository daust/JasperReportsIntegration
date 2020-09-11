/*
 $Id: DBUtils.java 56 2013-05-13 07:06:46Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class DBUtils {
	
	private static Logger log = Logger.getLogger(DBUtils.class);

	public static void closeQuietly(Connection conn){
		if (conn!=null){
			try{
				conn.close();
				conn=null;
			} catch(SQLException e) {
				/* ignored */
			}			
		}
	}	

	public static void closeQuietly(Statement stmt){
		if (stmt!=null){
			try{
				stmt.close();
				stmt=null;
			} catch(SQLException e) {
				/* ignored */
				//log.error(e.getMessage());
				
			}			
		}
	}	

	public static void closeQuietly(ResultSet rs){
		if (rs!=null){
			try{
				rs.close();
				rs=null;
			} catch(SQLException e) {
				/* ignored */
			}			
		}
	}	

	public static void closeQuietly(Connection conn, Statement stmt, ResultSet rs){
		closeQuietly(rs);
		closeQuietly(stmt);
		closeQuietly(conn);
	}	
	
	public static String nvl(String p, String defaultValue) {
		if (p == null)
			return defaultValue;
		if (p.equals(""))
			return defaultValue;

		return p;
	}
	
	public static Boolean nvl(Boolean p, Boolean defaultValue) {
		if (p == null)
			return defaultValue;

		return p;
	}

	public static Integer nvl(Integer p, Integer defaultValue) {
		if (p == null)
			return defaultValue;

		return p;
	}

}

