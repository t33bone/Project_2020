import 'dart:async'; //maps
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //maps

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
  //final _name = <String>['test1', 'pekka', 'turpeinen'];
  final gopigolist = <GoPiGo>[];

  //maps stuff
  //TODO: replace test markers
  final Set<Marker> _checkpoints = {
    Marker(
        markerId: MarkerId("gopigo_chkp_1"),
        position: LatLng(65.060803, 25.469838),
        infoWindow: InfoWindow(title: 'checkpoint 1')),
    Marker(
        markerId: MarkerId("gopigo_chkp_2"),
        position: LatLng(65.061405, 25.464516),
        infoWindow: InfoWindow(title: 'checkpoint 2')),
    Marker(
        markerId: MarkerId("gopigo_chkp_3"),
        position: LatLng(65.059292, 25.467799),
        infoWindow: InfoWindow(title: 'checkpoint 3')),
    Marker(
        markerId: MarkerId("gopigo_chkp_4"),
        position: LatLng(65.058998, 25.463282),
        infoWindow: InfoWindow(title: 'checkpoint 4')),
    /*Marker(
        markerId: MarkerId("gopigo_car_1"),
        position: LatLng(65.059559, 25.469848),
        icon: BitmapDescriptor.fromAsset(
            'lib/images/baseline_local_taxi_black_18dp.png')),*/
  };
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(65.059029, 25.466243);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

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
            GoogleMap(
              markers: _checkpoints,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
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
            /*Row(
            children: [
              /* GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  ),*/
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text('Map Section goes Here',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),*/
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
      onTap: () {},
    );
  }

  //TODO remove, old, unused
  Widget _goPiGotest(GoPiGo device) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  device.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.battery_std,
          //textDirection: ,
        ),
        Text(
          device.batterylevel.toString(),
        ),
      ],
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

//TODO: old, unused, remove?
class GoPiGoSection extends StatefulWidget {
  final String name;
  const GoPiGoSection({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  _GoPiGoSectionState createState() => _GoPiGoSectionState();
}

//TODO: old, unused, remove?
class _GoPiGoSectionState extends State<GoPiGoSection> {
  @override
  Widget build(BuildContext context) {
    // final name = 'asd';
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'testee',
                  style: TextStyle(
                    //TODO: remove temp style
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'name',
                  style: TextStyle(
                    //TODO: remove temp style
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.battery_std,
          //textDirection: ,
        ),
        Text(
          '98%',
        ),
      ],
    );
  }
}
