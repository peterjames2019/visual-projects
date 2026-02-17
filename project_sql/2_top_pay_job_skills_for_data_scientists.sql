WITH top_paying_remote_jobs AS(
    SELECT 
        job_id, 
        job_title,
        job_location,
        salary_year_avg,
        company_dim.name 
    FROM job_postings_fact

    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id

    WHERE
        job_title_short = 'Data Scientist' AND
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_remote_jobs.*,
    skills_dim.skills
FROM top_paying_remote_jobs
INNER JOIN skills_job_dim ON top_paying_remote_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id;



/*
1. Most Frequently Required Skills
Python and SQL remain the dominant skills for top-paying remote roles, appearing in nearly all the highest-compensated job postings.
Python (5 mentions)
SQL (4 mentions)
AWS (3 mentions)
Java & GCP (2 mentions each)

2. Skills with Highest Average Salaries
While Python and SQL are common, certain specialized technologies appear in roles with exceptionally high average pay:

SQL tops the average salary list at $437,500, largely due to its presence in the highest-paying "Staff Data Scientist" roles.

Tableau, Cassandra, Hadoop, and Spark all share an average salary of $375,000, indicating that Big Data and Visualization tools are critical for mid-to-high tier compensation.

Python roles have a high average salary of $365,000.

Machine Learning frameworks like TensorFlow, Scikit-learn, Keras, and PyTorch all average around $320,000.

3. Key Skill Categories
Core Languages: Python, SQL, and Java are the foundational requirements.

Cloud Computing: AWS and GCP are the most requested cloud platforms for these high-paying roles.

Big Data & Infrastructure: Cassandra, Hadoop, and Spark are valuable for roles dealing with large-scale data processing.

Machine Learning: Frameworks like PyTorch and TensorFlow are consistently present in the $300k+ salary range.
/*