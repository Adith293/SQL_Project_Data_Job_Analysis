SELECT
    quater1_job_postings.job_title_short,
    quater1_job_postings.job_location,
    quater1_job_postings.job_via,
    quater1_job_postings.job_posted_date::date,
    quater1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM 
        jan_jobs
    UNION ALL
    SELECT *
    FROM
        feb_jobs
    UNION ALL
    SELECT *
    FROM
        mar_jobs
) AS quater1_job_postings
WHERE
    quater1_job_postings.salary_year_avg > 70000 AND
    quater1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quater1_job_postings.salary_year_avg DESC