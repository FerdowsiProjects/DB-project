CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `project`.`ex1` AS
    SELECT 
        `project`.`food`.`food_name` AS `food_name`
    FROM
        (`project`.`food`
        JOIN `project`.`student`)
    WHERE
        ((`project`.`student`.`student_name` = 'elaheh_rezapanah')
            AND (`project`.`student`.`financial_balance` >= `project`.`food`.`price`))