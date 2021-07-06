import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/actions/index.dart';
import 'package:oracol/src/init/dialog_mixin.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/presentation/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with DialogMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _response(AppAction action) {
    if (action is LoginError) {
      showErrorDialog(context, 'LoginError', action.error);
    } else if (action is SignUpWithGoogleError) {
      showErrorDialog(context, 'SignUpWithGoogleError', action.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        hintText: 'email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      validator: (String value) {
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      obscureText: true,
                      controller: _password,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      validator: (String value) {
                        if (value.length < 6) {
                          return 'Please try a better password';
                        }
                        return null;
                      },
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Sign in with Google'),
                          onPressed: () {
                            StoreProvider.of<AppState>(context).dispatch(SignUpWithGoogle(_response));
                          },
                        ),
                        FlatButton(
                       child: const Text('Reset Password'),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.resetPassword);
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          StoreProvider.of<AppState>(context).dispatch(
                            Login(
                              email: _email.text,
                              password: _password.text,
                              response: _response,
                            ),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text.rich(
                        TextSpan(
                          text: 'You don\t have on account? ',
                          style: const TextStyle(fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, AppRoutes.signUp);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
