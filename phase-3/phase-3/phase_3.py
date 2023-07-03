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
view-query = "CREATE VIEW view3_p AS SELECT DISTINCT student.student_number , student.student_name FROM student WHERE student.GPA >= 17 GROUP BY student.entering_year"
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

#------------------------------------------------
#trigger 1

trigger_query = """
CREATE TRIGGER trigger1_p AFTER UPDATE ON course FOR EACH ROW BEGIN
update course_state
set GPA = (course.averege + ((SELECT GPA FROM student.course WHERE course.student_student_number =  student.student_number) * unit_number ))/( student.unit_number + 1) AND course.unit_number = course.unit_number + 1
WHERE  course_state = 'passt';
END
"""
mycursor.execute(triggerr_query)

#------------------------------------------------

#trigger ex 2

trigger_query = """
CREATE TRIGGER ex2_p AFTER_UPDATE  ON student_work FOR EACH ROW BEGIN

if old.work_time <> new.work_time
then update student_work 
set student_work.salary = student_work.work_time * 5;
end if;
END
"""

mycursor.execute(triggerr_query)

#------------------------------------------------

# report card

s_num = input("enter student number : ")

select_query = f"SELECT course.course_name,report_card.rgrade FROM course,student, report_card WHERE course.student_student_number = {s_num }"

mycursor.execute(select_query)

result = mycursor.fetchall()
for row in result:
    print(row)

#------------------------------------------------

# edit

table_name1 = "student"
s_num = input("enter student number : ")

while True:
    edit = input("Which item do you want to edit? student_name, phone_number, address, Email, exit: ")

    if edit == "exit":
        break
    elif edit == "student_name":
        value = input("Enter student_name: ")
        select_query = f"UPDATE {table_name1} SET student_name = '{value}' WHERE student.student_number = {s_num}"
        print("successful")
    elif edit == "phone_number":
        value = input("Enter phone_number: ")
        select_query = f"UPDATE {table_name1} SET phone_number = '{value}' WHERE student.student_number = {s_num}"
        print("successful")
    elif edit == "address":
        value = input("Enter address: ")
        select_query = f"UPDATE {table_name1} SET address = '{value}' WHERE student.student_number = {s_num}"
        print("successful")
    elif edit == "Email":
        value = input("Enter Email: ")
        select_query = f"UPDATE {table_name1} SET Email = '{value}'WHERE student.student_number = {s_num}"
        print("successful")
    else:
        print("Input warning !!!")
        continue

    mycursor.execute(select_query)

    result = mycursor.fetchall()
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

#examination_schedule

s_num = input("Enter your student number: ")

select_query = f"SELECT examination_schedule.course_ename,examination_schedule.professor_ename,examination_schedule.exam_day,examination_schedule.exam_time,examination_schedule.exam_date,examination_schedule.class,examination_schedule.seat_number FROM examination_schedule where examination_schedule.student_student_number = '{s_num}'"
mycursor.execute(select_query)

result = mycursor.fetchall()

for row in result:
  print(row)


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

######################################
# view ex3_p
view_query = "CREATE VIEW ex3_p AS SELECT book.book_name FROM book WHERE book.treasury = b2"
mycursor.execute(view_query)

select_query = "SELECT * FROM viewex3_p"
mycursor.execute(select_query)

result - mycursor.fetchall()

for row in result:
    print(row)

#########################################
# view ex4_p
view_query = "CREATE VIEW ex4_p AS SELECT class.class_number class_number FROM class WHERE class.class_time <> 8"
mycursor.execute(view_query)

select_query = "SELECT * FROM viewex4_p"
mycursor.execute(select_query)

result - mycursor.fetchall()

for row in result:
    print(row)
########################################
# view view2_p
view_query = "CREATE VIEW view2_p AS SELECT course.course_name course_name FROM course,student WHERE((student.student_number = 99127620) AND (course.course_status = passed) AND (course.select_unit_course_sgroup = student.select_unit_course_sgroup))"
mycursor.execute(view_query)

select_query = "SELECT * FROM view2_p"
mycursor.execute(select_query)

result - mycursor.fetchall()

for row in result:
    print(row)
#############################
#trigger4_p
trigger_query = """
CREATE TRIGGER trigger4_p AFTER INSERT ON select_unit FOR EACH ROW BEGIN
update student
set new.student.passed_courses = student.passed_courses + (select number_of_course from course,select_unit where course.course_name = select_unit.course_name);
END
"""
mycursor.execute(triggerr_query)

#commit to database and close
mydb.commit()

mycursor.close()
mydb.close()
