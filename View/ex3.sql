CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `bookreservation` AS
    SELECT 
        `book`.`book_name` AS `book_name`
    FROM
        `book`
    WHERE
        (`book`.`treasury` = 'b2')