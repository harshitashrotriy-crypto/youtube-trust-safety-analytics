/*
====================================================
Project: YouTube Trust & Safety Analytics
Author: Harshita Shrotriy
Tools: SQL, Tableau, Excel
Description:
This SQL script analyzes YouTube policy violation data
to identify trends, high-risk content, moderation
actions, and key business insights.
====================================================
*/


-- Total number of videos in the dataset

SELECT COUNT(*) AS Total_Videos
FROM youtube_content;



-- Count videos by violation type

SELECT
    Violation_Type,
    COUNT(*) AS Total_Violations
FROM youtube_content
GROUP BY Violation_Type
ORDER BY Total_Violations DESC;



-- High severity violations

SELECT
    Severity,
    COUNT(*) AS Total_Cases
FROM youtube_content
WHERE Severity = 'High'
GROUP BY Severity;


-- Country-wise violation analysis

SELECT
    Country,
    COUNT(*) AS Total_Violations
FROM youtube_content
GROUP BY Country
ORDER BY Total_Violations DESC;


-- Action taken by YouTube moderation team

SELECT
    Action_Taken,
    COUNT(*) AS Total_Videos
FROM youtube_content
GROUP BY Action_Taken
ORDER BY Total_Videos DESC;


-- Category-wise violation analysis

SELECT
    Category,
    COUNT(*) AS Total_Violations
FROM youtube_content
GROUP BY Category
ORDER BY Total_Violations DESC;


-- Monthly violation trend

SELECT
    DATE_FORMAT(Upload_Date, '%Y-%m') AS Month,
    COUNT(*) AS Total_Violations
FROM youtube_content
GROUP BY DATE_FORMAT(Upload_Date, '%Y-%m')
ORDER BY Month;


-- Top 5 channels with the highest policy violations

SELECT
    Channel_Name,
    COUNT(*) AS Total_Violations
FROM youtube_content
GROUP BY Channel_Name
ORDER BY Total_Violations DESC
LIMIT 5;


-- Average views by violation type

SELECT
    Violation_Type,
    ROUND(AVG(Views), 0) AS Average_Views
FROM youtube_content
GROUP BY Violation_Type
ORDER BY Average_Views DESC;


-- Severity-wise violation summary

SELECT
    Severity,
    COUNT(*) AS Total_Violations,
    ROUND(AVG(Views), 0) AS Average_Views
FROM youtube_content
GROUP BY Severity
ORDER BY
    CASE Severity
        WHEN 'High' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'Low' THEN 3
    END;



