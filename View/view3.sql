CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `project`.`view3` AS
    SELECT 
        `project`.`student`.`student_number` AS `student_number`,
        `project`.`student`.`student_name` AS `student_name`
    FROM
        `project`.`student`
    WHERE
        (`project`.`student`.`GPA` >= 17)
    GROUP BY `project`.`student`.`entering_year`