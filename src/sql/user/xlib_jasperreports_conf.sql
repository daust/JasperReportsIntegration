/*=========================================================================
  Purpose  : configuration table which contains the default parameter for 
             a specific JasperReportsInstallation
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
              
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  01.10.2020  D. Aust         Initial creation

=========================================================================*/

CREATE TABLE xlib_jasperreports_conf
(
   CONF_ID                      VARCHAR2 (20 BYTE) DEFAULT 'MAIN' NOT NULL ENABLE,
   CONF_PROTOCOL                VARCHAR2 (20 BYTE) NOT NULL ENABLE,
   CONF_SERVER                  VARCHAR2 (200 BYTE) NOT NULL ENABLE,
   CONF_PORT                    VARCHAR2 (20 BYTE) NOT NULL ENABLE,
   CONF_CONTEXT_PATH            VARCHAR2 (100 BYTE) NOT NULL ENABLE,
   CONF_WALLET_PATH             VARCHAR2 (4000 BYTE),
   CONF_WALLET_PWD              VARCHAR2 (500 BYTE),
   CONF_HTTP_TRANSFER_TIMEOUT   NUMBER DEFAULT 60,
   CONSTRAINT XLIB_JASPERREPORTS_CONF_PK PRIMARY KEY (CONF_ID),
   CONSTRAINT XLIB_JASPERREPORTS_CONF_CHK1 CHECK (LOWER (conf_protocol) IN ('http', 'https')) ENABLE
);

COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_ID IS 'Currently, we only expect a single row here ';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_PROTOCOL IS 'Protocol, either http or https';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_SERVER IS 'Servername, e.g. localhost, www.server.com or ip address, e.g. 127.0.0.1';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_PORT IS 'Port, e.g. 80, 8080, 443';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_CONTEXT_PATH IS 'Context path for the web application, typically the name of the war file, e.g. jri';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_WALLET_PATH IS 'Path to the wallet directory, if used';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_WALLET_PWD IS 'Password for the wallet';
COMMENT ON COLUMN XLIB_JASPERREPORTS_CONF.CONF_HTTP_TRANSFER_TIMEOUT IS 'Timeout in seconds, the default is typically 60 seconds';


