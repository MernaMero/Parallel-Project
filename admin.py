from db import db

class Admin:
    def __init__(self, admin_id, name, database):
        self.admin_id = admin_id
        self.name = name
        self.database = database

   
    def create_account(self, holder_name, balance, bank_id):
        insert_query = "INSERT INTO account (holderName, balance, bankID) VALUES (%s, %s, %s);"
        self.database.insert(insert_query, (holder_name, balance, bank_id))

    def delete_account(self, account_id: int):
        delete_query = "DELETE FROM account WHERE accountID = %s;"
        self.database.remove(delete_query, (account_id,))

    def view_all_accounts(self):
        select_query = "SELECT * FROM account;"
        result = self.database.get(select_query)
        return result

    def view_all_transactions(self):
        select_query = "SELECT * FROM transaction;"
        result = self.database.get(select_query)
        return result



# d = db()  
# result = d.get("SELECT * FROM admin WHERE adminID = 1;")  

# if result:
#     admin = Admin(result[0]['adminID'], result[0]['name'], d)  
#     print(admin.view_all_accounts())  
    
#     print(admin.view_all_transactions())  
#     admin.delete_account(5)  
