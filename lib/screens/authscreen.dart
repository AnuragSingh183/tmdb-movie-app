import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                    Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1])),
          width: 300,
          height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "username"),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Form(
                      child: TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    textInputAction: TextInputAction.next,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Login"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("New User ? Sign Up"),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
