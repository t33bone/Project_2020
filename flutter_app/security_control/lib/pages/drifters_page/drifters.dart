import 'package:flutter/material.dart';

class DriftersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DriftersPage'),
      ),
      body: ListView(
        children: [
          mapSection,
          statusSection,
          gohomeSection,
        ],
      ),
    );
  }

  Widget mapSection = Card(
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
                  child: Text(
                    'Map Section goes',
                    style: TextStyle(
                      //TODO: remove temp style
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );

  Widget statusSection = Card(
    clipBehavior: Clip.antiAlias,
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'GoPiGo Section Here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          GoPiGoSection(),
          GoPiGoSection(),
        ],
      ),
    ),
  );

  Widget gohomeSection = Card(
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
                    //TODO: remove temp style
                    style: ButtonStyle(
                        //foregroundColor: ,
                        ),
                    onPressed: () {
                      //TODO: return home call sent to GoPiGo:s
                    },
                    child: Text(
                      'Return Home',
                      //TODO: remove temp style
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

class GoPiGoSection extends StatelessWidget {
  const GoPiGoSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'GoPiGoN',
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
