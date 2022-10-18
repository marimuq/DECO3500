import 'package:flutter/material.dart';

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
  Widget mainWidget = Profile();

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
                  title: const Text('My Profile'),
                  onTap: () {
                    setState(() {
                      mainWidget = Profile();
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

class Profile extends StatelessWidget {
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
          ])),
    );
  }
}

class TripBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trip Board',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black45),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Activities'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Activities()),
                );
              },
            ),
          ],
        ));
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
