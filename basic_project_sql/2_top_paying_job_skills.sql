/*
Question: What skills are required for the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs deman certain skills,
  helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'New York' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM   top_paying_jobs
INNER JOIN skills_job_dim ON
top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
        salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for Data Analyst in 2023, based on job postings:
- SQL is leading with a bold count of 7.
- Python follows closely with a bold count of 5.
- Other skills like Tableau, Excel, Visual Basic, Oracle, and R show varying degrees of demand.

[
  {
    "job_id": 1306755,
    "company_name": "Engage Partners, Inc.",
    "job_title": "Data Analyst (Oracle DBA)",
    "job_location": "New York",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 1306755,
    "company_name": "Engage Partners, Inc.",
    "job_title": "Data Analyst (Oracle DBA)",
    "job_location": "New York",
    "salary_year_avg": "140000.0",
    "skills": "visual basic"
  },
  {
    "job_id": 1306755,
    "company_name": "Engage Partners, Inc.",
    "job_title": "Data Analyst (Oracle DBA)",
    "job_location": "New York",
    "salary_year_avg": "140000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1306755,
    "company_name": "Engage Partners, Inc.",
    "job_title": "Data Analyst (Oracle DBA)",
    "job_location": "New York",
    "salary_year_avg": "140000.0",
    "skills": "cognos"
  },
  {
    "job_id": 1306755,
    "company_name": "Engage Partners, Inc.",
    "job_title": "Data Analyst (Oracle DBA)",
    "job_location": "New York",
    "salary_year_avg": "140000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 281101,
    "company_name": "Pull Skill Technologies",
    "job_title": "Oracle DBA/Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 281101,
    "company_name": "Pull Skill Technologies",
    "job_title": "Oracle DBA/Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "100000.0",
    "skills": "visual basic"
  },
  {
    "job_id": 281101,
    "company_name": "Pull Skill Technologies",
    "job_title": "Oracle DBA/Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "100000.0",
    "skills": "oracle"
  },
  {
    "job_id": 281101,
    "company_name": "Pull Skill Technologies",
    "job_title": "Oracle DBA/Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "100000.0",
    "skills": "cognos"
  },
  {
    "job_id": 281101,
    "company_name": "Pull Skill Technologies",
    "job_title": "Oracle DBA/Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "100000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "sql"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "python"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "visual basic"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "sql server"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "oracle"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "hadoop"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "excel"
  },
  {
    "job_id": 600227,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - AVP Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "89830.0",
    "skills": "tableau"
  },
  {
    "job_id": 605322,
    "company_name": "Acadia Technologies, Inc.",
    "job_title": "Business Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 605322,
    "company_name": "Acadia Technologies, Inc.",
    "job_title": "Business Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 605322,
    "company_name": "Acadia Technologies, Inc.",
    "job_title": "Business Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "80000.0",
    "skills": "nosql"
  },
  {
    "job_id": 605322,
    "company_name": "Acadia Technologies, Inc.",
    "job_title": "Business Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 605322,
    "company_name": "Acadia Technologies, Inc.",
    "job_title": "Business Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "80000.0",
    "skills": "matlab"
  },
  {
    "job_id": 659255,
    "company_name": "Knoxville Utilities Board",
    "job_title": "Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "73100.0",
    "skills": "sql"
  },
  {
    "job_id": 659255,
    "company_name": "Knoxville Utilities Board",
    "job_title": "Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "73100.0",
    "skills": "python"
  },
  {
    "job_id": 659255,
    "company_name": "Knoxville Utilities Board",
    "job_title": "Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "73100.0",
    "skills": "power bi"
  },
  {
    "job_id": 1684727,
    "company_name": "Siri Infosolutions Inc",
    "job_title": "Market Research & Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1684727,
    "company_name": "Siri Infosolutions Inc",
    "job_title": "Market Research & Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 1684727,
    "company_name": "Siri Infosolutions Inc",
    "job_title": "Market Research & Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 1684727,
    "company_name": "Siri Infosolutions Inc",
    "job_title": "Market Research & Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1684727,
    "company_name": "Siri Infosolutions Inc",
    "job_title": "Market Research & Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "70000.0",
    "skills": "looker"
  },
  {
    "job_id": 1795958,
    "company_name": "Montefiore Medical Center",
    "job_title": "Data analyst",
    "job_location": "New York",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 39074,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "53620.0",
    "skills": "sql"
  },
  {
    "job_id": 39074,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "53620.0",
    "skills": "python"
  },
  {
    "job_id": 39074,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "53620.0",
    "skills": "r"
  },
  {
    "job_id": 39074,
    "company_name": "Citi",
    "job_title": "Institutional Credit Management - Data Analyst",
    "job_location": "New York",
    "salary_year_avg": "53620.0",
    "skills": "tableau"
  }
]
*/