import 'package:flutter/material.dart';

//Pictures page

class PicturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pictures')),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Latest Picture',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Image.asset('lib/images/test_img.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'deviceName, dateAndTime',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        //open Drone gallery
                      },
                      child: Text(
                        'Drone',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //open GoPiGo gallery
                      },
                      child: Text(
                        'GoPiGo',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
