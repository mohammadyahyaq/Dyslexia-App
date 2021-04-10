import 'package:dyslexia_app/services/auth.dart';
import 'package:dyslexia_app/shared/constants.dart';
import 'loading.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {






  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        elevation: 0.0,
        title: Text('تسجيل الدخول إلى التطبيق'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('تسجيل'),
              onPressed: (){
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'البريد الإلكتروني'),
                  validator: (val) => val.isEmpty ? 'رجاءاً ادخل البريد الإلكتروني' : null,
                  onChanged: (val){
                    setState(() => email = val);

                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'كلمة المـرور'),
                  // to make the password like this ******
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'رجاءاً ادخل كلمة المرور ويجب أن تكون أكثر من 6 خانات' : null,
                  onChanged: (val){
                    setState(() => password = val);

                  }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.amber[500],
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(color: Colors.black),
                  ),
                  // from onPressed the values goes to Firebase server to check if the user is exist
                  // check the email & password
                  onPressed: () async{
                    int before = DateTime.now().millisecondsSinceEpoch;
                    //print(before);
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState((){
                          error = 'لا يمكنك تسجيل الدخول بأستخدام هذه البيانات';
                          loading = false;
                        });
                      }
                    }

                    int after = DateTime.now().millisecondsSinceEpoch;
                    //print('###############');
                    //print(after);
                    print(after - before);

                  }

              ),

              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
