import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

// Login screen will be implemented here.

// It should be the first Page, and it will do the login silently if
// set to do so (remember password setting...)

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
    viewModelBuilder: () => LoginViewModel(),
    builder: (context, model, child) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.lock, color: Theme.of(context).primaryColor, size: 200),
              Text(
                'Verisure 2 tms.',
                style: Theme.of(context).textTheme.headline4,
              ),
              Card(
                margin: EdgeInsets.all(16),
                // TODO: Change to size instead of margin for larger screens?
                color: Theme.of(context).cardColor,
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: <Widget>[
                      TextField(
                        controller: model.getUserNameController(),
                        decoration: InputDecoration(
                          hintText: 'Username/E-mail',
                        ),
                      ),
                      TextField(
                        controller: model.getPasswordController(),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              model.login();
                            },
                            child: Text('LOGIN'),
                          ),
                          FlatButton(onPressed: null, child: Text('REGISTER')),
                        ],
                      )
                    ])),
              ),
            ],
          ),
        ),
      )
    );
  }
}
