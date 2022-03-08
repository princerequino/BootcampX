-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students JOIN cohorts ON cohort_id = cohorts.id;

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- SELECT students.name, cohorts.name, cohorts.start_date as cohort_start_date, students.start_date as students_start_date
-- FROM students
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.start_date != students.start_date
-- ORDER BY cohort_start_date;

-- SELECT students.name as student, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.end_date IS NULL 
-- GROUP BY students.name
-- HAVING count(assignment_submissions.*) < 100;

-- SELECT (
--   SELECT count(assignments)
--   FROM assignments
-- )-count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';
-- SELECT count(students)
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;


-- SELECT avg(count(students))
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;

-- SELECT count(students) as total_students
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;

-- SELECT avg(total_students) as average_students
-- FROM (
--   SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts
-- ) as totals_table;

-- SELECT assignment_id
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

SELECT assignments.name
FROM assignments
WHERE id NOT IN (
    SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
)