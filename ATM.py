import mysql.connector
import threading
from datetime import datetime
from account import Account
class ATM(threading.Thread):
    def __init__(self, atm_id, location, bank, database):
        threading.Thread.__init__(self)
        self.atm_id = atm_id
        self.location = location
        self.bank = bank
        self.database = database
        self.lock = threading.Lock()
        self.current_card = None

    def authenticate_card(self, pin):
        if self.current_card:
            return self.current_card.validatePin(pin)
        return False

    def deposit(self, amount):
        if self.current_card:
            account_id = self.current_card.getLinkedAccountID()
            with self.lock:
                result = self.database.get('select * from account where accountID = %s;',(account_id,))
                
                account = Account(account_id, result[0]['holderName'],result[0]['balance'], self.current_card, self.database)
                account.update_balance(amount, 'deposit')
                self.log_transaction('deposit', amount, account_id, self.atm_id)
         
            return True
        return False


    def withdraw(self, amount):
        if self.current_card:
            account_id = self.current_card.getLinkedAccountID()

            with self.lock:
                result = self.database.get('select * from account where accountID = %s;',(account_id,))
                
                account = Account(account_id, result[0]['holderName'],result[0]['balance'], self.current_card, self.database)
                account.update_balance(amount, 'withdraw')
                
                self.log_transaction('withdraw', amount, account_id, self.atm_id)
                return True
            return False
        return False


    def check_balance(self):
        if self.current_card:
            account_id = self.current_card.getLinkedAccountID()
            account = Account(account_id, None, None, self.current_card, self.database)
            return account.get_balance()
        return None


    def set_current_card(self, card):
        self.current_card = card


    def log_transaction(self, transaction_type, amount, account_id, atm_id):
        timestamp = datetime.now()
        query = "INSERT INTO transaction (type, amount, timestamp, accountID, atmID) VALUES (%s, %s, %s, %s, %s)"
        self.database.insert(query, (transaction_type, amount, timestamp, account_id, atm_id))

    def get_transaction_history(self):
        query = "SELECT * FROM transaction WHERE atmID = %s"
        return self.database.get(query, (self.atm_id,))

    def run(self):
        pass