CREATE DEFINER=`root`@`localhost` TRIGGER `drop_course_BEFORE_INSERT` BEFORE INSERT ON `drop_course` FOR EACH ROW BEGIN
update examination_schedule
set  course_eid = NULL ,course_ename = NULL ,professor_ename = NULL ,exam_day = NULL ,exam_time = NULL ,exam_date = NULL ,class = NULL ,seat_number = NULL ,student_student_number = NULL ,student_examination_schedule_course_eid = NULL ,student_class_schedule_course_cid = NULL
where drop_course.course_did = examination_schedule.course_eid;
END