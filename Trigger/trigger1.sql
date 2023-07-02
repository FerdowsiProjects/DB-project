CREATE DEFINER=`root`@`localhost` TRIGGER `course_AFTER_UPDATE` AFTER UPDATE ON `course` FOR EACH ROW BEGIN

update course_state
set GPA = (course.averege + ((select GPA from student.course where course.student_student_number =  student.student_number) * unit_number ))/( student.unit_number + 1) and course.unit_number = course.unit_number + 1
where  course_state = 'passt';

END