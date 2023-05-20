import 'package:flutter/material.dart';

class infoUserCard extends StatelessWidget{

  final String userName;
  final String computerName;

  const infoUserCard({
    super.key,
    required this.userName,
    required this.computerName
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0)
      ),
      color: const Color(0xffffffff),
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Text(userName, style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1),
            Text(computerName, style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1),
          ],
        ),
      ),
    );
  }

}