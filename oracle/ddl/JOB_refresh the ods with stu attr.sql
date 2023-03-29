begin
  sys.dbms_scheduler.create_job(job_name            => 'EDFIDATA."REFRESH THE ODS WITH STU ATTR"',
                                job_type            => 'STORED_PROCEDURE',
                                job_action          => 'PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_REFRESH_ODS_UPDATES',
                                start_date          => to_date('14-01-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                                repeat_interval     => 'Freq=Daily;ByHour=22',
                                end_date            => to_date(null),
                                job_class           => 'DEFAULT_JOB_CLASS',
                                enabled             => true,
                                auto_drop           => false,
                                comments            => '');
  sys.dbms_scheduler.set_attribute(name => 'EDFIDATA."REFRESH THE ODS WITH STU ATTR"', attribute => 'raise_events', value => sys.dbms_scheduler.job_failed);
end;
/
