SELECT
    COUNT(job_id) AS no_of_job_postings,
    CASE
        WHEN salary_year_avg > 120000 THEN 'High'
        WHEN salary_year_avg BETWEEN 70000 AND 120000 THEN 'Standard'
        WHEN salary_year_avg < 70000 THEN 'Low'
        ELSE 'Not_paying'
    END AS salary_range
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY 
salary_range
ORDER BY no_of_job_postings DESC;