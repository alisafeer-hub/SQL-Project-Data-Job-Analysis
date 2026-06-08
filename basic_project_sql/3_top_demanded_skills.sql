/*
Question: What are the most in-demad skills for Data Analyst?
- Identify the top 5 in-demand skills for a Data Analyst.
- Focus of all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market.
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS job_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    job_count DESC
LIMIT 5;