WITH NormalizedStudents AS (
    SELECT 
        StudentID, 
        Name, 
        Major,
        CASE 
            WHEN University = 'WLU' THEN 'Wilfrid Laurier University'
            WHEN University = 'YorkU' THEN 'York University'
            WHEN University = 'York university' THEN 'York University'
            WHEN University = 'UofWaterloo' THEN 'University of Waterloo'
            WHEN University = 'Standford University' THEN 'Stanford University'
            WHEN University = 'NUS' THEN 'National University of Singapore'
            ELSE University
        END AS UniversityName
    FROM Students
)
SELECT COUNT(*) AS ComputerScienceStudentCount
FROM NormalizedStudents S
JOIN Universities U ON S.UniversityName = U.UniversityName
WHERE S.Major = 'Computer Science' AND U.Country = 'Canada';