from admin import Admin
class Login():
  @staticmethod
  def login(username,password,database):
    result = database.get('select * from admin where username = %s;',(username,))
    if(result[0]['passsword'] == password):
      return Admin(result[0]['adminID'],result[0]['name'],database)
    else:
      return None
    