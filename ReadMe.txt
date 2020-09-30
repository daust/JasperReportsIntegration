/* TODO ... update documentation */

java -Dlog4j.configuration=file:/Users/daust/Dropbox/Projekt/prj_JasperReportsIntegration/conf/log4j-quiet.properties -jar build/JasperReportsIntegration-2.2.0.0-onejar.war encryptPasswords build/dist/conf/application.properties 

./setConfigDir.sh ../webapp/JasperReportsIntegration.war "d:\program files\jasperReports"
./setConfigDir.sh ../webapp/JasperReportsIntegration.war "/Users/daust/oc-jasper"

./getConfigDir.sh ../webapp/JasperReportsIntegration.war.tmp.war
./encryptPasswords.sh /Users/daust/oc-jasper/conf/application.properties


Bei der Entwicklung immer folgende Dateien offen haben
====================================================================================

- Github: 
https://github.com/daust/JasperReportsIntegration

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
	- User: JRI_TEST	

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
	

