import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'drone_viewmodel.dart';

class DronePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DroneViewModel>.reactive(
        viewModelBuilder: () => DroneViewModel(),
        builder: (context, model, child) =>
          Scaffold(

          )
    );
  }
}
