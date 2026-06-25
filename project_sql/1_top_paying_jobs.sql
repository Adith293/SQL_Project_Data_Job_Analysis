SELECT
    job_id,
    c.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim as c
    ON job_postings_fact.company_id = c.company_id
WHERE
    job_title = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;