import mysql.connector
from db import db
class Card:
    def __init__(self, card_number, pin, account_id, database):
        self.card_number = card_number
        self.pin = pin
        self.account_id = account_id
        self.database = database


    def validatePin(self, entered_pin):
        return self.pin == entered_pin

  
    def getLinkedAccountID(self):
        return self.account_id

 
    def fetch_card_details(self):
        query = "SELECT * FROM card WHERE cardNumber = %s"
        result = self.database.get(query, (self.card_number,))
        if result:
            self.account_id = result[0]['accountID']
            self.pin = result[0]['pin']
        else:
            print("Card not found.")
            return None
        return result


    def update_pin(self, new_pin):
        query = "UPDATE card SET pin = %s WHERE cardNumber = %s"
        self.database.update(query, (new_pin, self.card_number))
        self.pin = new_pin
        
