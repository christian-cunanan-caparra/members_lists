import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
// ano bagoaaa
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> chats = [
    {"name": "Christian Caparra", "message": "caparrachristian47@gmail.com", "image": "images/ChristianCaparra.jpg"},
    {"name": "Christian Caparra", "message": "Sent Thursday", "image": "images/MariaClara.jpg"},
    {"name": "Michael De Ramos", "message": "deramosmichael27@gmail.com", "image": "images/mike.jpg"},
    {"name": "John Lloyd Guevarra", "message": "johnlloydguevarra0405@gmail.com", "image": "images/JL.jpg"},
    {"name": "Jhuniel Galang", "message": "Sent", "image": "images/ChristianCaparra.jpg"},
    {"name": "Christian Caparra", "message": "Reacted to your message", "image": "images/ChristianCaparra.jpg"},
  ];

  // Show chat information in a dialog pampadami
  void _showChatDialog(String name, String image, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('$name\'s Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white)),
              SizedBox(height: 10),
              Text(message, style: TextStyle(color: CupertinoColors.systemGrey)),
            ],
          ),
          actions: [
            CupertinoButton(
              child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Instagram-Messenger", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: Icon(CupertinoIcons.chevron_back, size: 25),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.video_camera, size: 25),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.info, size: 25),
              onPressed: _showMembersDialog, //
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search Bar with Left and Right Margin
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CupertinoSearchTextField(placeholder: "Ask Meta AI or Search"),
              ),
              // Add spacing below search bar
              SizedBox(height: 10),

              // Horizontal Story Section
              Container(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: chats.length + 1, // Extra count for "Add Story"
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Add Story Icon
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    "images/ChristianCaparra.jpg", // User's profile image
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
                                    child: Icon(
                                      CupertinoIcons.add,
                                      color: CupertinoColors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Your Story",
                              style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Existing Chat Avatars
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                chats[index - 1]["image"]!,
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              chats[index - 1]["name"]!,
                              style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),

              // Chat List
              SizedBox(height: 10),
              CupertinoScrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Prevents double scrolling
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _showChatDialog(
                          chats[index]["name"]!,
                          chats[index]["image"]!,
                          chats[index]["message"]!,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                chats[index]["image"]!,
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
                                  SizedBox(height: 5),
                                  Text(
                                    chats[index]["name"]!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                  Text(
                                    chats[index]["message"]!,
                                    style: TextStyle(color: CupertinoColors.systemGrey),
                                  ),
                                ],
                              ),
                            ),
                            Icon(CupertinoIcons.camera, color: CupertinoColors.systemGrey),
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
      ),
    );
  }

  // Members Dialog
  void _showMembersDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        // Calculate the width based on the number of items
        double dialogWidth = 50.0 * chats.length + 20.0; // 50 is the image width, 20 is padding space

        return CupertinoAlertDialog(
          title: Text('Members'),
          content: Container(
            width: dialogWidth, // Dynamically set the width based on items
            height: 80, // Adjust height to fit images properly
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll horizontally
              child: Row(
                children: List.generate(chats.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipOval(
                      child: Image.asset(
                        chats[index]["image"]!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          actions: [
            CupertinoButton(
              child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }






}
