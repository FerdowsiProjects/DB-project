create view LessonsTime as
select course_name, professor_coname
from course
where course_time = 8;