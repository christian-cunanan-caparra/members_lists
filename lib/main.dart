import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Activity in DevOps'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.info, size: 25),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Members'),
                  content: Container(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMemberRow('images/ChristianCaparra.jpg', 'Christian Caparra'),
                          SizedBox(height: 10),
                          _buildMemberRow('images/JL.jpg', 'John Lloyd Guevarra'),
                          SizedBox(height: 10),
                          _buildMemberRow('images/ChristianCaparra.jpg', 'Christian Caparra'),
                          SizedBox(height: 10),
                          _buildMemberRow('images/mike.jpg', 'Michael De Ramos'),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text(
                        'Close',
                        style: TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'images/JL.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: John Lloyd Guevarra',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Email: johnlloydguevarra0405@gmail.com'),
                        Text('Address: San Nicolas, San Luis, Pampanga'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a member row for the dialog
  Widget _buildMemberRow(String imagePath, String name) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}