begin
  sys.dbms_scheduler.create_job(job_name            => 'EDFIDATA."LOAD STU CACHE ALL DISTRICTS"',
                                job_type            => 'STORED_PROCEDURE',
                                job_action          => 'pkg_assessment_upload.proc_cache_students',
                                start_date          => to_date('27-05-2022 00:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                                repeat_interval     => 'Freq=Daily;Interval=1;ByHour=05',
                                end_date            => to_date(null),
                                job_class           => 'DEFAULT_JOB_CLASS',
                                enabled             => true,
                                auto_drop           => false,
                                comments            => '');
  sys.dbms_scheduler.set_attribute(name => 'EDFIDATA."LOAD STU CACHE ALL DISTRICTS"', attribute => 'raise_events', value => sys.dbms_scheduler.job_failed);
end;
/
