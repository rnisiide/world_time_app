import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'America/Sao_Paulo',
        location: 'Foz do Iguaçu',
        flag: 'brasil.png'),
    WorldTime(
        url: 'America/Argentina/Buenos_Aires',
        location: 'Buenos Aires',
        flag: 'argentina.png'),
    WorldTime(
        url: 'America/Asuncion', location: 'Assunção', flag: 'paraguay.png'),
    WorldTime(url: 'Europe/London', location: 'Londres', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlim', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        url: 'America/New_York', location: 'Nova Iorque', flag: 'usa.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tóquio', flag: 'japan.png'),
    WorldTime(
        url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
