import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier{

  //TODO: Move texts from buttons here too

  NavigationService _navigationService = locator<NavigationService>();

  bool _loginSuccess = false;
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  // No idea if this is the right way to do this
  TextEditingController getUserNameController(){
    return _userNameController;
  }
  // Likely not.
  TextEditingController getPasswordController(){
    return _passwordController;
  }

  void login(){
    String username = _userNameController.text;
    String password = _passwordController.text;

    //TODO: implement actual login logic
    //if(username != ""){
      _loginSuccess = true;
      _navigationService.navigateToAndReplace(Routes.homePage);
    //}

  }


}