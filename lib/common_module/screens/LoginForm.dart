import 'package:flutter/material.dart';
import 'RealEstateList.dart';
import 'HomeScreen.dart';


class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 70, left: 70),
                    child: TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'أدخل اسم المستخدم',
                        labelText: 'اسم المستخدم',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'اسم المستخدم لا يمكن تركه فارغاً';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 70, left: 70),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lock),
                        hintText: 'أدخل كلمة المرور',
                        labelText: 'كلمة المرور',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'كلمة المرور لا يمكن تركه فارغاً';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20, right: 70, left: 70),
                      child: RaisedButton(
                        child: const Text('دخول'),
                        onPressed: () {
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text(_username.text)));
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RealEstateList()),
                            );
                          }
                        },
                      )),
                  Container(
                    child: FlatButton(
                      child: Text('ليس الأن'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}