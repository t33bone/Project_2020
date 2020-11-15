import 'package:flutter/material.dart';

//Gallery page

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Item selectedGallery;
  List<Item> galleries = <Item>[
    const Item('Drone', Icon(Icons.airplanemode_active_rounded)),
    const Item('GoPiGo', Icon(Icons.directions_car_rounded)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: DropdownButton<Item>(
              isExpanded: true,
              hint: Text('Select a device'),
              iconSize: 40,
              value: selectedGallery,
              onChanged: (Item value) {
                setState(() {
                  selectedGallery = value;
                });
              },
              items: galleries.map((Item device) {
                return DropdownMenuItem<Item>(
                  value: device,
                  child: Row(
                    children: <Widget>[
                      device.icon,
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        device.name,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          selectedGallery != null
              ? selectedGallery.name == 'Drone'
                  ? CreatePictureCard(
                      selectedGallery: selectedGallery, image: 'drone_test_img')
                  : CreatePictureCard(
                      selectedGallery: selectedGallery,
                      image: 'gopigo_test_img')
              : DeviceNotSelected(),
        ],
      ),
    );
  }
}

class DeviceNotSelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Device not selected',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePictureCard extends StatelessWidget {
  final Item selectedGallery;
  final String image;

  CreatePictureCard({this.selectedGallery, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '${selectedGallery != null ? selectedGallery.name : "Device not selected"}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: Image.asset('lib/images/$image.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${selectedGallery != null ? selectedGallery.name : "Device not selected"} , dateAndTime',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
