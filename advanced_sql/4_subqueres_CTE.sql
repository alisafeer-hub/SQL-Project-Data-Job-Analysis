SELECT *
FROM job_postings_fact AS january_jobs
WHERE EXTRACT(MONTH FROM job_posted_date) = 1

-- An example of where a Subquery is actually necessary
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
AND salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact);


WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;



SELECT name AS company_name
FROM company_dim
WHERE company_id IN (
SELECT
    DISTINCT company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = TRUE
ORDER BY
    company_id
    );

WITH company_job_count AS (
SELECT
    company_id,
    COUNT(company_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
    )

SELECT 
company_dim.name AS company_name,
company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY company_job_count.total_jobs DESC;

--Practice Problem no 7
WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS jp ON
jp.job_id = skills_to_job.job_id
WHERE
    jp.job_work_from_home = TRUE AND jp.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
    )

SELECT 
    remote_job_skills.skill_id,
    skills.skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON
skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;

-- Practice Problem no 29
SELECT
    companies.name,
    job_count,
    job_size_category
FROM (
SELECT
    company_id,
    COUNT(job_id) AS job_count,
CASE
    WHEN  COUNT(job_id) < 10 THEN 'Small'
    WHEN  COUNT(job_id) BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Large'
END AS job_size_category
FROM
    job_postings_fact
GROUP BY
    company_id
    ) AS jp
INNER JOIN company_dim AS companies ON
jp.company_id = companies.company_id
ORDER BY
    job_count DESC;