SELECT * FROM "Patient" LIMIT 20;

--Q1. What is the total number of patients by gender?
SELECT
    gender,
    COUNT(*) AS total_patients
FROM "Patient"
GROUP BY gender
ORDER BY total_patients DESC;

--Q2. Which patients had a waiting time greater than the average waiting time?
SELECT
    patient_id,
    age,
    gender,
    waiting_time
FROM "Patient"
WHERE CAST(
    NULLIF(REGEXP_REPLACE(waiting_time::text, '[^0-9.]', '', 'g'), '')
    AS NUMERIC
) > (
    SELECT AVG(
        CAST(
            NULLIF(REGEXP_REPLACE(waiting_time::text, '[^0-9.]', '', 'g'), '')
            AS NUMERIC
        )
    )
    FROM "Patient"
);

--Q3. Which are the top 5 department referrals with 
--the highest average patient satisfaction scores?
SELECT
    department_referral,
    ROUND(AVG(satisfaction_score::NUMERIC), 2)
        AS average_satisfaction
FROM "Patient"
WHERE satisfaction_score IS NOT NULL
GROUP BY department_referral
ORDER BY average_satisfaction DESC
LIMIT 5;

--Q4. Compare the average waiting time between male and female patients.
SELECT
    gender,
    ROUND(
        AVG(
            NULLIF(
                REGEXP_REPLACE(waiting_time::text, '[^0-9.]', '', 'g'),
                ''
            )::NUMERIC
        ),
        2
    ) AS average_waiting_time_minutes
FROM "Patient"
GROUP BY gender;

--Q5. How many patients were admitted versus not admitted?
SELECT
    admission_flag,
    COUNT(*) AS total_patients,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_patients
FROM "Patient"
GROUP BY admission_flag
ORDER BY total_patients DESC;

--Q6. Which 5 department referrals have the highest patient admission rate?
SELECT
    department_referral,
    COUNT(*) AS total_patients,
    SUM(
        CASE
            WHEN admission_flag = 'Yes' THEN 1
            ELSE 0
        END
    ) AS admitted_patients,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN admission_flag = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS admission_rate_percentage
FROM "Patient"
WHERE department_referral IS NOT NULL
GROUP BY department_referral
ORDER BY admission_rate_percentage DESC
LIMIT 5;

--Q7. Segment patients into age groups and show the number of patients in each group.
WITH patient_segments AS (
    SELECT
        patient_id,
        age,
        CASE
            WHEN age < 18 THEN 'Children'
            WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
            WHEN age BETWEEN 36 AND 60 THEN 'Middle-Aged Adults'
            ELSE 'Senior Citizens'
        END AS age_group
    FROM "Patient"
)
SELECT
    age_group,
    COUNT(*) AS number_of_patients
FROM patient_segments
GROUP BY age_group
ORDER BY number_of_patients DESC;

--Q8. What are the top 3 department referrals with the most patients in each gender?
WITH department_counts AS (
    SELECT
        gender,
        department_referral,
        COUNT(*) AS total_patients,
        ROW_NUMBER() OVER (
            PARTITION BY gender
            ORDER BY COUNT(*) DESC
        ) AS department_rank
    FROM "Patient"
    WHERE department_referral IS NOT NULL
    GROUP BY gender, department_referral
)
SELECT
    gender,
    department_referral,
    total_patients,
    department_rank
FROM department_counts
WHERE department_rank <= 3
ORDER BY gender, department_rank;

--Q9. Are patients who wait longer more likely to be admitted?
SELECT
    CASE
        WHEN NULLIF(
            REGEXP_REPLACE(waiting_time::text, '[^0-9.]', '', 'g'),
            ''
        )::NUMERIC <= 30 THEN '0-30 minutes'
        WHEN NULLIF(
            REGEXP_REPLACE(waiting_time::text, '[^0-9.]', '', 'g'),
            ''
        )::NUMERIC <= 60 THEN '31-60 minutes'
        ELSE 'More than 60 minutes'
    END AS waiting_time_group,
    admission_flag,
    COUNT(*) AS total_patients
FROM "Patient"
WHERE waiting_time IS NOT NULL
GROUP BY waiting_time_group, admission_flag
ORDER BY waiting_time_group, admission_flag;

--Q10. Which age groups contribute the most to patient admissions?
WITH patient_age_groups AS (
    SELECT
        age,
        admission_flag,
        CASE
            WHEN age < 18 THEN 'Children'
            WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
            WHEN age BETWEEN 36 AND 60 THEN 'Middle-Aged Adults'
            ELSE 'Senior Citizens'
        END AS age_group
    FROM "Patient"
)
SELECT
    age_group,
    COUNT(*) AS total_patients,
    SUM(
        CASE
            WHEN admission_flag = 'Yes' THEN 1
            ELSE 0
        END
    ) AS admitted_patients
FROM patient_age_groups
GROUP BY age_group
ORDER BY admitted_patients DESC;
