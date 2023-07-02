CREATE DEFINER=`root`@`localhost` TRIGGER `ex1` AFTER UPDATE ON `food_reservation` FOR EACH ROW BEGIN
if new.eaten = 1 then
update food_reservation
set forgot = 0;
End if ;
END