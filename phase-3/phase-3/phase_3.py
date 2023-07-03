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

#/somayeh_ghorbani

#commit to database and close
mydb.commit()

mycursor.close()
mydb.close()
