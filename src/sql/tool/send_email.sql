SELECT *
  FROM evt_registrations
 WHERE reg_evt_id = 2;
 
 

create or replace procedure pjm_send_email
is
  l_text varchar2(32767);
  newline varchar2(10) := chr(10)||chr(13);
  l_cnt number := 0;
begin
   for cur in (SELECT TSK_NAME
  FROM pjm_tasks_active_v tsk
 WHERE tsk_due_on <= TRUNC(SYSDATE)
   AND tsk_type_id = 1 /* Inbox */
) loop
     l_cnt := l_cnt +1;
     l_text := l_text || newline || l_cnt || ': ' || cur.tsk_name;
   end loop;

   wwv_flow_api.set_security_group_id(apex_util.find_security_group_id('OC'));
   apex_mail.send (p_to             => 'daust@opal-consulting.de',
	                    p_from           => 'daust@opal-consulting.de',
	                    p_body           => l_text,
	                    p_body_html      => null,
	                    p_subj           => 'PJM: Aktuelle Aufgaben',
	                    p_cc             => null,
	                    p_bcc            => null,
	                    p_replyto        => NULL
	                   );
  apex_mail.push_queue;
  commit;
end;
/



exec pjm_send_email;


set serveroutput on

prompt *************************************
prompt ***   INSTALL EMAIL_PUSH JOB       ****
prompt *************************************
DECLARE
   l_job   NUMBER;
BEGIN
   BEGIN
      for cur in (
      SELECT *
        FROM user_jobs
       WHERE what like '/* PJM JOB */%' ) loop
       
         DBMS_OUTPUT.put_line ('Der Job mit der ID '|| cur.job || ' wird entfernt.'); 
         DBMS_JOB.remove (job => cur.job);
      end loop;
   END;

   -- Daten alle 4 Stunden senden
   DBMS_JOB.submit (
      job   => l_job
    , what  => '/* PJM JOB */BEGIN pjm_send_email; END;'
    , next_date=> sysdate
    , INTERVAL=> 'sysdate + (4/24)' ); 
    --, INTERVAL=> 'sysdate + (10/(24*60))' );   -- alle 10 minuten
    
   DBMS_OUTPUT.put_line ('Der Job wurde mit der ID '|| l_job || ' eingerichtet.');
END;
/
commit
/




 