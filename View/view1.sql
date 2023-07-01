CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view1` AS
    SELECT 
        `course`.`course_code` AS `course_code`,
        `course`.`course_name` AS `course_name`,
        `class`.`class_number` AS `class_number`,
        `course`.`professor_coname` AS `professor_coname`,
        `course`.`faculty` AS `faculty`
    FROM
        (`course`
        JOIN `class`)
    WHERE
        (`course`.`course_code` = `class`.`class_id`)