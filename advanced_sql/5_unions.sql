SELECT *
FROM january_jobs;

SELECT *
FROM february_jobs;

SELECT *
FROM march_jobs;

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

-- Practice Problem no 30
SELECT 
    jj.job_title_short,
    skills.skills,
    skills.type
FROM
    january_jobs AS jj
LEFT JOIN skills_job_dim AS skills_to_job ON
jj.job_id = skills_to_job.job_id
LEFT JOIN skills_dim AS skills ON
skills_to_job.skill_id = skills.skill_id
WHERE
    jj.salary_year_avg > 70000

UNION ALL

SELECT 
    fj.job_title_short,
    skills.skills,
    skills.type
FROM
    february_jobs AS fj
LEFT JOIN skills_job_dim AS skills_to_job ON
fj.job_id = skills_to_job.job_id
LEFT JOIN skills_dim AS skills ON
skills_to_job.skill_id = skills.skill_id
WHERE
    fj.salary_year_avg > 70000

UNION ALL

SELECT 
    mj.job_title_short,
    skills.skills,
    skills.type
FROM
    march_jobs AS mj
LEFT JOIN skills_job_dim AS skills_to_job ON
mj.job_id = skills_to_job.job_id
LEFT JOIN skills_dim AS skills ON
skills_to_job.skill_id = skills.skill_id
WHERE
    mj.salary_year_avg > 70000;

--Practice Problem no 8
SELECT 
    quarter1_jobs.job_title_short,
    quarter1_jobs.job_location,
    quarter1_jobs.job_via,
    quarter1_jobs.job_posted_date::DATE,
    quarter1_jobs.salary_year_avg
FROM (
SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs
    ) AS quarter1_jobs
WHERE
    quarter1_jobs.salary_year_avg > 70000 AND
    quarter1_jobs.job_title_short = 'Data Analyst'
ORDER BY
    quarter1_jobs.salary_year_avg DESC;