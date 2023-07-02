CREATE DEFINER=`root`@`localhost` TRIGGER `trigger4` AFTER INSERT ON `select_unit` FOR EACH ROW BEGIN
update student
set new.student.passed_courses = student.passed_courses + (select number_of_course from course,select_unit where course.course_name = select_unit.course_name);
END