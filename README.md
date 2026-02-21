# Introduction 
Uncovering the landscape of the Data Science job market. This project dives deep into Data Scientist roles to identify 💰 peak compensation trends, 🔥 the most sought-after modeling and coding skills, and 📈 the "sweet spot" where cutting-edge innovation meets top-tier salaries.

🔎 SQL Queries? Check them out here: [project_sql folder](/project_sql/)
# Background 
This project originated from a need to decode the complexities of the data science career landscape. The goal is to identify the intersection of high-paying roles and the most sought-after data science competencies—from statistical modeling to deep learning—to help others find their optimal career path.

The dataset is sourced from [Luke Barousse's SQL Course](https://lukebarousse.com/sql), providing a comprehensive foundation of job titles, compensation, and geographic trends.

## The questions I wanted to answer through my SQL Queries were:
1. What are the top paying data scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data scientists?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For this project, I utilized a specialized technical stack to handle the complexities of the Data Science job market, ensuring data integrity and a professional development workflow:

- **SQL**: The primary language used for sophisticated data extraction and processing, allowing me to distill vast amounts of job market information into actionable datasets.

- **PostgreSQL**: Chosen as the core database management system to handle structured data storage, ensuring high performance and reliability during intensive data modeling tasks.

- **Visual Studio Code (VS Code)**: My integrated development environment (IDE) of choice for executing scripts, managing project files, and maintaining a streamlined coding workflow.

- **Git & GitHub**: Utilized for rigorous version control and collaborative transparency, hosting my codebase to ensure the reproducibility of my data science findings.

# The Analysis
Each query for this project aimed at investigating specific aspects at the data scientist job market. 
Here is how I approached each question:

### 1. Top Paying Data Scientist Jobs
To identify the highest-paying roles, I filtered data scientist positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

``` sql
SELECT 
    job_id, 
    job_title,
    job_location,
    job_schedule_type, 
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
LIMIT 10;
```

Based on the analysis of the top 10 highest-paying remote Data Scientist roles in 2023, here are the key insights:

-  Extreme Salary Outliers:

    The salary range within the top 10 is broad, spanning from $300,000 to $550,000.
    The top two roles are significantly higher than the rest, both coming from Selby Jennings and exceeding $525,000.
    The average salary for these top 10 roles is approximately $365,850.

- Seniority and Specialization are Key:

    The data shows that high pay isn't just for "Managers" but also for highly specialized "Individual Contributor" roles:

    1. Staff Data Scientist and Quant Researcher positions hold the #1 and #2 spots, outearning "Director" and "Head of" roles.

    2. Specialized Domains: Roles like "Head of Battery Data Science" and "Quant Researcher" suggest that niche domain expertise (energy, finance) commands a premium.

- Top Employers for High-Pay Roles
Two companies appear multiple times in the top 10 list, marking them as significant players in the high-end talent market:

    1. Selby Jennings: Dominates the top 2 spots (Staff roles).

    2. Demandbase: Listed twice for "Head of Data Science" positions.

-  Remote Work is the Standard for Top Tier
A notable trend is that 100% of these top-paying roles are listed with a location of "Anywhere" and a schedule of "Full-time." This confirms that the highest-tier compensation in data science is fully accessible to remote workers, likely because companies are willing to hire globally to secure top-tier talent.

💡

![Top Paying Roles](assets\Code_Generated_Image.PNG)

**Bar graph visualizing the salaries for the top 10 high paying job roles for data scientists;Gemini generated this graph from my SQL query result**

## 2. Skills Required for Top Paying Data Scientist Job Roles

```
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

```

| Rank | Job Title | Company | Salary (Avg) |
| :--- | :--- | :--- | ---: |
| 1 | Staff Data Scientist/Quant Researcher | Selby Jennings | $550,000 |
| 2 | Staff Data Scientist - Business Analytics | Selby Jennings | $525,000 |
| 3 | Data Scientist | Algo Capital Group | $375,000 |
| 4 | Head of Data Science | Demandbase | $351,500 |
| 5 | Head of Data Science | Demandbase | $324,000 |
| 6 | Director Level - Data Science | Teramind | $320,000 |
| 7 | Director of Data Science & Analytics | Reddit | $313,000 |
| 8 | Principal Data Scientist | Storm5 | $300,000 |
| 9 | Head of Battery Data Science | Lawrence Harvey | $300,000 |
| 10 | Distinguished Data Scientist | Walmart | $300,000 |

Based on the analysis of the remote top-paying Data Scientist job postings from 2023, here are the key insights regarding the required skills:

- **Most Frequently Required Skills**
    
Python and SQL remain the dominant skills for top-paying remote roles, appearing in nearly all the highest-compensated job postings.
    
    I. Python (5 mentions)
    II. SQL (4 mentions)
    III. AWS (3 mentions)
    IV. Java & GCP (2 mentions each)

- **Skills with Highest Average Salaries**
 
While Python and SQL are common, certain specialized technologies appear in roles with exceptionally high average pay:

-- SQL tops the average salary list at $437,500, largely due to its presence in the highest-paying "Staff Data Scientist" roles.

-- Tableau, Cassandra, Hadoop, and Spark all share an average salary of $375,000, indicating that Big Data and Visualization tools are critical for mid-to-high tier compensation.

-- Python roles have a high average salary of $365,000.

-- Machine Learning frameworks like TensorFlow, Scikit-learn, Keras, and PyTorch all average around $320,000.

- **Key Skill Categories**

-- Core Languages: Python, SQL, and Java are the foundational requirements.

-- Cloud Computing: AWS and GCP are the most requested cloud platforms for these high-paying roles.

--Big Data & Infrastructure: Cassandra, Hadoop, and Spark are valuable for roles dealing with large-scale data processing.

-- Machine Learning: Frameworks like PyTorch and TensorFlow are consistently present in the $300k+ salary range.

**The following charts visualize these trends:**

💡
![Top 10 most Demanded Skills in top paying Remote Data scientist roles](assets\skilltrend1.PNG)
This Chart shows us the most demanded skills required in top paying remote data scientist roles with **Python** leading the chart followed by **SQL**



💡
![Top 10 highest paying skills(average salary)](assets\skilltrend2.PNG)
This second chart visualizes the Skills with the high average salaries.  **SQL** leads this chart, followed by **TABLEAU**

| Rank | Skill | Average Salary |
| :--- | :--- | ---: |
| 1 | SQL | $437,500 |
| 2 | Tableau | $375,000 |
| 3 | Cassandra | $375,000 |
| 4 | Hadoop | $375,000 |
| 5 | Spark | $375,000 |
| 6 | Python | $365,000 |
| 7 | Java | $337,500 |
| 8 | TensorFlow | $320,000 |
| 9 | PyTorch | $320,000 |
| 10 | Azure | $320,000 |
| 11 | Keras | $320,000 |
| 12 | Scikit-learn | $320,000 |
| 13 | AWS | $306,666 |
| 14 | GCP | $300,000 |
| 15 | Pandas | $300,000 |
| 16 | Numpy | $300,000 |
| 17 | C | $300,000 |
| 18 | DataRobot | $300,000 |


## 3. Top Optimal Skills - High Pay High Demand
 ```
 SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home=True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
     demand_count DESC,
    average_salary DESC
   
LIMIT 25;
 ```
| Skill | Demand Count | Average Salary |
| :--- | ---: | ---: |
| Python | 763 | $143,828 |
| SQL | 591 | $142,833 |
| R | 394 | $137,885 |
| Tableau | 219 | $146,970 |
| AWS | 217 | $149,630 |
| Spark | 149 | $150,188 |
| Tensorflow | 126 | $151,536 |
| Azure | 122 | $142,306 |
| Pytorch | 115 | $152,603 |
| Pandas | 113 | $144,816 |
| SAS | 110 | $129,920 |
| SAS | 110 | $129,920 |
| Hadoop | 82 | $143,322 |
| Scikit-Learn | 81 | $148,964 |
| Excel | 77 | $129,224 |
| Numpy | 73 | $149,089 |
| Snowflake | 72 | $152,687 |
| Power BI | 72 | $131,390 |
| Java | 64 | $145,706 |
| Databricks | 63 | $139,631 |
| GCP | 59 | $155,811 |
| Git | 58 | $132,599 |
| Go | 57 | $164,691 |
| Looker | 57 | $158,715 |
| Scala | 56 | $156,702 |

 Based on the data for "Optimal Skills"—defined by the balance of high demand and high compensation—here are the key findings and strategic insights for Data Scientists:

- ### The "Big Three" Foundations (Highest Demand)
Python, SQL, and R are the undisputed foundations of the field.

-- Python is the leader with 763 mentions and a solid $143,828 average salary.

-- SQL follows closely in demand (591).

Insight: These are the "safe bets." While they don't have the highest individual salaries in this list, their massive demand makes them essential for job security across all industries.

- ### The High-Pay "Specialist" Tier
The highest average salaries in the "Optimal" category don't go to the most common tools, but to specialized languages and modern data stack components:

-- Go ($164,691) and Scala ($156,702): These languages are often used in high-performance data engineering and distributed systems.

-- Looker ($158,715) and Snowflake ($152,687): Proficiency in modern business intelligence and cloud data warehousing commands a significant premium over traditional tools like Excel or Power BI.

-- GCP ($155,811): Among cloud providers, Google Cloud Platform (GCP) roles currently show a higher average salary than AWS or Azure in this dataset.

- ### The Machine Learning "Sweet Spot"
Frameworks like PyTorch and TensorFlow represent the perfect balance for an advanced practitioner:

-- PyTorch ($152,603) and TensorFlow ($151,536) both have high demand (over 100+ mentions) and salaries significantly above the $150k mark.

-- Insight: If you are moving from a generalist to a specialist, mastering these ML frameworks is the most direct path to a salary bump without sacrificing job opportunities.

- ## Cloud & Big Data Synergy
The "Big Data" stack remains lucrative:

-- Spark ($150,188) and AWS ($149,630) are high-demand skills that consistently pull salaries near the top of the range.

-- Snowflake and Databricks are the rising stars in this category, representing the shift toward cloud-based data lakehouses.

- ## The Salary Floor vs. Ceiling
-- Traditional Tools: Excel ($129,224) and SAS ($129,920) have the lowest average salaries in this "Optimal" list.

-- Modern Visualization: Tableau ($146,970) pays roughly $15k more on average than **Power BI ($131,390)**, suggesting that top-paying remote roles currently favor the Tableau ecosystem.

# Strategic Recommendation:
To maximize your market value:

1. Maintain the core: Python & SQL.

2. Specialize in an ML framework: PyTorch is currently the leader in pay.

3. Adopt high-performance tools: Adding Go, Scala, or Snowflake to your toolkit can push your compensation toward the $160k+ bracket.



# What I learned Conclusions

### **Project Summary: Data Science Market Intelligence**

**Technical Expertise:**

* **Advanced SQL & Data Engineering:** Mastered complex SQL techniques to join multiple datasets, filter high-value records, and aggregate data to transform raw job postings into structured market insights.
* **Quantitative Analysis:** Performed exploratory data analysis (EDA) to identify salary benchmarks, demand trends, and statistical outliers in the 2023 remote job market.

**Strategic Insights Delivered:**

* **Identified Elite Roles:** Pinpointed that Staff-level and Quant roles lead the market, with salaries exceeding **$500k**.
* **Determined "Optimal Skills":** Discovered the high-demand, high-pay "sweet spot" with frameworks like **PyTorch** and **Snowflake**.
* **Skill Categorization:** Classified technologies into foundational (SQL/Python), infrastructure (AWS/Spark), and niche multipliers (Go/Scala) to guide career roadmapping.

## **Conclusion:**
Successfully demonstrated the ability to function as a **Data-Driven Strategist** by using technical SQL workflows to extract, clean, and analyze complex data into actionable executive insights.