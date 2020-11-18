ojdbc8-full.tar.gz - JDBC Thin Driver and Companion JARS
========================================================
This TAR archive (ojdbc8-full.tar.gz) contains the 19.3 release of the Oracle JDBC Thin driver(ojdbc8.jar), the Universal Connection Pool (ucp.jar) and other companion JARs grouped by category. 

(1) ojdbc8.jar (4,210,517 bytes) - 
(SHA1 Checksum: 967c0b1a2d5b1435324de34a9b8018d294f8f47b)
Certified with JDK 8; 
(2) ucp.jar (1,680,074 bytes) - (SHA1 Checksum:796b661b0bb1818b7c04171837356acddcea504c)
Universal Connection Pool classes for use with JDK 8 -- for performance, scalability, high availability, sharded and multitenant databases.
(3) ojdbc.policy (11,596 bytes) - Sample security policy file for Oracle Database JDBC drivers

======================
Security Related JARs
======================
Java applications require some additional jars to use Oracle Wallets. 
You need to use all the three jars while using Oracle Wallets. 

(4) oraclepki.jar (306,004 bytes) - (SHA1 Checksum: 0e52a34f271c6c62ee1a73b71cc19da5459b709f)
Additional jar required to access Oracle Wallets from Java
(5) osdt_cert.jar (205,154 bytes) - (SHA1 Checksum: c134652fdcb17ff72963d386efd8ade902d2eaff)
Additional jar required to access Oracle Wallets from Java
(6) osdt_core.jar (306,854 bytes) - (SHA1 Checksum: 2e01c262879c97de876c238966eb1da48542f2e8)
Additional jar required to access Oracle Wallets from Java

=============================
JARs for NLS and XDK support 
=============================
(7) orai18n.jar (1,661,488 bytes) - (SHA1 Checksum: a6960d6c18840e07dbc5b6afe760d099e47517bb) 
Classes for NLS support
(8) xdb.jar (262,664 bytes) - (SHA1 Checksum: cf09b941f6d84bdac4c6de2e791f054d2e19dfb7)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 

====================================================
JARs for Real Application Clusters(RAC), ADG, or DG 
====================================================
(9) ons.jar (144,681 bytes) - (SHA1 Checksum: cf3f3ef525c61a27fe9952652a156ddd738b1cd5)
for use by the pure Java client-side Oracle Notification Services (ONS) daemon
(10) simplefan.jar (29,205 bytes) - (SHA1 Checksum: bcbfbb3cc529995f33c8694eb7cbc605c129e4e6)
Java APIs for subscribing to RAC events via ONS; simplefan policy and javadoc

=================
USAGE GUIDELINES
=================
Refer to the JDBC Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/19/jjdbc/index.html) and Universal Connection Pool Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/19/jjucp/index.html)for more details. 
