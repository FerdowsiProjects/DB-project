CREATE DEFINER=`root`@`localhost` TRIGGER `select_unit_AFTER_INSERT` AFTER INSERT ON `select_unit` FOR EACH ROW BEGIN
insert examination_schedule 
 set   examination_schedule.course_ename = select_unit.course_name;
END