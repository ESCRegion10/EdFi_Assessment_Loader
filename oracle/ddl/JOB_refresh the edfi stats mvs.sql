begin
  sys.dbms_scheduler.create_job(job_name            => 'EDFIDATA."REFRESH THE EDFI STATS MVS"',
                                job_type            => 'STORED_PROCEDURE',
                                job_action          => 'PKG_UPDATE_STUDENT_ATTRIBUTES.REFRESH_MV_EDFI_STATS',
                                start_date          => to_date('08-01-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                                repeat_interval     => 'Freq=Minutely;Interval=15',
                                end_date            => to_date(null),
                                job_class           => 'DEFAULT_JOB_CLASS',
                                enabled             => true,
                                auto_drop           => false,
                                comments            => '');
end;
/
