CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `project`.`view4` AS
    SELECT DISTINCT
        `project`.`food`.`food_name` AS `food_name`,
        `project`.`food_reservation`.`reserved` AS `reserved`
    FROM
        (`project`.`food`
        JOIN `project`.`food_reservation`)
    WHERE
        (`project`.`food`.`food_id` = `project`.`food_reservation`.`reserve_fid`)