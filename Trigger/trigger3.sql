CREATE DEFINER=`root`@`localhost` TRIGGER `report_card_AFTER_UPDATE` AFTER UPDATE ON `report_card` FOR EACH ROW BEGIN
if report_card.dig_signature = 1 then 
update student 
set new.student.passed_courses = old.student.passed_courses + ( select number_of_course from course where course.course_name = report_card.course_rname);
end if;
END