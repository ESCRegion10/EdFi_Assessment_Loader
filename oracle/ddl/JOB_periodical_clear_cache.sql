begin
  sys.dbms_scheduler.create_job(job_name            => 'EDFIDATA."PERIODICAL CLEAR CACHE"',
                                job_type            => 'STORED_PROCEDURE',
                                job_action          => 'PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_CLEAR_CACHE_TABLES',
                                start_date          => to_date('07-01-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                                repeat_interval     => 'Freq=Minutely;Interval=60',
                                end_date            => to_date(null),
                                job_class           => 'DEFAULT_JOB_CLASS',
                                enabled             => true,
                                auto_drop           => false,
                                comments            => 'This will clear the cache tables that had to be created due to the dblinks');
end;
/
