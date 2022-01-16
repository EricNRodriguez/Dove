import 'package:client/page/home_screen.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:flutter/material.dart';

import '../model/SessionState.dart';
import '../model/backend.dart';

class LoginScreen extends StatefulWidget {
    final Backend _backend;

    LoginScreen(this._backend);

    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    Future<void> _checkCredentialsAndMoveToMapScreen(BuildContext context) async {
        HttpResp<LoginResponseData> loginResp = await widget._backend.login(LoginRequestData(username: _username, password: _password));

        if (loginResp.isData()) {
            SessionState sessionState = SessionState(loginResp.asData().authToken, loginResp.asData().user);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                    return HomeScreen(sessionState);
                }),
                    (Route<dynamic> route) => false,
            );
        } else {
            setState(() {
              _errorMessage = 'Invalid login credentials';
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
                                'Log in',
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
                                        onChanged: (String? username) {
                                            _setUsername(username);
                                            if (_password.isNotEmpty) {
                                                _checkCredentialsAndMoveToMapScreen(context);
                                            }
                                        },
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
                                            onSubmitted: (String? _) async => await _checkCredentialsAndMoveToMapScreen(context),
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