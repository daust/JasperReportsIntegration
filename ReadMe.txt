/* TODO ... update documentation */



java -Done-jar.info=false -Done-jar.record=false -Done-jar.verbose=false -Done-jar.statistics=false -Done-jar.debug=false -Dlog4j.configuration=file:/Users/daust/Dropbox/Projekt/prj_JasperReportsIntegration/conf/log4j-quiet.properties -jar build/JasperReportsIntegration-2.2.0.0-onejar.war encryptPasswords build/dist/conf/application.properties 

java -jar build/JasperReportsIntegration-2.2.0.0-onejar.war encryptPasswords build/dist/conf/application.properties 

java -Dlog4j.configuration=file:/Users/daust/Dropbox/Projekt/prj_JasperReportsIntegration/conf/log4j-quiet.properties -jar build/JasperReportsIntegration-2.2.0.0-onejar.war encryptPasswords build/dist/conf/application.properties 

cd /Users/daust/Dropbox/Projekt/prj_JasperReportsIntegration
chmod u+x build/dist/bin/*.sh

build/dist/bin/jettyStart.sh


./setConfigDir.sh ../webapp/JasperReportsIntegration.war "d:\program files\jasperReports"
./setConfigDir.sh ../webapp/JasperReportsIntegration.war "/Users/daust/oc-jasper"

./getConfigDir.sh ../webapp/JasperReportsIntegration.war.tmp.war
./encryptPasswords.sh /Users/daust/oc-jasper/conf/application.properties



Aktuell
====================================================================================
- Version: 2.5.0.0
- Anforderung: 

Bei der Entwicklung immer folgende Dateien offen haben
====================================================================================

- Github: 
https://github.com/daust/JasperReportsIntegration

- Anforderungsmanagement: 
	- http://www.opal-consulting.de:8080/ords/f?p=201
	- Neue Anforderungen hinterlegen
	- Status aktualisieren, wenn Anforderungen umgesetzt wurden

- ReleaseNotes.txt
	- umgesetzte Anforderungen hinzufügen
	- Module Version Info aktualisieren
	
- Patch/<versionsnummer>/_install.sql
	- Hier jeden Installationsschritt für ein Upgrade dokumentieren

Entwicklungsversionen
====================================================================================
- APEX Applikationen: 
	- http://daust.dyndns.org:5001/apex/f?p=121:1:7029833017773468::NO (APEX 4.2)
	- Workspace: OC, User: Dietmar.Aust

	- http://vm1/ords  (APEX 18.1)
	- Workspace: JRI_TEST, User: Dietmar.Aust
	
- Datenbank-Schema: 
	- Server: opal-dev-min
	- Port: 1521
	- SID: XE
	- User: TEST	

Release erstellen
====================================================================================
	
Neues Release initialisieren
====================================================================================
- Neue Versionsnummer eintragen in build.properties
- Neues Patchverzeichnis erstellen

Neue Bibliotheken JasperReportsIntegration aktualisieren
====================================================================================

--------------------------------------------------------------
-- Apache Ivy konfigurieren (nur einmalig)
--------------------------------------------------------------

*) Apache ANT installieren

brew install ant
oder
brew upgrade ant

*) Herunterladen und in ANT Bibliothek kopieren

brew install ivy
locate ivy-2.4.0.jar
cp /usr/local/Cellar/groovy/2.4.7/libexec/lib/ivy-2.4.0.jar /usr/local/Cellar/ant/1.10.1/libexec/lib

--------------------------------------------------------------
-- Neue Version JasperReportsLibrary herunterladen 
--------------------------------------------------------------

// die offiziellen Dependencies: 
//https://mvnrepository.com/artifact/net.sf.jasperreports/jasperreports/6.4.3
//https://mvnrepository.com/artifact/net.sf.jasperreports/jasperreports/6.14.0

cd /Users/daust/Downloads
export JR_VERSION=6.14.0

*) Cleanup 
rm -Rf /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}

*) und speichern unter: /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}
	
http://sourceforge.net/projects/jasperreports/files/jasperreports

curl -L -O https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%20${JR_VERSION}/jasperreports-${JR_VERSION}-project.tar.gz
curl -L -O https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%20${JR_VERSION}/jasperreports-chart-themes-${JR_VERSION}.jar
curl -L -O https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%20${JR_VERSION}/jasperreports-chart-customizers-${JR_VERSION}.jar
curl -L -O https://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%20${JR_VERSION}/jasperreports-functions-${JR_VERSION}.jar

*) create new directory for version

mkdir /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}
mv /Users/daust/Downloads/jasperreports-${JR_VERSION}-project.tar.gz /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}/jasperreports-${JR_VERSION}-project.tar.gz
tar -zxvf /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}/jasperreports-${JR_VERSION}-project.tar.gz -C /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}

#*) JasperSoft Studio herunterladen
#https://sourceforge.net/projects/jasperstudio/

*) Bibliotheken mit Apache Ivy herunterladen

ant -f /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}/jasperreports-${JR_VERSION}/build.xml retrievelibs

mv /Users/daust/Downloads/jasperreports-*${JR_VERSION}.jar /Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}/jasperreports-${JR_VERSION}/dist


*) Neues Skript erstellen: 
cd /Users/daust/Dropbox/50.Projects/prj_JasperReportsIntegration/lib/jasper-reports	

rm -Rf ${JR_VERSION}

groovy getJasperReportsLibs-FromProject.groovy "${JR_VERSION}" "/Users/daust/Downloads/KEEP/jasperreports/${JR_VERSION}/jasperreports-${JR_VERSION}/"
groovy createDeleteScript.groovy "${JR_VERSION}"

## jasperreports-javaflow ist eine selten benutzte Variante von JasperReports und darf nicht zusammen
## mit jasperreports.jar im Classpath liegen
rm "/Users/daust/Dropbox/50.Projects/prj_JasperReportsIntegration/lib/jasper-reports/${JR_VERSION}/jasperreports-javaflow-${JR_VERSION}.jar"

*) zum Testen 

cd /Users/daust/Dropbox/50.Projects/prj_JasperReportsIntegration
ant clean
ant build (zum Testen)

*) Dann noch für Eclipse die Bibliotheken austauschen aus: prj_JasperReportsIntegration/build/webapp/WEB-INF/lib/*

rm -Rf /Users/daust/Dropbox/Programme-Mac/eclipse-workspace/JasperReportsIntegration-EclipseTest/web/WEB-INF/lib/*
cp -R /Users/daust/Dropbox/50.Projects/prj_JasperReportsIntegration/build/webapp/WEB-INF/lib/* /Users/daust/Dropbox/Programme-Mac/eclipse-workspace/JasperReportsIntegration-EclipseTest/web/WEB-INF/lib

	- hier die aktuellen Bibliotheken löschen
	- dann die neuen Bibliotheken übertragen
	- dann ein "Refresh" auf dem Knoten in Eclipse machen

*) Dokumentation aktualisieren: 

Datei doc/User-Documentation/Release-Note.html mit Seamonkey überarbeiten

- Datei > Seite Bearbeiten

*) für die Distribution

ant clean
ant svn-commit 
ant build
ant svn-tag

-----------------------------------------------------------------------------
-- Berichte aktualisieren in der Entwicklung für Eclipse
-----------------------------------------------------------------------------
cp -R /Users/daust/Dropbox/50.Projects/prj_JasperReportsIntegration/src/reports/* /Users/daust/oc-jasper/reports




-----------------------------------------------------------------------------
-- BACKGROUND Decisions
-----------------------------------------------------------------------------

*) Which Java JDK to use for creating the .war file?

- We use the oldest one that still has a valid premier support from Oracle.
	- Why? Not all customers are quick in updating to the latest Java JDK / Runtime. Thus we want to keep the requirements as minimal as possible. 
	- https://www.oracle.com/java/technologies/java-se-support-roadmap.html

	- => thus at this time (3.09.2020) this would be Java 8 with a Premier Support Until date until March 2022.

*) Which Oracle JDBC libraries should we use?

- We use the latest Oracle JDBC libraries which are still supported by the chosen Java JDK / Runtime. 
	- Why? We want to support the latest Oracle database and still make sure that this will work with the Java version we have chosen. 
	- https://www.oracle.com/database/technologies/maven-central-guide.html#artifacts
	- https://blogs.oracle.com/developers/your-own-way-oracle-jdbc-drivers-19700-on-maven-central
	
	- => thus at this time (3.09.2020) this would be ojdbc8.jar
	

