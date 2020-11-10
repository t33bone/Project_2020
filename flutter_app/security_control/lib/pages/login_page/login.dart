import 'package:flutter/material.dart';


// Login screen will be implemented here.

// It should be the first Page, and it will do the login silently if
// set to do so (remember password setting...)

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock,
              color: Theme.of(context).primaryColor,
              size: 200
            ),
            Text(
              'Verisure 2 tms.',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              margin: EdgeInsets.all(16), // Change to size instead of margin for larger screens
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child:
                  Column(
                    children: <Widget> [
                      TextField(
                        decoration: InputDecoration(
                        hintText: 'Username/E-mail',
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                        border: UnderlineInputBorder(

                        )
                      ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface
                            ),
                            border: UnderlineInputBorder(

                            )
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ElevatedButton(onPressed: (){
                            Navigator.pushReplacementNamed(context, '/HomePage');
                          },
                          child: Text('LOGIN'),
                          ),
                          FlatButton(onPressed: null,
                              child: Text('REGISTER')),
                        ],
                      )
                    ]
                  )
            ),

          ],
        ),
      ),
    );
  }
}