CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view5` AS
    SELECT 
        `student`.`student_number` AS `student_number`,
        `student`.`student_name` AS `student_name`
    FROM
        (`student`
        JOIN `select_unit`)
    WHERE
        ((`select_unit`.`passed_course` < 12)
            AND (`student`.`student_number` = `select_unit`.`student_student_number`))