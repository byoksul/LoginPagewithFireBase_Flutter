import 'package:flutter/material.dart';
import 'package:loginscreen/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Giriş Yap",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent)),
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.purpleAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kullanıcı Adını Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              SizedBox(
                height: 13.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent)),
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.purpleAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Şifremi Unuttum"),
                    onPressed: () {},
                  )
                ],
              ),
              _loginbutton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginbutton() => RaisedButton(
      child: Text("Giriş Yap"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => connectPage()));

        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
        }
        if (username == "deneme" && password == "123") {
          debugPrint("Giriş Başarılı");
        } else {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("HATA"),
                  content: Text("Giriş bilgileriniz hatalı"),
                  actions: <Widget>[
                    MaterialButton(
                        child: Text("Geridön"),
                        onPressed: () => Navigator.pop(context))
                  ],
                );
              });
        }
      });
}
