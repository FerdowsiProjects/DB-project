CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view2` AS
    SELECT 
        `course`.`course_name` AS `course_name`
    FROM
        (`course`
        JOIN `student`)
    WHERE
        ((`student`.`student_number` = '99127620')
            AND (`course`.`course_status` = 'passed')
            AND (`course`.`select_unit_course_sgroup` = `student`.`select_unit_course_sgroup`))