from admin import Admin
class Register():
  @staticmethod
  def register(name,username,password,database):
    database.insert("insert into admin (name,username,passsword) values (%s,%s,%s);",(name,username,password,))
    result = database.get('select * from admin where username = %s;',(username,))
    if result:
      return Admin(result[0]['adminID'],result[0]['name'],database)
    else:
      return None
    