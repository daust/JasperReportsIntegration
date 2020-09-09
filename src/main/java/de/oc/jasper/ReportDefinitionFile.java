/*
 $Id: ReportDefinitionFile.java 56 2013-05-13 07:06:46Z dietmar.aust $

 Purpose  :  

 $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
 $LastChangedBy: dietmar.aust $ 

 Date        Author          Comment
 --------------------------------------------------------------------------------------
 01.08.2012  D. Aust         Initial creation

 */

package de.oc.jasper;

import java.io.File;

public class ReportDefinitionFile {
	
	public File reportFile=null;
	public String reportFileDir=null;
	public String reportsDir=null;
	
	public ReportDefinitionFile(File pReportFile, String pReportDir, String pReportsDir){
		reportFile = pReportFile; 
		reportFileDir  = pReportDir;
		reportsDir = pReportsDir;
	}
}
