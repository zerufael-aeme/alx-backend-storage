-- Creates a stored procedure AddBonus that adds a new
-- correction for a student.
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$

CREATE PROCEDURE AddBonus (IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    -- Declare a variable to store the project ID
    DECLARE project_id INT;
    DECLARE project_count INT;

    -- Check if the project exists by counting rows with the given name
    SELECT COUNT(*) INTO project_count
    FROM projects
    WHERE name = project_name;

    -- If the project does not exist, insert the new project
    IF project_count = 0 THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    -- Get the project ID from the 'projects' table
    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name;

    -- Insert a new record into the 'corrections' table
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);

END$$

DELIMITER ;
