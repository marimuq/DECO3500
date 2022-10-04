import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> main() async {
  // Initialize database
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute('PRAGMA foreign_keys = ON ' +
          'CREATE TABLE users(uid INTEGER PRIMARY KEY, name TEXT, ' +
          'partyid INTEGER, eventid INTEGER, attendance INTEGER');
    },
    version: 1,
  );

  var amanda = const User(
    uid: 01,
    name: 'Amanda',
    partyid: 01,
    eventid: 01,
    attendance: 0,
  );
  print(await users());

  runApp(const Quokka());
}

Future<void> insertUser(User user) async {
  final db = await database;

  await db.insert(
    'users',
    user.toMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<User>> users() async {
  final db = await database;

  // query for all users
  final List<Map<String, dynamic>> maps = await db.query('users');

  // convert list
  return List.generate(maps.length, (i) {
    return User(
      uid: maps[i]['uid'],
      name: maps[i]['name'],
      partyid: maps[i]['partyid'],
      eventid: maps[i]['eventsid'],
      attendance: maps[i]['attendance'],
    );
  });
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
    return const Scaffold(
      body: Text('My Profile'),
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
                const Text('pressed');
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
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 200,
                        child: const Text(
                          'Gallery of Modern Arts\n',
                          style: TextStyle(fontSize: 13),
                        )),
                    Container(
                      width: 200,
                      child: const Text(
                        'The Gallery of Modern Arts is an art museum located within the Queensland Cultural Centre in South Bank, Brisbane. Owned by the Queensland Government, it features local artists as well as international exhibitions.',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        'Duration: 2h',
                        style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        'Dates: Any',
                        style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/brisbane/brisbane_city_hall.jpg',
                    width: 100, fit: BoxFit.fill),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 200,
                        child: const Text(
                          'Brisbane City Hall Tour\n',
                          style: TextStyle(fontSize: 13),
                        )),
                    Container(
                      width: 200,
                      child: const Text(
                        'Discover the secrets of the heritage listed Brisbane City Hall building with a guided tour. Found at the heart of the city, discover the secrets of this magnificent building.',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        'Duration: 45m',
                        style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: const Text(
                        'Dates: Multiple',
                        style: TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Defining user data models
class User {
  final int uid;
  final String name;
  final int partyid;
  final int eventid;
  final int attendance;

  const User(
      {required this.uid,
      required this.name,
      required this.partyid,
      required this.eventid,
      required this.attendance});

  // Convert a User into a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'partyid': partyid,
      'eventid': eventid,
      'attendance': attendance,
    };
  }

  // Implement toString
  @override
  String toString() {
    return 'User{uid: $uid, name: $name, partyid: $partyid, ' +
        'eventid: $eventid, attendance: $attendance}';
  }
}
