#phase3

#connect to database
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="manyadammire",
  database="project"
)

mycursor = mydb.cursor()
print(mydb)

#/fatemeh_aalami

# view 3
view-query = "CREATE VIEW view3_p AS SELECT DISTINCT student.student_number , student.student_name FROM student WHERE student.GPA <= 17 GROUP BY student.entering_year"
mycursor.execute(view_query)

select_query = "SELECT * FROM view3_p"
mycursor.execute(select_query)

result - mycursor.fetchall()

for row in result:
    print(row)

#------------------------------------------------

# view 6
view-query = "CREATE VIEW view6_p AS SELECT DISTINCT course.course_name, avg(course.average) FROM course GROUP BY cuorse.course_name ORDER BY AVG (course.average) DESC"
mycursor.execute(view_query)

select_query = "SELECT * FROM view6_p"
mycursor.execute(select_query)

result - mycursor.fetchall()

for row in result:
    print(row)

#/zahra_rostami

#view1

view_query = "create view view1_p as select course.course_code,course.course_name,class.class_number,course.professor_coname,course.faculty from course,class where course.course_code = class.class_id"
mycursor.execute(view_query)

select_query = "select * from view1_p"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
  print(row)

#view5

view_query = "CREATE VIEW view5_p AS SELECT student.student_number,student.student_name FROM student,select_unit WHERE select_unit.passed_course < 12 AND student.student_number = select_unit.student_student_number"
mycursor.execute(view_query)

select_query = "SELECT * FROM view5_p"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
 print(row)

#trigger2

trigger_query = """
CREATE TRIGGER trigger2_p AFTER INSERT ON food_reservation FOR EACH ROW 
BEGIN
update student
set financial_balance = financial_balance - ( select price from food,food_reservation
     where (food.food_reservation_reserve_fid = food_reservation.reserve_fid) and new.food_reservation.reserved = '1' )
     where student_number = new.food_reservation.student_student_number;
END
"""
mycursor.execute(trigger_query)


#trigger ex1

trigger_query = """
CREATE TRIGGER ex1 AFTER UPDATE ON food_reservation FOR EACH ROW 
BEGIN
if new.eaten = 1 then
update food_reservation
set forgot = 0;
End if ;
END
"""
mycursor.execute(trigger_query)

#/elaheh_rezapanah

# view4
view_query = "CREATE VIEW view4_p AS SELECT DISTINCT food.food_name,food_reservation.reserved from food,food_reservation where food.food_id = food_reservation.reserve_fid"
mycursor.execute(view_query)

select_query = "SELECT * FROM view4_p"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
  print(row)

# view ex1
view_query = "CREATE VIEW ex1_p AS SELECT food.food_name FROM food,student WHERE student.student_name = 'elaheh_rezapanah' AND student.financial_balance >= food.price"
mycursor.execute(view_query)

select_query = "SELECT * FROM ex1_p"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
  print(row)

# view ex2
view_query = "CREATE VIEW ex2_p AS SELECT course_rname,rgrade FROM report_card,student WHERE student.student_number = report_card.student_student_number AND report_card.rgrade >= 10"
mycursor.execute(view_query)

select_query = "SELECT * FROM ex2_p"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
  print(row)

# trigger3
trigger_query = """
CREATE TRIGGER trigger3_p
AFTER UPDATE ON report_card FOR EACH ROW
BEGIN
if report_card.dig_signature = 1 then
update student
set new.student.passed_courses = old.student.passed_courses + ( select number_of_course from course where course.course_name = report_card.course_rname);
end if;
END
"""
mycursor.execute(trigger_query)

# trigger5-1
trigger_query = """
CREATE TRIGGER trigger5_p
BEFORE INSERT ON drop_course FOR EACH ROW BEGIN
update examination_schedule
set  course_eid = NULL ,course_ename = NULL ,professor_ename = NULL ,exam_day = NULL ,exam_time = NULL ,exam_date = NULL ,class = NULL ,seat_number = NULL ,student_student_number = NULL ,student_examination_schedule_course_eid = NULL ,student_class_schedule_course_cid = NULL
where drop_course.course_did = examination_schedule.course_eid;
END
"""
mycursor.execute(trigger_query)

# trigger5-2
trigger_query = """
CREATE TRIGGER trigger52_p
AFTER INSERT ON select_unit FOR EACH ROW BEGIN
insert examination_schedule
 set   examination_schedule.course_ename = select_unit.course_name;
END
"""
mycursor.execute(trigger_query)

#/somayeh_ghorbani

#commit to database and close
mydb.commit()

mycursor.close()
mydb.close()
