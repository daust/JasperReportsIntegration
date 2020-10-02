/*=========================================================================
  Purpose  : configuration table which contains the default parameter for 
             a specific JasperReportsInstallation

             Here... the default values
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
              
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  01.10.2020  D. Aust         Initial creation

=========================================================================*/


insert into xlib_jasperreports_conf(conf_id, conf_protocol, conf_server, conf_port, conf_context_path)
values
('MAIN', 'http', 'localhost', '80', 'jri');

commit;

