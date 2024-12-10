import mysql.connector
import threading
from datetime import datetime

class Account(threading.Thread):
    def __init__(self, account_id, holder_name, balance, linked_card, database):
        threading.Thread.__init__(self)
        self.account_id = account_id  
        self.holder_name = holder_name  
        self.balance = balance  
        self.lock = threading.Lock()  
        self.linked_card = linked_card
        self.database = database

    def authenticate_card(self, pin):
        return self.linked_card.validatePin(pin)

    def log_transaction(self, transaction_type, amount, account_id, atm_id):
        timestamp = datetime.now()
        query = "INSERT INTO transaction (type, amount, timestamp, accountID, atmID) VALUES (%s, %s, %s, %s, %s)"
        self.database.insert(query, (transaction_type, amount, timestamp, account_id, atm_id))

    def update_balance(self, amount, transaction_type):
        with self.lock:
            if transaction_type == 'deposit':
                self.balance += amount
            elif transaction_type == 'withdraw' and self.balance >= amount:
                self.balance -= amount
            else:
                raise ValueError("Insufficient balance for withdrawal.")
            
            update_query = "UPDATE account SET balance = %s WHERE accountID = %s"
            self.database.update(update_query, (self.balance, self.account_id,))

    def get_balance(self):
        return self.balance

    def get_transaction_history(self):
        query = "SELECT * FROM transaction WHERE accountID = %s"
        return self.database.get(query, (self.account_id,))

    def get_atm_info(self, atm_id):
        query = "SELECT * FROM atm WHERE atmID = %s"
        return self.database.get(query, (atm_id,))

