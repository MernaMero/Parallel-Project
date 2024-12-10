import mysql.connector

class Bank:
    def __init__(self, bank_id, name, location, database):
        self.bank_id = bank_id
        self.name = name
        self.location = location
        self.atms = []  
        self.accounts = []  
        self.transactions = []  
        self.database = database

    def add_atm(self, atm):
        self.atms.append(atm)
        query = "INSERT INTO atm (atmID, location, bankID) VALUES (%s, %s, %s)"
        self.database.insert(query, (atm.atm_id, atm.location, self.bank_id))


    def remove_atm(self, atm_id):
        self.atms = [atm for atm in self.atms if atm.atm_id != atm_id]
        query = "DELETE FROM atm WHERE atmID = %s"
        self.database.remove(query, (atm_id,))


    def add_account(self, account):
        self.accounts.append(account)
        query = "INSERT INTO account (accountID, holderName, balance, bankID) VALUES (%s, %s, %s, %s)"
        self.database.insert(query, (account.account_id, account.holder_name, account.balance, self.bank_id))

    def remove_account(self, account_id):
        self.accounts = [account for account in self.accounts if account.account_id != account_id]
        query = "DELETE FROM account WHERE accountID = %s"
        self.database.remove(query, (account_id,))

    def log_transaction(self, transaction):
        self.transactions.append(transaction)
        query = """
        INSERT INTO transaction (transactionID, type, amount, timestamp, accountID, atmID, location)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (transaction.transaction_id, transaction.transaction_type, transaction.amount, transaction.timestamp, transaction.account_id, transaction.atm_id, transaction.location)
        self.database.insert(query, values)


    def view_all_accounts(self):
        query = "SELECT * FROM account WHERE bankID = %s"
        return self.database.get(query, (self.bank_id,))

    # Retrieve all transactions for the bank
    def view_all_transactions(self):
        query = "SELECT * FROM transaction WHERE bankID = %s"
        return self.database.get(query, (self.bank_id,))
