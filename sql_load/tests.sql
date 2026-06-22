WITH req_skills AS
(
    SELECT 
        comp.company_id,
        COUNT (DISTINCT skillsjob.skill_id) AS unique_skills_req
    FROM company_dim AS comp
    LEFT JOIN job_postings_fact AS job_post 
        ON comp.company_id = job_post.company_id
    LEFT JOIN skills_job_dim AS skillsjob
        ON job_post.job_id = skillsjob.job_id
    GROUP BY
        comp.company_id
),
max_salary AS 
(
    SELECT
        job_post.company_id,
        MAX (job_post.salary_year_avg) AS highest_sal
    FROM job_postings_fact  AS job_post
    WHERE 
        job_post.job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY
        job_post.company_id
)
SELECT
    comp.name,
    req_skills.unique_skills_req AS unique_skills_req,
    max_salary.highest_sal AS highest_salary
FROM company_dim AS comp
LEFT JOIN req_skills 
    ON comp.company_id = req_skills.company_id
LEFT JOIN max_salary 
    ON comp.company_id = max_salary.company_id
ORDER BY
    comp.name