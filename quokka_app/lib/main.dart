import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

int royalBotanicVoted = -1;

void main() {
  runApp(const Quokka());
}

class Quokka extends StatefulWidget {
  const Quokka({super.key});

  @override
  State<Quokka> createState() => _QuokkaState();
}

class _QuokkaState extends State<Quokka> {
  Widget mainWidget = Start();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quokka',
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Quokka'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Getting Started'),
                  onTap: () {
                    setState(() {
                      mainWidget = Start();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Trip Board'),
                  onTap: () {
                    setState(() {
                      mainWidget = TripBoard();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    setState(() {
                      mainWidget = Settings();
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          body: mainWidget,
        ),
      ),
    );
  }
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                  const Text(
                      ' Get started and set up your ground trip! \n Ideate and share ideas with your group.\n\n\n Trip Board Name'),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter a name',
                      ),
                    ),
                  ),
                  Text(
                      " Add a destination to your trip board to present to your group!"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a destination',
                      ),
                    ),
                  ),
                  Text(
                      " Add dates to your trip board to present to your group!"),
                  SfDateRangePicker(),
                  Text(
                      " Invite your members to share and vote in your trip board"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter an email address',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Next'),
                    onPressed: () {
                      Text('pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Congratulations()),
                      );
                    },
                  ),
                ])))));
  }
}

class TripBoard extends StatelessWidget {
  const TripBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Buddy QLD Trip Board', textAlign: TextAlign.left),
                  Icon(Icons.dehaze)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.blueGrey,
                          child: ElevatedButton(
                            child: Text('Destinations'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Destinations()),
                              );
                            },
                          ))),
                  const SizedBox(width: 10),
                  InkWell(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.blueGrey,
                          child: ElevatedButton(
                            child: Text('Dates'),
                            onPressed: () {
                              null;
                            },
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.blueGrey,
                          child: ElevatedButton(
                            child: Text('Flights'),
                            onPressed: () {
                              null;
                            },
                          ))),
                  const SizedBox(width: 10),
                  InkWell(
                      child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.blueGrey,
                          child: ElevatedButton(
                            child: Text('Accommodations'),
                            onPressed: () {
                              null;
                            },
                          ))),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Daily Planner',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              InkWell(
                child: Container(
                  width: 400,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('Activities'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Activities()),
                      );
                    },
                  ),
                ),
              )
            ])));
  }
}

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timeline'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Activities()),
              );
            }),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Card(
                margin: EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.green,
                ),
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 35,
                child: Container(
                  height: double.infinity,
                  width: 5,
                  color: Colors.blue,
                ))
          ],
        ));
  }
}

class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Swipe and prioritise with the destination card! Rate and/ or reject destinations. \nIf you are unsure, click on the image to browse events and activities!"),
              ],
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Gold Coast'),
                    subtitle: Text(
                      'Queensland, Australia',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Image here',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('Rate'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_down),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //Image.asset('assets/card-sample-image.jpg'),
                  //Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Melbourne'),
                    subtitle: Text(
                      'Victoria, Australia',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Image here',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('Rate'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_down),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //Image.asset('assets/card-sample-image.jpg'),
                  //Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Brisbane'),
                    subtitle: Text(
                      'Queensland, Australia',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Image here',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('Rate'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_down),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //Image.asset('assets/card-sample-image.jpg'),
                  //Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  child: Text('Add New Destinations'),
                  onPressed: () {
                    Text('pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DestinationSearch()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Board Settings'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Destinations'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Text('Nominating'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                      Text('Voting'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Dates'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Text('Nominating'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                      Text('Voting'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Flights'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Text('Nominating'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                      Text('Voting'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Accomodation'),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Text('Nominating'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                      Text('Voting'),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Congratulations! You've just made your ground trip."),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TripBoard()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.timeline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Timeline()),
            );
          }),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                    'assets/melbourne/royal_botanic_gardens_victoria.jpg',
                    width: 100,
                    fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child: const Text(
                          'Royal Botanic Gardens Victoria\nDuration: 1-2 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {
                            _displayDialog(context, "royal_botanic_voted", 1);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          onPressed: () {
                            _displayDialog(context, "royal_botanic_voted", 0);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/melbourne/eureka_skydeck.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child: const Text('Eureka Skydeck\nDuration: 1-2 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/melbourne/old_melbourne_gaol.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child:
                          const Text('Old Melbourne Gaol\nDuration: 1-2 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/melbourne/queen_victoria_market.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child: const Text(
                          'Queen Victoria Market\nDuration: 2-3 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/melbourne/shrine_of_remembrance.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child: const Text(
                          'Shrine of Remembrance\nDuration: 1-2 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/melbourne/melbourne_zoo.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 200,
                      child: const Text('Melbourne Zoo\nDuration: 2-3 hours'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          color: Colors.grey,
                          onPressed: () {
                            null;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _displayDialog(BuildContext context, String activity, int vote) async {
    switch (activity) {
      case "royal_botanic_voted":
        royalBotanicVoted = vote;
        print("vote variable changed");
        break;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
                  content: const Text('Activity added to timeline'),
                  actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                )
              ]));
        });
  }
}

class DestinationSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: <Widget>[
          const Text('Search for your dream destination'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a destination',
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
