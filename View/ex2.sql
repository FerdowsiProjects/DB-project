CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `project`.`ex2` AS
    SELECT 
        `project`.`report_card`.`course_rname` AS `course_rname`,
        `project`.`report_card`.`rgrade` AS `rgrade`
    FROM
        (`project`.`report_card`
        JOIN `project`.`student`)
    WHERE
        ((`project`.`student`.`student_number` = `project`.`report_card`.`student_student_number`)
            AND (`project`.`report_card`.`rgrade` >= 10))