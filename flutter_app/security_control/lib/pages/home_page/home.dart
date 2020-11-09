import 'package:flutter/material.dart';


// First screen after login (if login required)
// Should have a sidebar available on the left for navigation

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // TO BE REPLACED BY UNIVERSAL APPBAR
        title: Text('Security Control'),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PLACEHOLDER BUTTON
          TextButton(
            onPressed:() {
              //Navigator.pushNamed(context, '/driftersPage')
            },
            child: Text('Drifters'),
          ),

          // PLACEHOLDER BUTTON
          TextButton(
            onPressed:(){
              //Navigator.pushNamed(context, '/picturesPage')
            },
            child: Text('Drifters'),
          )
        ]
      )
    );
  }
}
