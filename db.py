import mysql.connector

class db:
    def __init__(self):
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",   
            password="",  
            database="atmsimulator"
        )
        self.cursor = self.connection.cursor(dictionary=True)
    def insert(self, query, values):
        try:
            self.cursor.execute(query, values)
            self.connection.commit()  
        except mysql.connector.Error as err:
            self.connection.rollback()  
    def update(self, query, values):
        try:
            self.cursor.execute(query, values)
            self.connection.commit()  
        except mysql.connector.Error as err:
            self.connection.rollback()  
    def remove(self, query, values):
        try:
            self.cursor.execute(query, values)
            self.connection.commit()  
        except mysql.connector.Error as err:
            self.connection.rollback()  
    def get(self, query, values=None):
        try:
            if values:
                self.cursor.execute(query, values)
            else:
                self.cursor.execute(query)
            result = self.cursor.fetchall() 
            return result  
        except mysql.connector.Error as err:
            return None
