create or replace 
PACKAGE "XLIB_LOG"
IS
/*=========================================================================
  $Id: xlib_log.pks 56 2013-05-13 07:06:46Z dietmar.aust $

  Purpose  : Application Logging
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14
             
  $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  13.05.2012  D. Aust         insert fails when created_by user value too large

=========================================================================*/

PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level        PLS_INTEGER DEFAULT 15
   );
END;
/


