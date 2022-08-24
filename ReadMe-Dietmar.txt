-----------------------------------------------------------------------------
-- Local instructions for Dietmar
-----------------------------------------------------------------------------

*) Development

- APEX:
	- http://win11/ords
	- Workspace: DEMO, User: dietmar.aust
	- APEX Application: Jasper Reports Integration Test (v2.6.2)
	
- Datenbank-Schema: 
	- Server: win11
	- Port: 1521
	- SID: orclpdb
	- User: DEMO

- Patch/<versionsnummer>/_install.sql
	- Hier jeden Installationsschritt für ein Upgrade dokumentieren

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
-- Design Decisions
-----------------------------------------------------------------------------

*) Which Java JDK to use for creating the .war file?

- We use the oldest one that still has a valid premier support from Oracle.
	- Why? Not all customers are quick in updating to the latest Java JDK / Runtime. Thus we want to keep the requirements as minimal as possible. 
	- https://www.oracle.com/java/technologies/java-se-support-roadmap.html

	- => thus at this time (3.09.2020) this would be Java 8 with a Premier Support Until date until March 2022.

*) New Direction 24.08.2022
- Supporting the official LTS releases: https://www.oracle.com/java/technologies/java-se-support-roadmap.html
- => Primarily JDK 17

*) Which Oracle JDBC libraries should we use?

- We use the latest Oracle JDBC libraries which are still supported by the chosen Java JDK / Runtime. 
	- Why? We want to support the latest Oracle database and still make sure that this will work with the Java version we have chosen. 
	- https://www.oracle.com/database/technologies/maven-central-guide.html#artifacts
	- https://blogs.oracle.com/developers/your-own-way-oracle-jdbc-drivers-19700-on-maven-central
	
	- => thus at this time (3.09.2020) this would be ojdbc8.jar
	

