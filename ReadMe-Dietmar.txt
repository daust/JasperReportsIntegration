-----------------------------------------------------------------------------
-- Local instructions for Dietmar
-----------------------------------------------------------------------------

*) Development

- APEX:
	- http://win11:8090/ords
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
	

-----------------------------------------------------------------------------
-- self-signed certificates
-----------------------------------------------------------------------------

---
--- Using a self-signed certificate in Eclipse 
---

*) generate certificate

https://stackoverflow.com/questions/951890/eclipse-wtp-how-do-i-enable-ssl-on-tomcat

cd ~/Downloads
keytool -genkey -alias tomcat -keypass mypassword -keystore keystore.jks -storepass mypassword -keyalg RSA -validity 360 -keysize 2048

daust@MacBook2022 Downloads % keytool -genkey -alias tomcat -keypass mypassword -keystore keystore.jks -storepass mypassword -keyalg RSA -validity 360 -keysize 2048
Wie lautet Ihr Vor- und Nachname?
  [Unknown]:  Dietmar Aust
Wie lautet der Name Ihrer organisatorischen Einheit?
  [Unknown]:  OPAL
Wie lautet der Name Ihrer Organisation?
  [Unknown]:  OPAL
Wie lautet der Name Ihrer Stadt oder Gemeinde?
  [Unknown]:  Cologne
Wie lautet der Name Ihres Bundeslands?
  [Unknown]:  NRW
Wie lautet der Ländercode (zwei Buchstaben) für diese Einheit?
  [Unknown]:  DE
Ist CN=Dietmar Aust, OU=OPAL, O=OPAL, L=Cologne, ST=NRW, C=DE richtig?
  [Nein]:  n
Wie lautet Ihr Vor- und Nachname?
  [Dietmar Aust]:  macbook2022.local
Wie lautet der Name Ihrer organisatorischen Einheit?
  [OPAL]:  
Wie lautet der Name Ihrer Organisation?
  [OPAL]:  
Wie lautet der Name Ihrer Stadt oder Gemeinde?
  [Cologne]:  
Wie lautet der Name Ihres Bundeslands?
  [NRW]:  
Wie lautet der Ländercode (zwei Buchstaben) für diese Einheit?
  [DE]:  
Ist CN=macbook2022.local, OU=OPAL, O=OPAL, L=Cologne, ST=NRW, C=DE richtig?
  [Nein]:  Ja

*) Copy to Tomcat local directories:
mv ~/Downloads/keystore.jks ~/Downloads/KEEP/tomcat/apache-tomcat-9.0.55/conf/localhost-rsa.jks 

/Users/daust/Downloads/KEEP/tomcat/apache-tomcat-9.0.55/conf/localhost-rsa.jks
/Users/daust/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/conf/localhost-rsa.jks

*) Configure connector in server.xml
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true">
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
            			 certificateKeystorePassword="mypassword"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>

*) start eclipse Server and test
http://macbook2022.local:9080/
https://macbook2022.local:8443/

*) create certificate file
openssl s_client -showcerts -connect macbook2022.local:8443 </dev/null

=> file: localhost.cer


-----BEGIN CERTIFICATE-----
MIIDbTCCAlWgAwIBAgIEGW/WDzANBgkqhkiG9w0BAQsFADBnMQswCQYDVQQGEwJE
RTEMMAoGA1UECBMDTlJXMRAwDgYDVQQHEwdDb2xvZ25lMQ0wCwYDVQQKEwRPUEFM
MQ0wCwYDVQQLEwRPUEFMMRowGAYDVQQDExFtYWNib29rMjAyMi5sb2NhbDAeFw0y
MjA4MjQxNDEyMThaFw0yMzA4MTkxNDEyMThaMGcxCzAJBgNVBAYTAkRFMQwwCgYD
VQQIEwNOUlcxEDAOBgNVBAcTB0NvbG9nbmUxDTALBgNVBAoTBE9QQUwxDTALBgNV
BAsTBE9QQUwxGjAYBgNVBAMTEW1hY2Jvb2syMDIyLmxvY2FsMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtAmku2ApTs1txc6p+SkDAzYaiztLjjaj+fBT
lAkgShN0fnjzN5le4i4paNaIax+nCRvtzSA+xMn7cjGLNyGhJMH13lyVpDuVt9jm
4QH3vz7ErUfEM5hgQa3sw2rwEbufw8HgIONLJoFErNNs1SUukx/ZWeR7RnQmBvFF
1Brd44qYUDlOkmt6ttIEFJFdZWrqK82hNUDQkEN2iKTPqb4YpoEYQp5CoCD7muF+
JFjUMGlK+DieDa7akVKWkzF5L1W8RyrBBQ4HKG1CitXUeVZDq211w7YODJYeBTXq
TLjg2pU0ONTuhcOyLwaChFczsIXCJ9GmcOwkFB5fAtH645DU0wIDAQABoyEwHzAd
BgNVHQ4EFgQUr/xeOxQJhphXvaWZlP14fEBVan8wDQYJKoZIhvcNAQELBQADggEB
AJn7XbwIdVNZhtHwkzYfCasbvo4AlpU+gbaMH5i96NecBEr9Dxs8TUrS/RlvxWUc
GqZf7ctqiiWcYcv6Wt/YHUDaNNcNKvbaagqAf5/PzPIeH6QFNtLHHbUTjcKPBDyQ
gFjQOGP+zH0Pf9+U7doBlmkalaLs87juzwJutfbUo5SpUw/ob7Gejbsq9F2FXo6o
1cF044FYvIDyuQTtjyYaacdoio0zFNYAw5AlNXa+HyYx3ON+QpkbBEP9ZAzdUStI
QdI8Dh5c5RrXj/mFnnkkGfV0G/x4v4ycVFFvQ9zNualPLRg4VXJDYHBM4drzplqZ
bx5PSyRuALrOhRK0fZeAUCU=
-----END CERTIFICATE-----

*) create wallet (on Windows Parallels)
orapki wallet create -wallet ./wallet -pwd YourWalletPasswd123 -auto_login
orapki wallet add -wallet ./wallet -trusted_cert -cert "localhost.cer" -pwd YourWalletPasswd123
orapki wallet display -wallet ./wallet

*) Grant access to server

BEGIN
 DBMS_NETWORK_ACL_ADMIN.
 append_host_ace (
 HOST => 'macbook2022.local',
 --lower_port => 443,
 --upper_port => 443,
 ace => xs$ace_type (privilege_list => xs$name_list ('http'),
 principal_name => 'DEMO',
 principal_type => xs_acl.ptype_db));
END;
/
COMMIT
/

*) Test connection: 

select apex_web_service.make_rest_request(
        p_url         => 'https://macbook2022.local:8443/jri/',
        p_http_method => 'GET',
        p_wallet_path => 'file:C:\app\oracle\wallet',
        p_wallet_pwd  => 'YourWalletPasswd123') as r
  from dual;


