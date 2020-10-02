/*=========================================================================
  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  29.09.2020  D. Aust         simplify install scripts

=========================================================================*/

define USERNAME=&&1

spool sys_install.log

GRANT   CONNECT TO &&USERNAME;
GRANT   RESOURCE TO &&USERNAME;
GRANT   CREATE VIEW TO &&USERNAME;
GRANT   CREATE SYNONYM TO &&USERNAME;

grant execute on sys.utl_http to &&USERNAME;

spool off 

