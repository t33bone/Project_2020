import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; //maps
import 'package:latlong/latlong.dart';

//TODO: conform to servers model of GoPiGo
class GoPiGo {
  String name;
  int batterylevel;
  GoPiGo(this.name, this.batterylevel);
}

class DriftersPage extends StatefulWidget {
  @override
  _DriftersPageState createState() => _DriftersPageState();
}

class _DriftersPageState extends State<DriftersPage> {
  //TODO: get rid of static test names
  final gopigolist = <GoPiGo>[];

  // static const LatLng _center = const LatLng(65.059029, 25.466243);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO FINAL: replace temp title
        title: Text('DriftersPage'),
      ),
      body: ListView(
        children: <Widget>[
          _mapSection(),
          _statusSection(),
          _gohomeSection(),
        ],
      ),
    );
  }

  Widget _mapSection() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        //TODO make this dynamic size for bigger/smaller screens
        height: 300.0,
        width: 350.0,
        child: Stack(
          children: [
            new FlutterMap(
              options: new MapOptions(
                center: new LatLng(65.059029, 25.466243),
                zoom: 15.0,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 26.0,
                      height: 26.0,
                      point: LatLng(65.060803, 25.469838),
                      builder: (ctx) => new Container(
                        child: new FlutterLogo(),
                      ),
                    ),
                    new Marker(
                      width: 26.0,
                      height: 26.0,
                      point: LatLng(65.061405, 25.464516),
                      builder: (ctx) => new Container(
                        child: new FlutterLogo(),
                      ),
                    ),
                    new Marker(
                      width: 26.0,
                      height: 26.0,
                      point: LatLng(65.059292, 25.467799),
                      builder: (ctx) => new Container(
                        child: new FlutterLogo(),
                      ),
                    ),
                    new Marker(
                      width: 26.0,
                      height: 26.0,
                      point: LatLng(65.058998, 25.463282),
                      builder: (ctx) => new Container(
                        child: new FlutterLogo(),
                      ),
                    )
                  ],
                ),
              ],
              children: <Widget>[
                TileLayerWidget(
                    options: TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'])),
                MarkerLayerWidget(
                    options: MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 26.0,
                      height: 26.0,
                      point: LatLng(65.058998, 25.461282),
                      builder: (ctx) => Container(
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                )),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.0,
                    child: Card(
                      //color: Theme.of(context).backgroundColor,
                      child: Container(
                        //padding: const EdgeInsets.all(8),
                        child: Text('Map Section goes Here',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusSection() {
    //TODO: get rid of static test names & GoPiGo
    final List<String> _nametest = <String>['te321', 'p444ka', 'thjn'];
    final List<GoPiGo> gopigolisttest = <GoPiGo>[
      GoPiGo('test car1', 23),
      GoPiGo('BoB', 46),
      GoPiGo('gopigo5', 75)
    ];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            //TODO FINAL: remove text
            Text(
              'GoPiGo Section Here',
              style: Theme.of(context).textTheme.headline6,
            ),
            for (var i in gopigolisttest)
              Column(
                children: [
                  Divider(),
                  _goPiGotestListTile(i),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _pushGoPiGoSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<GoPiGo>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('test settings'),
            ),
            body: Card(
              clipBehavior: Clip.antiAlias,
              child: ListView(
                children: [
                  Text("setting 2"),
                  Divider(),
                  Text("setting 3"),
                  Divider(),
                  Text("data"),
                  //context.dependOnInheritedWidgetOfExactType<ListTile>(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //better version of gopigotest
  //TODO rename this
  Widget _goPiGotestListTile(GoPiGo device) {
    return ListTile(
      leading: Icon(
        Icons.commute,
      ),
      title: Text(
        device.name,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Container(
        //icon sizes adjusted to match material design
        width: 48,
        height: 48,
        padding: EdgeInsets.symmetric(vertical: 4.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              Icons.battery_std,
            ),
            Text(
              //TODO: add % to end of string
              device.batterylevel.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      onTap: _pushGoPiGoSettings,
    );
  }

  Widget _gohomeSection() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        //TODO: return home call sent to GoPiGo:s
                      },
                      child: Text('Return Home',
                          style: Theme.of(context).textTheme.button),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
