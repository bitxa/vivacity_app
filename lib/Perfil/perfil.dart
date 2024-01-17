import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/api/api_client.dart'; // Import your API client

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('PERFIL'),
      ),
      body: ListView(
        children: [
          ProfileHeader(),
          StatisticsSection(),
          OptionsSection(),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(); // Assuming ApiClient is set up

    return FutureBuilder<Uint8List>(
      future: apiClient.getFileByPath(
          "assets/profile/profile.jpg"), // Fetch image asynchronously
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return buildProfileHeader(snapshot.data!);
        } else {
          return Center(child: Text('No Data'));
        }
      },
    );
  }

  Widget buildProfileHeader(Uint8List imageData) {
    return Container(
      color: Colors.teal.shade100,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: MemoryImage(imageData),
          ),
          SizedBox(height: 8),
          Text(
            'James Franco',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Loja, Ecuador',
            style: TextStyle(fontSize: 18),
          ),
          Text('098950892'),
        ],
      ),
    );
  }
}

class StatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatisticItem(
            title: 'Lugares visitados',
            value: '10',
          ),
          StatisticItem(
            title: 'Por visitar',
            value: '20',
          ),
          StatisticItem(
            title: 'Compartidos',
            value: '8',
          ),
        ],
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  final String title;
  final String value;

  const StatisticItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class OptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OptionItem(
            icon: FontAwesomeIcons.calendar,
            title: 'Mi agenda',
          ),
          OptionItem(
            icon: FontAwesomeIcons.mapMarkerAlt,
            title: 'Lugares visitados',
          ),
          OptionItem(
            icon: FontAwesomeIcons.heart,
            title: 'Favoritos',
          ),
          // Add more OptionItem widgets for each option
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const OptionItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
