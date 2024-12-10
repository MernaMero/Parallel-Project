import mysql.connector
from db import db
from ATM import ATM
from account import Account
from card import Card
from transaction import Transaction
from admin import Admin
import threading
import time
from bank import Bank

d =db()
result = d.get(query="select * from bank where bankID = %s;",values=(1,))
bank = Bank(result[0]['bankID'],result[0]['name'],result[0]['location'],d)


result = d.get('select * from atm where bankID = %s;',(bank.bank_id,))
atm1 = ATM(result[0]['atmID'],result[0]['location'],bank,d)
atm1.start()


result = d.get('select * from atm where bankID = %s;',(bank.bank_id,))
atm2 = ATM(result[1]['atmID'],result[1]['location'],bank,d)
atm2.start()



result = d.get('select * from account where bankID = %s;',(bank.bank_id,))
r2 = d.get('select * from card where accountID = %s;',(result[0]['accountID'],))
card = Card(r2[0]['cardNumber'],r2[0]['pin'],r2[0]['accountID'],d)
account = Account(result[0]['accountID'],result[0]['holderName'],result[0]['balance'],card,d)
atm1.set_current_card(card)
atm1.authenticate_card(card.pin)
# atm1.deposit(1000000)
print(atm1.get_transaction_history())
print(account.get_transaction_history())

atm2.set_current_card(card)
print(account.account_id)
atm2.authenticate_card(card.pin)
atm2.withdraw(1000000)
print(atm2.get_transaction_history())
print(account.get_transaction_history())

# from login import Login
# from register import Register
# d = db()
# Register.register("marwans","marwan2","marwan2",d)
# result = Login.login('marwan2','marwan2',d)
# print(result.admin_id)