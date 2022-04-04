import mysql.connector
from datetime import date

HOST = "us-cdbr-east-05.cleardb.net"
PORT = "3306"
USER = "b5435f31808b2a"
PASSWORD = "e8968ff1"
DATABASE = "heroku_a073b44a07ad5e4"

def add_test(testData, testResult):
    try:
        #connecting to the databse
        mydb = mysql.connector.connect(
            host=HOST,
            port=PORT,
            user=USER,
            password=PASSWORD,
            database=DATABASE
        )
        #getting the cursor
        cursor = mydb.cursor()

        print("connection started")

        #defining the query
        query = "INSERT INTO tests (id, testDate, age, sysBP, prevelantHyp, diaBP, glucose, gender, diabetes, totChol, bpMeds, bmi, testResult ) VALUES (%s, %s, %s, %s,%s, %s, %s, %s,%s, %s, %s, %s,%s)"

        #data to be stored inside the databse
        tuple = (int(testData["userId"]), str(testData["date"]), str(testData["age"]), str(testData["sysBP"]), str(testData["prevelantHyp"]), str(testData["diaBP"]), str(testData["glucose"]),
                 str(testData["gender"]), str(testData["diabetes"]), str(testData["totChol"]), str(testData["bpMeds"]), str(testData["bmi"]), testResult)

        #excecuting the query
        cursor.execute(query, tuple)
        #comming changes to databse
        mydb.commit()

        #result of the datsbase function
        result = {"result": "success"}

        return result

    #if the test id alredy exists
    except mysql.connector.errors.IntegrityError as i:
        result = {"result": "unsuccessful"}
        return result

    #heandeling errors
    except mysql.connector.Error as error:

        print(f"ERROR- {error}")

        return 0

    finally:

        #closing the databse connection
        if mydb.is_connected():
            cursor.close()
            mydb.close()
            print("MySQL connection is closed")