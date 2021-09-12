import 'package:login_/models/user.dart';
import '../database_helper.dart';

class LoginCtr {
  DatabaseHelper con = new DatabaseHelper();

  Future<int> saveUser(User user) async {
    var dbCllient = await con.db;
    int res = await dbCllient.insert("User", user.toMap());
    return res;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<User> getLogin(String user, String password) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (res.length > 0) {
      return new User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient.query("user");

    List<User> list =
        res.isEmpty ? res.map((e) => User.fromMap(e)).toList() : null;
    return list;
  }
}
