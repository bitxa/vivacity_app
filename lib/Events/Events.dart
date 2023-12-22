import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('EVENTOS'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Fiestas'),
              Tab(text: 'Conciertos'),
              Tab(text: 'Casa abierta'),
              // Add more tabs if needed
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildEventList(context),
            _buildEventList(context),
            _buildEventList(context),
            _buildEventList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList(BuildContext context) {
    List<Map<String, dynamic>> events = [
      {
        'title': 'WORK PARTY, SAUCES',
        'subtitle': 'Hoy, 18:00',
        'imageUrl': 'https://example.com/event1.jpg',
      },
      // Add more event maps
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '¿Qué te apetece hacer hoy?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (context, index) {
              var event = events[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.network(event['imageUrl']),
                    ListTile(
                      title: Text(event['title']),
                      subtitle: Text(event['subtitle']),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
