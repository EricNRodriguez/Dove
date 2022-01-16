import 'package:client/model/backend.dart';
import 'package:client/page/login_screen.dart';
import 'package:client/page/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void _openLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Consumer<Backend>(
            builder: (context, backend, child) => LoginScreen(backend)
        );
      }),
    );
  }

  void _openSignUpScreen(BuildContext context) {
    Route route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Consumer<Backend>(
            builder: (context, backend, child) => RegisterScreen(backend)
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
    Navigator.of(context, rootNavigator: true).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.only(top:150),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Lucida'
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'Sign in',
                        textDirection: TextDirection.ltr,
                      ),
                      onPressed: () => _openLoginScreen(context),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Text(
                            'Dont have an account?',
                            textDirection: TextDirection.ltr,
                        ),
                        TextButton(
                            onPressed: () => _openSignUpScreen(context),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(2, 10, 10, 10),
                              minimumSize: Size.zero,
                            ),
                            child: Text(
                                'Create',
                                textDirection: TextDirection.ltr,
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}