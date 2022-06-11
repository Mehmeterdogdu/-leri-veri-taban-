import mysql.connector as mc

connection = mc.connect(
    host="localhost",
    user="root",
    password="",
    database='veri_proje'
)

cursor = connection.cursor()