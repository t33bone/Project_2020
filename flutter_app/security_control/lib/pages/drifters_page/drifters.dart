import 'package:flutter/material.dart';

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
      child: Row(
        children: [
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
          )
        ],
      ),
    );
  }

  Widget _statusSection() {
    //TODO: get rid of static test names & GoPiGo
    final List<String> _nametest = <String>['te321', 'p444ka', 'thjn'];
    final List<GoPiGo> gopigolisttest = <GoPiGo>[
      GoPiGo('te321', 23),
      GoPiGo('p444ka', 46),
      GoPiGo('thjn', 75)
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
            for (var i in gopigolisttest) _goPiGotestListTile(i),
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
