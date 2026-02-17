SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short='Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY 
    average_salary DESC
LIMIT 25;

/*
here are the key insights and trends:

1. Surprising Dominance of Productivity & Management Tools
The most striking trend is that Asana ($215,477) and Airtable ($201,143) occupy the top two spots.

Insight: This suggests that "Data Scientist" roles at the highest pay scales often require strong project management and operational workflow expertise. Companies are willing to pay a premium for scientists who can not only build models but also manage complex cross-functional pipelines and team synchronization.

2. High-Value Niche Programming Languages
Specialized or "functional" programming languages appear frequently, often paying more than generalist languages:

Elixir ($170k+), Lua ($170k+), and Haskell ($157k+) are all in the top 25.

Solidity ($166,980) indicates a high-paying niche for Data Scientists working in Blockchain/Web3 environments.

R-specific tools like RShiny and dplyr remain highly lucrative, showing that deep expertise in the R ecosystem is still a path to top-tier compensation.

3. Data Engineering & Cloud Infrastructure
The presence of Airflow ($155k), BigQuery ($149k), and Red Hat ($189k) highlights the "Data Scientist/Engineer" hybrid trend.

Insight: Being able to manage data orchestration (Airflow) and cloud-native data warehouses (BigQuery) significantly boosts a candidate's market value.

4. The Rise of "Generative AI" and Graph Tech
Hugging Face ($160,868): As the hub for open-source AI, proficiency with Hugging Face has quickly become a top-paying ML skill, reflecting the 2023 surge in LLM and Generative AI interest.

Neo4j ($163,971): The inclusion of graph databases suggests high demand in specialized sectors like fraud detection, recommendation engines, and social network analysis.

5. Gaming Engines in Data Science
The presence of Unity ($156k) and Unreal ($153k) points toward the growing field of Synthetic Data Generation and Digital Twins. Data scientists are increasingly using these engines to simulate environments for training AI models (e.g., in autonomous driving or robotics).

/*