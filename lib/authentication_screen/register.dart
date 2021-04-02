import 'package:dyslexia_app/services/auth.dart';
import 'package:dyslexia_app/shared/constants.dart';
import 'loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  // Text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        elevation: 0.0,
        title: Text('التسجيل في التطبيق'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('تسجيل الدخول'),
              onPressed: (){
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          // _formKey help us track the state of our form and help to validate it
          // and make the key global
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
                    'تسجيل',
                    style: TextStyle(color: Colors.black),
                  ),
                  // from onPressed the values goes to Firebase server to check if the user is exist
                  // check the email & password
                  onPressed: () async{
                    int before = DateTime.now().millisecondsSinceEpoch;
                    print(before);
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = 'رجاءاً أدخل بريد إلكتروني صالح';
                          loading = false;
                        });
                      }
                      int after = DateTime.now().millisecondsSinceEpoch;
                      print('###############');
                      print(after);
                      print(after - before);


                    }
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
