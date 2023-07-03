//phase3

//connect to database
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="manyadammire",
  database="project"
)

mycursor = mydb.cursor()
print(mydb)

//fatemeh_aalami

//zahra_rostami

//elaheh_rezapanah

//somayeh_ghorbani

//commit to database and close
mydb.commit()

mycursor.close()
mydb.close()
