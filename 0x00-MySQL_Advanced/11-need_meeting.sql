-- creates a function SafeDiv that divides (and returns) the first
-- by the second number or returns 0 if the second number is equal to 0.
CREATE VIEW  need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR DATEDIFF(CURDATE(), last_meeting) > 30);
