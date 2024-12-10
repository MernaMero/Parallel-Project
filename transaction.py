import mysql.connector
from datetime import datetime
from db import db
class Transaction:
    def __init__(self, transaction_id, transaction_type, amount, account_id, atm_id, database, location=None):
        self.transaction_id = transaction_id
        self.transaction_type = transaction_type  
        self.amount = amount
        self.timestamp = datetime.now()
        self.account_id = account_id
        self.atm_id = atm_id
        self.database = database
        self.location = location
    def log_transaction(self):
        query = """
        INSERT INTO transaction (transactionID, type, amount, timestamp, accountID, atmID, location) 
        VALUES (%s, %s, %s, %s, %s, %s, %s);
        """
        values = (self.transaction_id, self.transaction_type, self.amount, self.timestamp, self.account_id, self.atm_id, self.location)
        self.database.insert(query, values)


    @staticmethod
    def get_transaction_history(account_id, database):
        query = "SELECT * FROM transaction WHERE accountID = %s"
        return database.get(query, (account_id,))

    @staticmethod
    def get_atm_transaction_history(atm_id, database):
        query = "SELECT * FROM transaction WHERE atmID = %s"
        return database.get(query, (atm_id,))

    def update_transaction(self, transaction_id, new_amount):
        query = "UPDATE transaction SET amount = %s WHERE transactionID = %s"
        self.database.update(query, (new_amount, transaction_id))
       
