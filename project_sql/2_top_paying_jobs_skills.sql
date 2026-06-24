WITH top_paying_jobs AS (
    SELECT
        job_id,
        c.name AS company_name,
        job_title,
        salary_year_avg
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
    LIMIT 10
)

SELECT  
    top_paying_jobs.*,
    skills_dim.skills AS skill_name
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    skills_dim.skills IS NOT NULL
ORDER BY
    salary_year_avg DESC;

/*------------------------------------------------------------------------------------------------

Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
• SQL is leading with a bold count of 8.
• Python follows closely with a bold count of 7.
• Tableau is also highly sought after, with a bold count of 6.
• Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

    [
    {
        "job_id": 1246069,
        "company_name": "Plexus Resource Solutions",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "python"
    },
    {
        "job_id": 1246069,
        "company_name": "Plexus Resource Solutions",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "mysql"
    },
    {
        "job_id": 1246069,
        "company_name": "Plexus Resource Solutions",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "aws"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "sql"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "python"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "r"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "sas"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "matlab"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "pandas"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "tableau"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "looker"
    },
    {
        "job_id": 712473,
        "company_name": "Get It Recruit - Information Technology",
        "job_title": "Data Analyst",
        "salary_year_avg": "165000.0",
        "skill_name": "sas"
    },
    {
        "job_id": 456042,
        "company_name": "Get It Recruit - Healthcare",
        "job_title": "Data Analyst",
        "salary_year_avg": "151500.0",
        "skill_name": "sql"
    },
    {
        "job_id": 456042,
        "company_name": "Get It Recruit - Healthcare",
        "job_title": "Data Analyst",
        "salary_year_avg": "151500.0",
        "skill_name": "python"
    },
    {
        "job_id": 456042,
        "company_name": "Get It Recruit - Healthcare",
        "job_title": "Data Analyst",
        "salary_year_avg": "151500.0",
        "skill_name": "r"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "sql"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "python"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "r"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "golang"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "elasticsearch"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "aws"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "bigquery"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "gcp"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "pandas"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "scikit-learn"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "looker"
    },
    {
        "job_id": 479485,
        "company_name": "Level",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "kubernetes"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "python"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "java"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "r"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "javascript"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "c++"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "tableau"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "power bi"
    },
    {
        "job_id": 405581,
        "company_name": "CyberCoders",
        "job_title": "Data Analyst",
        "salary_year_avg": "145000.0",
        "skill_name": "qlik"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "sql"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "python"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "r"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "swift"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "excel"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "tableau"
    },
    {
        "job_id": 1090975,
        "company_name": "Uber",
        "job_title": "Data Analyst",
        "salary_year_avg": "140500.0",
        "skill_name": "looker"
    },
    {
        "job_id": 1482852,
        "company_name": "Overmind",
        "job_title": "Data Analyst",
        "salary_year_avg": "138500.0",
        "skill_name": "sql"
    },
    {
        "job_id": 1482852,
        "company_name": "Overmind",
        "job_title": "Data Analyst",
        "salary_year_avg": "138500.0",
        "skill_name": "python"
    },
    {
        "job_id": 479965,
        "company_name": "InvestM Technology LLC",
        "job_title": "Data Analyst",
        "salary_year_avg": "135000.0",
        "skill_name": "sql"
    },
    {
        "job_id": 479965,
        "company_name": "InvestM Technology LLC",
        "job_title": "Data Analyst",
        "salary_year_avg": "135000.0",
        "skill_name": "excel"
    },
    {
        "job_id": 479965,
        "company_name": "InvestM Technology LLC",
        "job_title": "Data Analyst",
        "salary_year_avg": "135000.0",
        "skill_name": "power bi"
    },
    {
        "job_id": 1326467,
        "company_name": "EPIC Brokers",
        "job_title": "Data Analyst",
        "salary_year_avg": "135000.0",
        "skill_name": "excel"
    }
    ]
------------------------------------------------------------------------------------------------*/