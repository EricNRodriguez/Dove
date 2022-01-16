import 'package:client/page/home_screen.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:flutter/material.dart';

import '../model/SessionState.dart';
import '../model/backend.dart';

class RegisterScreen extends StatefulWidget {
  final Backend _backend;

  RegisterScreen(this._backend);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = '';
  String _password = '';
  String _errorMessage = '';

  void _setUsername(String? username) {
    setState(() {
      _errorMessage = '';
      _username = username ?? '';
    });
  }

  void _setPassword(String? password) {
    setState(() {
      _errorMessage = '';
      _password = password ?? '';
    });
  }

  Future<void> _registerAndMoveToLoginScreen(BuildContext context) async {
    HttpResp<RegisterResponseData> registerResponse = await widget._backend.register(RegisterRequestData(
      username: _username,
      password: _password,
    ));

    if (registerResponse.isData()) {
      SessionState sessionState = SessionState(registerResponse.asData().authToken, registerResponse.asData().user);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return HomeScreen(sessionState);
        }),
            (Route<dynamic> route) => false,
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 50, top: 50, right: 50),
        child: Column(
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.only(top:150),
              child: Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Lucida'
                ),
                textDirection: TextDirection.ltr,
              ),
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    textDirection: TextDirection.ltr,
                    onChanged: _setUsername,
                  ),
                  Container(
                    padding: EdgeInsets.only(top:25),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      textDirection: TextDirection.ltr,
                      onChanged: _setPassword,
                      onSubmitted: (String? _) async => await _registerAndMoveToLoginScreen(context),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}