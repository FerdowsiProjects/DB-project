CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `project`.`view6` AS
    SELECT 
        `project`.`course`.`course_name` AS `course_name`,
        AVG(`project`.`course`.`average`) AS `avg(average)`
    FROM
        `project`.`course`
    GROUP BY `project`.`course`.`course_name`
    ORDER BY AVG(`project`.`course`.`average`) DESC