import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/actions/index.dart';
import 'package:oracol/src/init/dialog_mixin.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/presentation/routes.dart';

class PasswordPage extends StatelessWidget with DialogMixin{
  const PasswordPage({Key key}) : super(key: key);

  void _response(BuildContext context, AppAction action) {
    if (action is SignUpSuccessful) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
    } else if(action is SignUpError){
       showErrorDialog(context, 'SignUp Error', action.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (String value) {
                      StoreProvider.of<AppState>(context).dispatch(UpdateRegistrationInfo(password: value));
                    },
                    validator: (String value) {
                      if (value.length < 6) {
                        return 'Please choose a better password';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  FlatButton(
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        StoreProvider.of<AppState>(context).dispatch(
                          SignUp((AppAction action) {
                            _response(context, action);
                          }),
                        );
                      }
                    },
                    child: const Text('SignUp'),
                  ),
                  const Divider(),
                  Text.rich(
                    TextSpan(
                      text: 'Already have on account?',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.popUntil(context, ModalRoute.withName(AppRoutes.home));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
