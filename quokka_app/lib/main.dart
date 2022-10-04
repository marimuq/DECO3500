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
  Widget mainWidget = Profile();

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
                  title: Text('My Profile'),
                  onTap: () {
                    setState(() {
                      mainWidget = Profile();
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

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('My Profile'),
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
              child: Text('Activities'),
              onPressed: () {
                Text('pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Activities()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Timeline'),
              onPressed: () {
                Text('pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Timeline()),
                );
              },
            )
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

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.circle, size: 14, color: Colors.pink),
                      ),
                      TextSpan(
                        text: " User 1\n",
                      ),
                      WidgetSpan(
                        child: Icon(Icons.square, size: 14, color: Colors.blue),
                      ),
                      TextSpan(
                        text: " User 1\n",
                      ),
                      WidgetSpan(
                        child: Icon(Icons.star, size: 14, color: Colors.green),
                      ),
                      TextSpan(
                        text: " User 3\n",
                      ),
                      WidgetSpan(
                        child: Icon(Icons.eco, size: 14, color: Colors.purple),
                      ),
                      TextSpan(
                        text: " User 4\n",
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
