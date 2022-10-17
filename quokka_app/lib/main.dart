import 'package:flutter/material.dart';

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
            title: Text('Quokka'),
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
                  title: Text('Trip Board'),
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

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
            'Get started and set up your ground trip! Ideate and share ideas with your group.\n\n\n Trip Board Name'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter a name',
            ),
          ),
        ),
        Text(
            "Add one or more destinations to your trip board to present to your group!"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a destination',
            ),
          ),
        ),
        Text("Add dates to your trip board to present to your group!"),
        Text("Invite your members to share and vote in your trip board"),
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
    );
  }
}

class TripBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
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
              child: Text('Destinations'),
              onPressed: () {
                Text('pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Destinations()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Dates'),
              onPressed: () {
                Text('pressed');
              },
            ),
            ElevatedButton(
              child: Text('Flights'),
              onPressed: () {
                Text('pressed');
              },
            ),
            ElevatedButton(
              child: Text('Accomodation'),
              onPressed: () {
                Text('pressed');
              },
            ),
            ElevatedButton(
              child: Text('Activities'),
              onPressed: () {
                Text('pressed');
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
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Add New Destinations'),
                ),
              ],
            ),
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
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/brisbane/gallery_of_modern_arts.jpg',
                    width: 100, fit: BoxFit.fill),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Gallery of Modern Arts')],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
