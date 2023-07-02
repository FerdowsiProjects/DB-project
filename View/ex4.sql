CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `classtime` AS
    SELECT 
        `class`.`class_number` AS `class_number`
    FROM
        `class`
    WHERE
        (`class`.`class_time` <> 8)