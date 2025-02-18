import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroupChatPage.dart';
import 'InformationPage.dart';

void main() {
  runApp(const CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Instagram-Messenger",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.info_circle, size: 25, color: CupertinoColors.activeBlue),
          onPressed: () {
            _showInfoDialog(context);
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [


            // Search
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(placeholder: "Search Contacts", style: TextStyle(color: CupertinoColors.white)),
            ),
            SizedBox(height: 10),



            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 6,
                itemBuilder: (context, index) {
                  List<Map<String, String>> stories = [
                    {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg"},
                    {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg"},
                    {"name": "John Lloyd Guevarra", "image": "images/JL.jpg"},
                    {"name": "Michael De Ramos", "image": "images/mike.jpg"},
                  ];

                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "images/sir.jpg",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.activeBlue,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: CupertinoColors.white, width: 2),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.add,
                                    color: CupertinoColors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Your Story",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    );
                  } else {
                    int storyIndex = index - 1;
                    if (storyIndex < stories.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  stories[storyIndex]["image"]!,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              stories[storyIndex]["name"]!,
                              style: const TextStyle(fontSize: 12, color: CupertinoColors.white),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }
                },
              ),
            ),
            // Group Chat Button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const GroupChatPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/sir.jpg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "DevOps Gc",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: CupertinoColors.white),
                      ),
                    ),
                    const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.systemGrey),
                  ],
                ),
              ),
            ),
            //  "InformationPage" Group Chat Button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const InformationPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/shield.jpg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Information Page",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: CupertinoColors.white),
                      ),
                    ),
                    const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.systemGrey),
                  ],
                ),
              ),
            ),
            // New section for displaying contact details
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  var participant = participants[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GestureDetector(
                      onTap: () {

                        _showParticipantDialog(context, participant);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              participant["image"]!,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  participant["name"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Info
  void _showInfoDialog(BuildContext context) {
    List<Map<String, String>> members = [
      {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg"},
      {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg"},
      {"name": "John Lloyd Guevarra", "image": "images/JL.jpg"},
      {"name": "Michael De Ramos", "image": "images/mike.jpg"},
    ];

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Group Members', style: TextStyle(color: CupertinoColors.white)),
          content: Container(
            height: 250,

            child: SingleChildScrollView(
              child: Column(
                children: List.generate(members.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            members[index]["image"]!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          members[index]["name"]!,
                          style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Show  information dialog
  void _showParticipantDialog(BuildContext context, Map<String, String> participant) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(participant["name"]!, style: const TextStyle(color: CupertinoColors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  participant["image"]!,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Email: ${participant["email"]}",
                style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
              ),
              Text(
                "Phone: ${participant["phone"]}",
                style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
              ),
            ],
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

//  Data
List<Map<String, String>> participants = [
  {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg", "email": "caparrachristian47@gmail.com", "phone": "+639942060319"},
  {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg", "email": "JhunielGalang@gmail.com", "phone": "+63123456789"},
  {"name": "John Lloyd Guevarra", "image": "images/JL.jpg", "email": "johnlloydguevarra0405@gmail.com", "phone": "+639106284501"},
  {"name": "Michael De Ramos", "image": "images/mike.jpg", "email": "deramosmichael27@gmail.com", "phone": "+639871654565"},
];
