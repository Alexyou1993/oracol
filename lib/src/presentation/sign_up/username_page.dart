import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/containers/auth/index.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/presentation/routes.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    RegistrationInfoContainer(
                      builder: (BuildContext context, RegistrationInfo info) {
                        return TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'username',
                          ),
                          initialValue: info.email.split('@').first,
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            StoreProvider.of<AppState>(context).dispatch(UpdateRegistrationInfo(username: value));
                          },
                          validator: (String value) {
                            if (value.length < 3) {
                              return 'Please choose a bigger username';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          Navigator.pushNamed(context, AppRoutes.password);
                        }
                      },
                      child: const Text('Continue'),
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
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(AppRoutes.home),
                                );
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
      ),
    );
  }
}
