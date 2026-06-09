# SQL Project: Data Job Analysis 🔍

> Exploring the data analyst job market through SQL — uncovering top-paying roles, in-demand skills, and where high salaries meet high demand.

📂 SQL queries: [`basic_project_sql/`](/basic_project_sql/)

---

# INTRODUCTION

The data job market is evolving rapidly, and navigating it effectively requires more than intuition — it requires data. This project dives deep into **data analyst job postings** to surface actionable insights about salaries, skills, and market demand.

Using structured SQL queries against a rich dataset of job postings, this analysis answers key questions every aspiring or current data analyst should care about:

- 💸 Which data analyst roles pay the most?
- 🔥 What skills are employers demanding most frequently?
- 📈 Where does high skill demand overlap with high salaries?
- 🏆 What are the most *optimal* skills to learn for maximum market value?

---

# BACKGROUND

This project was built as part of the **[SQL for Data Analytics course by Luke Barousse](https://lukebarousse.com/sql)**. The goal was to go beyond exercises and apply SQL to real-world questions about the job market — using a dataset packed with job titles, salaries, locations, required skills, and company information from 2023 job postings.

The driving motivation: instead of guessing which skills to learn or which roles to target, why not *query the data* and find out?

**Key questions driving this analysis:**

1. What are the top-paying data analyst jobs?
2. What skills are required for those top-paying roles?
3. What skills are most in demand across all data analyst job postings?
4. Which skills command the highest average salaries?
5. What are the most optimal skills to learn — high demand *and* high pay?

---

# TOOLS I USED

The following tools powered every stage of this project:

| Tool | Purpose |
|------|---------|
| **SQL** | Core language for all querying, filtering, aggregating, and joining of data |
| **PostgreSQL** | Database management system used to host and query the job postings dataset |
| **Visual Studio Code** | Primary IDE for writing and executing SQL queries with the PostgreSQL extension |
| **Git** | Version control to track changes and manage the project throughout development |
| **GitHub** | Remote repository for storing and sharing SQL scripts and project files |

---

# THE ANALYSIS

Each query in the `basic_project_sql/` folder targets a specific question about the data analyst job market. Here's a breakdown of the analytical approach:

### 1. 💸 Top-Paying Data Analyst Jobs

Filtered job postings by average yearly salary and location, focusing on remote (anywhere) positions. This surfaces the highest-paying opportunities and the companies offering them — helping identify where the real money is in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

**Finding:** The highest-paying remote data analyst roles reach up to **$650,000/year**, with a wide salary range across companies.

---

### 2. 🛠️ Skills for Top-Paying Jobs

Joined the top-paying job results with the skills data to reveal which technical skills appear most frequently among high-salary postings. This shows what employers *actually* expect at the top of the pay scale.

![Skills for Top-Paying jobs](/assets/Code_Generated_Image.png)

**Finding:** High-paying roles consistently require advanced proficiency in **SQL**, followed by Python, Tableau, and cloud tools.

---

### 3. 🔥 Most In-Demand Skills

Aggregated skill mentions across all data analyst postings to identify the most frequently requested skills in the job market — not just the high-paying ones.

**Finding:** The top 5 most in-demand skills are:

| Skill | Demand Count |
|-------|-------------|
| SQL | 7,291 |
| Excel | 4,611 |
| Python | 4,330 |
| Tableau | 3,745 |
| Power BI | 2,609 |

---

### 4. 💰 Skills with the Highest Salaries

Calculated average salaries associated with each skill to find which specialized abilities translate into the biggest paychecks — even if they're not the most common.

**Finding:** Niche and specialized skills like **Kafka**, **PyTorch**, **Snowflake**, and **Azure** are associated with significantly above-average salaries, pointing to a premium on cloud and big data expertise.

---

### 5. 📈 Most Optimal Skills to Learn

Combined demand count and average salary data to identify skills that offer the best of both worlds — high market demand *and* high earning potential. These are the strategic picks for career growth.

**Finding:** **SQL** tops the list as the single most optimal skill — leading in both demand and average salary. Cloud platforms and BI tools (Tableau, Power BI, Snowflake) also offer strong returns.

---

# WHAT I LEARNED

This project sharpened both technical SQL skills and analytical thinking:

- **🧩 Complex Query Crafting** — Practiced multi-table JOINs, subqueries, and `WITH` clauses (CTEs) to break down layered analytical questions into clean, readable SQL.

- **📊 Data Aggregation** — Used `GROUP BY`, `COUNT()`, `AVG()`, and `ORDER BY` to summarize and rank large datasets into meaningful insights.

- **💡 Turning Questions into Queries** — Developed the habit of translating real-world business questions into structured SQL logic — a core skill for any data analyst.

- **🔄 Working with Relational Data** — Navigated a multi-table schema (job postings, companies, skills, skill mappings) and understood how data relationships reveal insights that a single table cannot.

- **🛠️ Tool Proficiency** — Gained hands-on experience with PostgreSQL and VS Code as a full development environment, and established a professional Git/GitHub workflow for a data project.

---

# CONCLUSIONS

This analysis of the 2023 data analyst job market produced clear, actionable takeaways:

1. **Top-Paying Jobs Have a Wide Salary Range** — Remote data analyst salaries vary dramatically, from ~$60K to $650K, depending on seniority, company, and specialization.

2. **SQL Is Non-Negotiable** — SQL is both the most demanded skill *and* a strong predictor of high salaries. For any data analyst, it is the single most important skill to master.

3. **Excel Still Matters** — Despite the rise of Python and BI tools, Excel remains the second most demanded skill, especially in traditional industries.

4. **Cloud & Specialized Skills Pay a Premium** — Skills in Snowflake, Azure, AWS, Spark, and similar technologies command salaries well above the median, reflecting the market's shift toward cloud-based data infrastructure.

5. **BI Tools Are Essential for Visibility** — Tableau and Power BI appear consistently across high-demand and high-salary categories, confirming their role as bridge tools between analysis and business decision-making.

**The bottom line:** An aspiring data analyst should prioritize SQL first, build Python and Excel proficiency, then layer in a BI tool (Tableau or Power BI) and cloud exposure (Snowflake, Azure) to maximize both employability and earning potential.

---

*Dataset sourced from [Luke Barousse's SQL Course](https://lukebarousse.com/sql). Analysis conducted using PostgreSQL and Visual Studio Code.*