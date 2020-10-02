/*=========================================================================
  $Id: xlog.sql 57 2013-05-13 07:09:51Z dietmar.aust $

  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  $LastChangedDate: 2013-05-13 09:09:51 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

CREATE OR REPLACE PROCEDURE "XLOG" (
   p_module   IN   VARCHAR2,
   p_msg      IN   VARCHAR2,
   p_type     IN   VARCHAR2 DEFAULT 'DEBUG',
   p_level         PLS_INTEGER DEFAULT 15
)
IS
BEGIN
   xlib_log.m (p_module      => p_module,
                       p_msg         => p_msg,
                       p_type        => p_type,
                       p_level       => p_level
                      );
END xlog;
/


