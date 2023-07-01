create view ClassTime as
select class_number
from class
where class_time <> 8;