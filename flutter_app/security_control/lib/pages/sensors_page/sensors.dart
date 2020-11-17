import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'sensors_viewmodel.dart';


class SensorsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SensorsViewModel>.reactive(
    viewModelBuilder: () => SensorsViewModel(),
    builder: (context, model, child) =>
    Scaffold(
    )
    );
  }

}