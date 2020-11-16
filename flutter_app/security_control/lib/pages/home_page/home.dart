import 'package:flutter/material.dart';
import 'package:security_control/pages/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

// First screen after login (if login required)
// Should have a sidebar available on the left for navigation

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              // TO BE REPLACED BY UNIVERSAL APPBAR
              title: Text('Security Control'),
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // PLACEHOLDER BUTTON
                  TextButton(
                    onPressed: (){
                      model.driftersButtonOnPressed();
                    },
                    child: Text('Drifters'),
                  ),

                  // PLACEHOLDER BUTTON
                  TextButton(
                    onPressed: () {
                      model.picturesButtonOnPressed();
                    },
                    child: Text('Pictures'),
                  ),

                  // PLACEHOLDER BUTTON
                  TextButton(
                    onPressed: () {
                      model.settingsButtonOnPressed();
                    },
                    child: Text('Settings'),
                  )
            ])));
  }
}
