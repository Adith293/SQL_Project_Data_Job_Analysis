WITH avg_salaries AS 
(
    SELECT
        job_country,
        AVG (salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY
        job_country
)
SELECT 
    job_post.job_id,
    job_post.job_title,
    companies.name,
    job_post.salary_year_avg AS salary_rate,
    CASE
        WHEN job_post.salary_year_avg > avg_salaries.avg_salary
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category,
    EXTRACT (MONTH FROM job_post.job_posted_date) AS posting_month
FROM 
    job_postings_fact AS job_post
INNER JOIN company_dim AS companies
    ON job_post.company_id = companies.company_id
INNER JOIN avg_salaries
    ON job_post.job_country = avg_salaries.job_country
WHERE
    job_post.salary_year_avg IS NOT NULL
ORDER BY
    posting_month