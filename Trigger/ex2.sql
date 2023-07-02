CREATE DEFINER=`root`@`localhost` TRIGGER `student_work_AFTER_UPDATE` AFTER UPDATE ON `student_work` FOR EACH ROW BEGIN

if old.work_time <> new.work_time
then update student_work 
set student_work.salary = student_work.work_time * 5;
end if;

END